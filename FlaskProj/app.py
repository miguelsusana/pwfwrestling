from flask import Flask, jsonify, request
from flask_cors import CORS
from helper import (
    get_champions_table, 
    get_timesheld,
    get_longestreigns,
    get_combined_days,
    get_title_history,
    get_roster
)
from roster_db import (
    add_wrestler_to_database,
    delete_wrestler_from_database,
    get_retired_titles,
    get_all_wrestlers,
    get_all_titles,
    get_title_url,
    get_all_titles_by_id,
    get_all_events,
    get_active_titles,
    get_wrestler_by_id,
    create_event_in_database,
    delete_event_from_database,
    edit_event_in_database,
    update_wrestler_in_database
)

app = Flask(__name__)
app.json.sort_keys = False
CORS(app)

@app.route('/')
def index():
    return 'BACK-END MAIN PAGE'

@app.route('/api/roster', methods=['GET'])
def roster():
    return jsonify(get_roster())

@app.route('/api/roster/<int:wrestler_id>', methods=["GET"])
def get_wrestler(wrestler_id):
    wrestler = get_wrestler_by_id(wrestler_id)
    if wrestler is None:
        return jsonify({"error" : "Wrestler not found."}), 404
    return jsonify(wrestler), 200

@app.route('/api/roster/<int:wrestler_id>', methods=["PUT"])
def update_wrestler(wrestler_id):
    data = request.get_json()
    if not isinstance(data, dict):
        return jsonify({"error": "A JSON request body is required."}), 400

    name = data.get("name")
    status = data.get("status")
    gender = data.get("gender")
    brand = data.get("brand")
    extra = data.get("extra")

    if not isinstance(name, str) or not name.strip():
        return jsonify({"error": "Name is required."}), 400
    if len(name.strip()) > 255:
        return jsonify({"error": "Name must be 255 characters or fewer."}), 400
    if not isinstance(status, str) or status not in {
        "Active", "Inactive", "Free Agent", "Deceased", "Manager"
    }:
        return jsonify({"error": "Invalid status."}), 400
    if not isinstance(gender, str) or gender not in {"Men", "Women"}:
        return jsonify({"error": "Invalid gender."}), 400
    if brand == "":
        brand = None
    if brand is not None and (
        not isinstance(brand, str) or brand not in {"RAW", "SmackDown", "NXT"}
    ):
        return jsonify({"error": "Invalid brand."}), 400
    if extra is not None:
        if not isinstance(extra, str):
            return jsonify({"error": "'Extra' must be text or null."}), 400
        extra = extra.strip() or None
        if extra is not None and len(extra) > 255:
            return jsonify({"error": "'Extra' must be 255 characters or less."}), 400

    updated_data = {
        "name": name.strip(),
        "status": status,
        "gender": gender,
        "brand": brand,
        "extra": extra
    }

    result = update_wrestler_in_database(wrestler_id, updated_data)
    if result.get("success"):
        return jsonify({"id": wrestler_id, **updated_data}), 200
    if result.get("not_found"):
        return jsonify({"error": "Wrestler not found."}), 404
    return jsonify({"error": "Could not update wrestler."}), 500

@app.route("/api/roster", methods=["POST"])
def add_wrestler():
    data = request.get_json()
    if not isinstance(data, dict):
        return jsonify({"error": "A JSON request body is required."}), 400
    name = data.get("name")
    status = data.get("status")
    gender = data.get("gender")
    brand = data.get("brand") or None

    if not isinstance(name, str) or not name.strip():
        return jsonify({"error": "Name is required."}), 400
    if status not in {"Active", "Inactive", "Free Agent", "Deceased", "Manager"}:
        return jsonify({"error": "Invalid status."}), 400
    if gender not in  {"Men", "Women"}:
        return jsonify({"error": "Invalid gender."}), 400
    if brand not in {None, "RAW", "SmackDown", "NXT"}:
        return jsonify({"error": "Invalid brand."}), 400

    data["name"] = name.strip()
    data["brand"] = brand
    result = add_wrestler_to_database(data)

    if not result.get("success"):
        return jsonify({"error" : "Could not add a wrestler."})
    return jsonify(result["wrestler"]), 201

@app.route("/api/roster/<int:wrestler_id>", methods=["DELETE"])
def delete_wrestler(wrestler_id):
    result = delete_wrestler_from_database(wrestler_id)
    if result.get("success"):
        return jsonify(result), 200
    if result.get("not_found"):
        return jsonify({"error": "Wrestler not found."})
    return jsonify({"error": "Could not delete wrestler."})

@app.route('/api/champions', methods=['GET'])
def champions():
    return jsonify(get_champions_table())

@app.route('/api/active_titles', methods=['GET'])
def active_titles():
    return get_active_titles()

@app.route('/api/retired_titles', methods=['GET'])
def retired_titles():
    return get_retired_titles()

@app.route('/api/all_titles', methods=['GET'])
def all_titles():
    return get_all_titles()

@app.route('/api/titles_by_id', methods=['GET'])
def titles_by_id():
    return get_all_titles_by_id()

@app.route('/api/full-roster', methods=['GET'])
def roster_by_id_names():
    return get_all_wrestlers()


@app.route('/api/belt/<belt>', methods=['GET'])
def title_url(belt):
    title_info = {"title_info" : get_title_url(belt), "champ_stats" : [get_timesheld(belt), get_longestreigns(belt), get_combined_days(belt)]}
    return title_info

@app.route('/api/belt/<belt>/history', methods=['GET'])
def title_history(belt):
    return get_title_history(belt)

@app.route('/api/get_events', methods=['GET'])
def events():
    return get_all_events()

@app.route('/api/create_event', methods=['POST']) 
def create_event():
    data = request.get_json()
    if not data:
        return jsonify({"success": False, "error": "Required body not provided"}), 400

    event_args = ["name", "month", "year", "season", "instance_number"]
    missing_fields = [key for key in event_args if key not in data or data[key] is None]

    if missing_fields:
        return jsonify({
            "success": False,
            "error": "Missing required fields",
            "missing" : missing_fields
        }), 400

    result = create_event_in_database(data)
    if result.get("success"):
        return jsonify(result), 201
    return jsonify(result), 400

@app.route('/api/events/<int:event_id>', methods=['DELETE'])
def delete_event(event_id):
    result = delete_event_from_database(event_id)
    if result.get("success"):
        return jsonify(result), 200
    return jsonify(result), 404

@app.route('/api/events/<int:event_id>', methods=['PUT'])
def edit_event(event_id):
    data = request.get_json()
    if not data:
            return jsonify({"success": False, "error": "Required body not provided"}), 400
    
    result = edit_event_in_database(event_id, data)
    if result.get("success"):
            return jsonify(result), 200
    return jsonify(result), 400

if __name__ == '__main__':
    app.run(debug=True, port=8000)


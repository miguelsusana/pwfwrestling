from flask import Flask, jsonify, request
from flask_cors import CORS
from helper import (
    get_champions_table, 
    get_roster_table,
    get_timesheld,
    get_longestreigns,
    get_combined_days,
    get_title_history
)
from roster_db import (
    get_retired_titles,
    get_all_wrestlers,
    get_all_titles,
    get_title_url,
    get_all_titles_by_id,
    get_all_events,
    get_active_titles,
    create_event_in_database,
    delete_event_from_database
)

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
    return 'BACK-END MAIN PAGE'

@app.route('/api/roster', methods=['GET'])
def roster():
    return jsonify(get_roster_table())

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

if __name__ == '__main__':
    app.run(debug=True, port=8000)


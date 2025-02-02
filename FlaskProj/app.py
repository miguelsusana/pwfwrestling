from flask import Flask, jsonify
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
    get_wrestlers_info,
    get_all_titles,
    get_title_url,
    get_all_titles_by_id
)

app = Flask(__name__)
CORS(app)

@app.route('/api/roster', methods=['GET'])
def roster():
    return jsonify(get_roster_table())

@app.route('/api/champions', methods=['GET'])
def champions():
    return jsonify(get_champions_table())

@app.route('/api/retired_titles', methods=['GET'])
def retired_titles():
    return get_retired_titles()

@app.route('/api/all_titles', methods=['GET'])
def all_titles():
    return get_all_titles()

@app.route('/api/titles_by_id', methods=['GET'])
def titles_by_id():
    return get_all_titles_by_id()

@app.route('/api/roster-id-names', methods=['GET'])
def roster_by_id_names():
    return get_wrestlers_info()


@app.route('/api/belt/<belt>', methods=['GET'])
def title_url(belt):
    title_info = {"title_info" : get_title_url(belt), "champ_stats" : [get_timesheld(belt), get_longestreigns(belt), get_combined_days(belt)]}
    return title_info

@app.route('/api/belt/<belt>/history', methods=['GET'])
def title_history(belt):
    return get_title_history(belt)

if __name__ == '__main__':
    app.run(debug=True, port=8000)


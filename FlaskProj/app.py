from flask import Flask, render_template, redirect, jsonify
from flask_cors import CORS
from helper import (
    roster_page_template, 
    get_champions_table, 
    get_roster_table,
    get_retired_titles,
    get_wrestlers_names_id,
    get_all_titles,
    get_title_url,
    get_timesheld,
    get_longestreigns,
    get_combined_days,
    get_title_history,
    get_titles_list_id
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
    return get_titles_list_id()

@app.route('/api/roster-id-names', methods=['GET'])
def roster_by_id_names():
    return get_wrestlers_names_id()


@app.route('/api/belt/<belt>', methods=['GET'])
def title_url(belt):
    title_info = {"title_info" : get_title_url(belt), "champ_stats" : [get_timesheld(belt), get_longestreigns(belt), get_combined_days(belt)]}
    return title_info

@app.route('/api/belt/<belt>/history', methods=['GET'])
def title_history(belt):
    return get_title_history(belt)

"-------------------------------------------------------"

@app.route("/")
def homepage():
    return render_template('index.html')

@app.route("/roster")
def roster_page():
    return roster_page_template()

# CHAMPIONSHIP PAGES
@app.route("/title/<name>")
def title_pages(name):
    try:
        return render_template(f'championship/{name}.html')
    except:
        return redirect('/')

# CHAMPIONSHIP HISTORY PAGES
@app.route("/title/<name>/history")
def title_history_pages(name):
    history_data = load_title_history(name)
    try:
        return render_template(f'title-history/{name}/history.html', history_data=history_data)
    except Exception as e:
        print(e)
        return redirect('/')

@app.route("/debug")
def debug():
    return get_champions_table()


if __name__ == '__main__':
    app.run(debug=True, port=8000)


from roster_db import (
    get_roster_list,
    get_champions, 
    get_timesheld_from_database,
    get_longestreign_from_database,
    get_combined_days_from_database,
    get_title_history_from_database,
    )

def get_roster():
    rows = get_roster_list()
    return [
        {"id": row[0], "name": row[1], "brand": row[2], "gender": row[3]} for row in rows
    ]
    
def get_champions_table():

    champions_dict = get_champions()
    active_titles_dict = {}
    champ_list = []
    print(champions_dict)

    for entry in champions_dict:
        title = entry["title"]
        if title in active_titles_dict:
            active_titles_dict[title] = {'name': [active_titles_dict[title]["name"], entry["name"]], 'image': entry['image']}
        else:
            active_titles_dict[title] = {'name': entry["name"], 'image': entry['image']}

    for k, v in active_titles_dict.items():
        champ_list.append({
            "title" : k,
            "name" : v["name"],
            "image": v["image"]
        })  
        
    return champ_list

def get_timesheld(belt):
    result = get_timesheld_from_database(belt)
    return [{"name" : entry[0], "value": entry[1]} for entry in result]

def get_longestreigns(belt):
    result = get_longestreign_from_database(belt)
    return [{"name": entry[0], "value": entry[1]} for entry in result]

def get_combined_days(belt):
    result = get_combined_days_from_database(belt)
    return [{"name": entry[0], "value": entry[1]} for entry in result]

def get_title_history(belt):
    title_history_lists = get_title_history_from_database(belt)
    return [{"reign_order" : entry[0], "name" : entry[1], "match_description" : entry[2], "reign_duration" : entry[3]} for entry in title_history_lists]
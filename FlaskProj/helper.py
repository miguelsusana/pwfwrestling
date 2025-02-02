from roster_db import (
    get_roster_list, 
    get_champions, 
    Brand, 
    get_timesheld_from_database,
    get_longestreign_from_database,
    get_combined_days_from_database,
    get_title_history_from_database,
    )

def get_roster_table():
    final_roster_list = []

    smackdown_roster = get_roster_list(Brand.SMACKDOWN)
    raw_roster = get_roster_list(Brand.RAW)
    nxt_roster = get_roster_list(Brand.NXT)

    full_roster = {
        "SmackDown": smackdown_roster,
        "RAW" : raw_roster,
        "NXT" : nxt_roster
    }

    longest_roster = 0
    for roster in full_roster.values():
        if len(roster) >= longest_roster:
            longest_roster = len(roster)

    for i in range(0, longest_roster):
        roster_dict = {}
        for (key, value) in full_roster.items():
            if len(value) <= i:
                roster_dict[key] = ""
            else:
                roster_dict[key] = value[i]

        final_roster_list.append(roster_dict)

    return final_roster_list

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
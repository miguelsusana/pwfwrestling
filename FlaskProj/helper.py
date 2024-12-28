from roster_db import get_roster_list, get_champions, Roster, get_retired_titles, get_wrestler_id_names
from flask import render_template

def roster_page_template():

    final_roster_list = get_roster_table()
    active_titles_dict, champions_list = get_champions_table()

    return render_template(
        "roster.html", 
        final_roster_list=final_roster_list,
        active_titles_dict=active_titles_dict,
        champions_list=champions_list
        )


def get_roster_table():
    final_roster_list = []

    smackdown_roster = get_roster_list(Roster.SMACKDOWN)
    raw_roster = get_roster_list(Roster.RAW)
    nxt_roster = get_roster_list(Roster.NXT)

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

def get_retired_championships():
    get_retired_titles()

def get_wrestlers_names_id():
    return get_wrestler_id_names()
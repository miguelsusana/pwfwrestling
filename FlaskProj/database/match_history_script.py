import pandas as pd
import json

raw = pd.read_excel(r"G:\My Drive\PWF Wrestling\MATCHES\Season 3\Year 3\december\RAW_dec_03.xlsx", usecols=[0,4])
sd = pd.read_excel(r"G:\My Drive\PWF Wrestling\MATCHES\Season 3\Year 3\december\SmackDown!_dec_03.xlsx", usecols=[0,4])
iswar = pd.read_excel(r"G:\My Drive\PWF Wrestling\MATCHES\Season 3\Year 3\december\superstars_dec_03.xlsx", usecols=[0,3])
ppv = pd.read_excel(r"G:\My Drive\PWF Wrestling\MATCHES\Season 3\Year 3\december\armageddon_03.xlsx", usecols=[0,4])

matches_raw = []
matches_sd = []
matches_iswar = []
matches_ppv= []


for i in range(0, len(raw), 3): 
    match_type = raw.iloc[i, 0]        # Row i: Match type
    contestants = raw.iloc[i+1, 0]     # Row i+1: Match contestants
    result = raw.iloc[i+1, 1]          # Row i+1: Match result (in the second column)

    match = {
        "match_type": match_type,
        "contestants": contestants,
        "result": result
    }

    matches_raw.append(match)

for i in range(0, len(sd), 3): 
    match_type = sd.iloc[i, 0]        # Row i: Match type
    contestants = sd.iloc[i+1, 0]     # Row i+1: Match contestants
    result = sd.iloc[i+1, 1]          # Row i+1: Match result (in the second column)

    # Create a match dictionary
    match = {
        "match_type": match_type,
        "contestants": contestants,
        "result": result
    }

    # Add the match dictionary to the list of matches
    matches_sd.append(match)

for i in range(0, len(iswar), 3):  # Step by 4 rows to get each match block (match type, contestants, result)
    # Extract match details
    match_type = iswar.iloc[i, 0]        # Row i: Match type
    contestants = iswar.iloc[i+1, 0]     # Row i+1: Match contestants
    result = iswar.iloc[i+1, 1]          # Row i+1: Match result (in the second column)

    # Create a match dictionary
    match = {
        "match_type": match_type,
        "contestants": contestants,
        "result": result
    }

    # Add the match dictionary to the list of matches
    matches_iswar.append(match)

for i in range(0, len(ppv), 3):  # Step by 4 rows to get each match block (match type, contestants, result)
    # Extract match details
    match_type = ppv.iloc[i, 0]        # Row i: Match type
    contestants = ppv.iloc[i+1, 0]     # Row i+1: Match contestants
    result = ppv.iloc[i+1, 1]          # Row i+1: Match result (in the second column)

    # Create a match dictionary
    match = {
        "match_type": match_type,
        "contestants": contestants,
        "result": result
    }

    # Add the match dictionary to the list of matches
    matches_ppv.append(match)

with open(r".\match_history\season_3\year_3\december\raw_dec_03.json", "w") as json_file:
    json.dump(matches_raw, json_file, indent=4)

with open(r".\match_history\season_3\year_3\december\smackdown_dec_03.json", "w") as json_file:
    json.dump(matches_sd, json_file, indent=4)

with open(r".\match_history\season_3\year_3\december\superstars_dec_03.json", "w") as json_file:
    json.dump(matches_iswar, json_file, indent=4)

with open(r".\match_history\season_3\year_3\december\armageddon_03.json", "w") as json_file:
    json.dump(matches_ppv, json_file, indent=4)


#S3 YEAR 3 FINISHED, EVERYTHING ELSE LEFT TO DO
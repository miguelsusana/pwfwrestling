import pandas as pd
import json

# Step 1: Read data from Excel
df = pd.read_excel("G:\My Drive\PWF Wrestling\TITLES\Main Roster Titles\WWE World Tag Team Championship\WWE World Tag Team Championship History.xlsx", usecols=[0,1,2,3,4])

df.rename(columns= {"Posição" : "ID", "Nome": "Champion Name"}, inplace=True)
df = df.where(pd.notnull(df), None)

data_dict = df.to_dict(orient='records')
print(data_dict)

# Step 3: Write the dictionary to a JSON file
with open("./title_history/wwe_world_tag_team_title.json", "w") as json_file:
    json.dump(data_dict, json_file, indent=4)

    #FALTAM OS MAIN ROSTER/NXT TITLES
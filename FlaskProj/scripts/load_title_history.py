import json
import os

def load_title_history(title_name: str):
    title_name = title_name.replace("-championship", "_title")
    file_path = os.path.join("title_history", f"{title_name}.json")
    with open(file_path, 'r') as f:
        history_data = json.load(f)
    return history_data
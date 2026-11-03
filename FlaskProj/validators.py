def validate_match_payload(data):
    if not isinstance(data, dict):
        return None, "A JSON request body is required."

    match_type = data.get("match_type")
    if not isinstance(match_type, str) or not match_type.strip():
        return None, "match_type is required."
    match_type = match_type.strip()
    if len(match_type) > 255:
        return None, "match_type must be 255 characters or fewer."

    description = data.get("match_description")
    if not isinstance(description, str) or not description.strip():
        return None, "match_description is required."

    event_id = data.get("event_id")
    if type(event_id) is not int or event_id <= 0:
        return None, "A valid event_id is required."

    championship = data.get("championship_match")
    if type(championship) is not bool:
        return None, "championship_match must be true or false."

    title_ids = data.get("title_ids", [])
    if not isinstance(title_ids, list):
        return None, "title_ids must be a list."

    if any(type(title_id) is not int or title_id <= 0 for title_id in title_ids):
        return None, "Each title_id must be a positive integer."

    if len(title_ids) != len(set(title_ids)):
        return None, "A title cannot be selected more than once."

    if championship and not title_ids:
        return None, "Select at least one title for a championship match."

    if not championship and title_ids:
        return None, "title_ids must be empty for a non-title match."

    is_unification = data.get("is_unification", False)
    if type(is_unification) is not bool:
        return None, "is_unification must be true or false."

    if is_unification and (not championship or len(title_ids) < 2):
        return None, "A unification match needs at least two selected titles."

    stipulation = data.get("special_stipulation")
    if stipulation is not None:
        if not isinstance(stipulation, str):
            return None, "special_stipulation must be text or null."
        stipulation = stipulation.strip() or None
        if stipulation is not None and len(stipulation) > 255:
            return None, "special_stipulation must be 255 characters or fewer."

    notes = data.get("notes")
    if notes is not None and not isinstance(notes, str):
        return None, "notes must be text or null."

    is_main_event = data.get("is_main_event", False)
    if type(is_main_event) is not bool:
        return None, "is_main_event must be true or false."

    is_pre_show = data.get("is_pre_show", False)
    if type(is_pre_show) is not bool:
        return None, "is_pre_show must be true or false."

    participants = data.get("participants", [])
    if not isinstance(participants, list):
        return None, "participants must be a list."

    valid_roles = {"Competitor", "Manager", "Special Referee"}
    seen_wrestlers = set()
    team_numbers = set()
    competitor_teams = set()
    cleaned_participants = []

    for person in participants:
        if not isinstance(person, dict):
            return None, "Each participant must be an object."

        wrestler_id = person.get("wrestler_id")
        if type(wrestler_id) is not int or wrestler_id <= 0:
            return None, "Each participant needs a valid wrestler_id."
        if wrestler_id in seen_wrestlers:
            return None, "A wrestler cannot be listed more than once."
        seen_wrestlers.add(wrestler_id)

        role = person.get("role")
        if not isinstance(role, str) or role not in valid_roles:
            return None, "Invalid participant role."

        team_number = person.get("team_number")
        if role in {"Competitor", "Manager"}:
            if type(team_number) is not int or team_number <= 0:
                return None, f"{role} participants need a team_number."
            team_numbers.add(team_number)
        elif team_number is not None:
            return None, "A special referee cannot belong to a team."

        if role == "Competitor":
            competitor_teams.add(team_number)

        cleaned_participants.append({
            "wrestler_id": wrestler_id,
            "role": role,
            "team_number": team_number,
        })

    if not participants:
        return None, "A match needs competitors on at least two teams."

    if len(competitor_teams) < 2:
        return None, "A match needs competitors on at least two teams."

    if team_numbers != competitor_teams:
        return None, "Every team must have at least one competitor."

    validated_data = {
        "event_id": event_id,
        "match_type": match_type,
        "special_stipulation": stipulation,
        "championship_match": championship,
        "title_ids": title_ids,
        "is_unification": is_unification,
        "match_description": description.strip(),
        "result_type": data.get("result_type"),
        "notes": notes,
        "is_main_event": is_main_event,
        "is_pre_show": is_pre_show,
        "participants": cleaned_participants,
    }
    return validated_data, None

def validate_wrestler_payload(data):
    if not isinstance(data, dict):
        return None, "A JSON request body is required."

    name = data.get("name")
    if not isinstance(name, str) or not name.strip():
        return None, "Name is required."
    name = name.strip()
    if len(name) > 255:
        return None, "Name must be 255 characters or fewer."

    status = data.get("status")
    if not isinstance(status, str) or status not in {
        "Active", "Inactive", "Free Agent", "Deceased", "Manager"
    }:
        return None, "Invalid status."

    gender = data.get("gender")
    if not isinstance(gender, str) or gender not in {"Men", "Women"}:
        return None, "Invalid gender."

    brand = data.get("brand")
    if brand == "":
        brand = None
    if brand is not None and (
        not isinstance(brand, str) or brand not in {"RAW", "SmackDown", "NXT"}
    ):
        return None, "Invalid brand."

    extra = data.get("extra")
    if extra is not None:
        if not isinstance(extra, str):
            return None, "'Extra' must be text or null."
        extra = extra.strip() or None
        if extra is not None and len(extra) > 255:
            return None, "'Extra' must be 255 characters or fewer."

    return {
        "name": name,
        "status": status,
        "gender": gender,
        "brand": brand,
        "extra": extra,
    }, None
export const fetchEvents = async () => {
    const response = await fetch('http://127.0.0.1:8000/api/get_events');
    const data = await response.json();
    return data;
}
export const fetchTitlesList = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/active_titles");
    const data = await response.json();
    return data;
}
export const fetchFullRoster = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/full-roster")
    const data = await response.json();
    return data;
}
export const fetchTitlesListByID = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/titles_by_id");
    const data = await response.json();
    return data;
}
export const fetchSpecificTitle = async (belt: string | string[] | undefined) => {
    const response = await fetch(`http://127.0.0.1:8000/api/belt/${belt}`);
    const data = await response.json();
    return data;
}
export const fetchTitlesHistory = async (belt: string | string[] | undefined) => {
    const response = await fetch(`http://127.0.0.1:8000/api/belt/${belt}/history`);
    const data = await response.json();
    return data;
}
export const fetchChampions = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/champions");
    const data = await response.json();
    return data;
}
export const fetchRetiredTitles = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/retired_titles");
    const data = await response.json();
    return data;
}

export const fetchRosterByBrand = async () => {
    const response = await fetch("http://127.0.0.1:8000/api/roster");
    const data = await response.json();
    return data;
};
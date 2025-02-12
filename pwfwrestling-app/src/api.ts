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
    const response = await fetch("http://127.0.0.1:8000/api/full_roster");
    const data = await response.json();
    return data;
}
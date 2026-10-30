export type Wrestler = {
    name: string;
    status: "Active" | "Inactive" | "Free Agent" | "Deceased" | "Manager";
    gender: "Men" | "Women";
    brand: "RAW" | "SmackDown" | "NXT" | null;
    extra: string | null;
};

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

export async function createWrestlerEntry(wrestler: Wrestler) {
    const response = await fetch("http://127.0.0.1:8000/api/roster", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(wrestler),
    }
    );
    const data = await response.json();
    if (!response.ok) {
        throw new Error(data.error || "Could not add wrestler.")
    }
    return data as { id: number; name: string; brand: string | null };
}

export async function deleteWrestlerEntry(wrestlerId: number) {
    const response = await fetch(`http://127.0.0.1:8000/api/roster/${wrestlerId}`, { method: "DELETE" });
    const data = await response.json();
    if (!response.ok) {
        throw new Error(data.error || "Could not delete wrestler.");
    }
}

export async function fetchWrestler(id: string): Promise<Wrestler> {
    const response = await fetch(`http://127.0.0.1:8000/api/roster/${id}`);
    const data = await response.json();
    if (!response.ok) {
        throw new Error(data.error || "Could not load wrestler.");
    }
    return data;
}

export async function updateWrestler(id: string, wrestler: Wrestler): Promise<Wrestler> {
    const response = await fetch(`http://127.0.0.1:8000/api/roster/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(wrestler),
    });
    const data = await response.json();
    if (!response.ok) {
        throw new Error(data.error || "Could not update wrestler.")
    }
    return data;
}
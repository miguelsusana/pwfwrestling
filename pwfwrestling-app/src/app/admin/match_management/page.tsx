"use client";

import styles from "../../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import MainLayout from "@/components/MainComponents/MainLayout";
import { useEffect, useState, type FormEvent } from "react";
import { createMatch, fetchEvents, fetchTitlesList } from "@/api";

type EventData = {
    id: number;
    name: string;
    month: string;
    year: number;
    season: number;
    instance_number: number;
};

type TitleData = {
    title_id: number;
    title_name: string;
};

export default function MatchManagement() {
    const [events, setEvents] = useState<EventData[]>([]);
    const [titles, setTitles] = useState<TitleData[]>([]);
    const [isChampionship, setIsChampionship] = useState(false);
    const [saving, setSaving] = useState(false);
    const [message, setMessage] = useState("");

    useEffect(() => {
        Promise.all([fetchEvents(), fetchTitlesList()])
            .then(([eventData, titleData]) => {
                setEvents(eventData);
                setTitles(titleData);
            })
            .catch((error: unknown) => {
                setMessage(error instanceof Error ? error.message : "Could not load form data.");
            });
    }, []);

    async function submitMatch(event: FormEvent<HTMLFormElement>) {
        event.preventDefault();
        setSaving(true);
        setMessage("");

        const form = event.currentTarget;
        const formData = new FormData(form);
        const championshipMatch = formData.get("championship_match") === "yes";
        const titleValue = formData.get("title_id");

        try {
            const result = await createMatch({
                event_id: Number(formData.get("event_id")),
                match_type: String(formData.get("match_type") ?? "").trim(),
                special_stipulation:
                    String(formData.get("special_stipulation") ?? "").trim() || null,
                championship_match: championshipMatch,
                title_id: championshipMatch && titleValue ? Number(titleValue) : null,
                match_description: String(formData.get("match_description") ?? "").trim(),
                is_main_event: formData.get("is_main_event") === "on",
                is_pre_show: formData.get("is_pre_show") === "on",
                participants: [],
            });

            setMessage(`Match ${result.match_id} created.`);
            form.reset();
            setIsChampionship(false);
        } catch (error) {
            setMessage(error instanceof Error ? error.message : "Could not create match.");
        } finally {
            setSaving(false);
        }
    }

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.filter_container}>
                    <h2 className={styles.add_wrestler_title}>Add Match</h2>

                    <form onSubmit={submitMatch}>
                        <div className={styles.form_group}>
                            <label htmlFor="event_id">Event:</label>
                            <select id="event_id" name="event_id" required defaultValue="">
                                <option value="" disabled>Select an event</option>
                                {events.map((event) => (
                                    <option key={event.id} value={event.id}>
                                        {event.name} — Season {event.season}, {event.month} {event.year}, Week {event.instance_number}
                                    </option>
                                ))}
                            </select>
                        </div>

                        <div className={styles.form_group}>
                            <label htmlFor="match_type">Match type:</label>
                            <input id="match_type" name="match_type" required maxLength={255} />
                        </div>

                        <div className={styles.form_group}>
                            <label htmlFor="special_stipulation">Special stipulation:</label>
                            <input id="special_stipulation" name="special_stipulation" maxLength={255} />
                        </div>

                        <div className={styles.form_group}>
                            <label htmlFor="match_description">Display description:</label>
                            <input id="match_description" name="match_description" required />
                        </div>

                        <div className={styles.form_group}>
                            <label htmlFor="championship_match">Championship match?</label>
                            <select
                                id="championship_match"
                                name="championship_match"
                                value={isChampionship ? "yes" : "no"}
                                onChange={(event) => setIsChampionship(event.target.value === "yes")}
                            >
                                <option value="no">No</option>
                                <option value="yes">Yes</option>
                            </select>
                        </div>

                        {isChampionship && (
                            <div className={styles.form_group}>
                                <label htmlFor="title_id">Title:</label>
                                <select id="title_id" name="title_id" required defaultValue="">
                                    <option value="" disabled>Select a title</option>
                                    {titles.map((title) => (
                                        <option key={title.title_id} value={title.title_id}>
                                            {title.title_name}
                                        </option>
                                    ))}
                                </select>
                            </div>
                        )}

                        <div className={styles.form_group}>
                            <label htmlFor="is_main_event">Main event?</label>
                            <input id="is_main_event" name="is_main_event" type="checkbox" />
                        </div>

                        <div className={styles.form_group}>
                            <label htmlFor="is_pre_show">Pre-show?</label>
                            <input id="is_pre_show" name="is_pre_show" type="checkbox" />
                        </div>

                        <div className={styles.filter_buttons}>
                            <button type="submit" disabled={saving}>
                                {saving ? "CREATING..." : "ADD MATCH"}
                            </button>
                        </div>
                    </form>

                    {message && <p role="status">{message}</p>}
                </div>
            </MainLayout>
            <Footer />
        </div>
    );
}
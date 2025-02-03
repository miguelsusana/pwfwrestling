"use client"
import styles from "../../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import MainLayout from "@/components/MainComponents/MainLayout";
import { useState, useEffect } from "react";

type EventData = {
    event_season: number,
    event_year: number,
    event_month: string,
    event_name: string,
    event_week: number,
    id: number;
}

type ActiveChampionship = {
    title_id: number;
    title_name: string;
}

type RosterData = {
    wrestler_name: string,
    wrestler_id: number;
}

export default function MatchManagement() {

    const [events, setEvents] = useState<EventData[]>([]);
    const [championships, setChampionships] = useState<ActiveChampionship[]>([]);
    const [isChampionship, setIsChampionship] = useState(false);
    const [roster, setRoster] = useState<RosterData[]>([])

    useEffect(() => {
        const fetchEvents = async () => {
            const response = await fetch('http://127.0.0.1:8000/api/get_events');
            const data = await response.json();
            setEvents(data);
        }
        const fetchTitlesList = async () => {
            const response = await fetch("http://127.0.0.1:8000/api/active_titles");
            const data = await response.json();
            setChampionships(data);
        }
        const fetchFullRoster = async () => {
            const response = await fetch("http://127.0.0.1:8000/api/full_roster");
            const data = await response.json();
            setRoster(data);
        }
        fetchEvents();
        fetchTitlesList();
        fetchFullRoster();
    }, [])

    const handleMatchChange = (event: any) => {
        setIsChampionship(event.target.value === '1');
    };

    const seasons = [...new Set(events.map(event => event.event_season))];
    const years = [...new Set(events.map(event => event.event_year))];
    const months = [...new Set(events.map(event => event.event_month))];
    const weeks = [...new Set(events.map(event => event.event_week))];
    const names = [...new Set(events.map(event => event.event_name))];


    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.filter_container}>
                    <form>
                        <div className={styles.form_group}>
                            <label htmlFor="event_season">Season:</label>
                            <select name="event_season" id="event_season">
                                <option value=""></option>
                                {seasons.map((season, index) => (
                                    <option key={index} value={season}>Season {season}</option>
                                ))}
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="event_year">Year:</label>
                            <select name="event_year" id="event_year">
                                <option value=""></option>
                                {years.map((year, index) => (
                                    <option key={index} value={year}>{year}</option>
                                ))}
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="event_month">Month:</label>
                            <select name="event_month" id="event_month">
                                <option value=""></option>
                                {months.map((month, index) => (
                                    <option key={index} value={month}>{month}</option>
                                ))}
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="event_week">Week:</label>
                            <select name="event_week" id="event_week">
                                <option value=""></option>
                                {weeks.map((week, index) => (
                                    <option key={index} value={week}>{week}</option>
                                ))}
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="event_name">Event Name:</label>
                            <select name="event_name" id="event_name">
                                <option value=""></option>
                                {names.map((name, index) => (
                                    <option key={index} value={name}>{name}</option>
                                ))}
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="name">Match Type:</label>
                            <input type="text" id="match_type" name="match_type" />
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="name">Special Stipulation:</label>
                            <input type="text" id="special_stipulation" name="special_stipulation" />
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="name">Championship Match:</label>
                            <select onChange={handleMatchChange}>
                                <option value={0}>NO</option>
                                <option value={1}>YES</option>
                            </select>
                        </div>

                        {isChampionship && (
                            <div className={styles.form_group}>
                                <label htmlFor="championship_dropdown">Championship:</label>
                                <select id="championship_dropdown">
                                    {championships.map((title, index) => (
                                        <option key={index} value={title.title_id}>{title.title_name}</option>
                                    ))}
                                </select>
                            </div>)}

                        <div className={styles.form_group}>
                            <label htmlFor="name">Match Participants:</label>
                            <input type="text" id="match_type" name="match_type" />
                        </div>




                        <div className={styles.filter_buttons}>
                            <button type="submit">Add Match</button>
                            <a href='/admin/match_management'>
                                <button type="button">Clear</button>
                            </a>
                        </div>

                    </form>
                </div>
            </MainLayout>
            <Footer />
        </div>
    )
}
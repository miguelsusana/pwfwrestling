"use client"
import styles from "../../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import MainLayout from "@/components/MainComponents/MainLayout";
import { useState, useEffect } from "react";
import { fetchEvents, fetchFullRoster, fetchTitlesList } from "@/api";
import { Teams } from "@/components/ManagementComponents/Teams";

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

export type RosterData = {
    name: string,
    id: number;
    brand: string;
}

type MatchParticipantData = {
    match_participant: RosterData;
    team_number: number | undefined;
    is_competitor: boolean;
    accompanied_by: RosterData[] | undefined;
}

export default function MatchManagement() {

    const [events, setEvents] = useState<EventData[]>([]);
    const [championships, setChampionships] = useState<ActiveChampionship[]>([]);
    const [isChampionship, setIsChampionship] = useState(false);
    const [isCompetitor, setIsCompetitor] = useState(true);
    const [roster, setRoster] = useState<RosterData[]>([]);
    const [matchParticipants, setMatchParticipants] = useState<MatchParticipantData[]>([]);
    const [teamNumber, setTeamNumber] = useState<number | undefined>();
    const [selectedWrestler, setSelectedWrestler] = useState<RosterData | undefined>();
    const [managersList, setManagersList] = useState<RosterData[]>([]);

    useEffect(() => {
        fetchEvents().then((data) => setEvents(data));
        fetchFullRoster().then((data) => setRoster(data));
        fetchTitlesList().then((data) => setChampionships(data));
    }, [])

    const handleMatchChange = (event: any) => {
        setIsChampionship(event.target.value === '1');
    };


    const seasons = [...new Set(events.map(event => event.event_season))];
    const years = [...new Set(events.map(event => event.event_year))];
    const months = [...new Set(events.map(event => event.event_month))];
    const weeks = [...new Set(events.map(event => event.event_week))];
    const names = [...new Set(events.map(event => event.event_name))];

    const addToParticipantList = () => {
        if (selectedWrestler && (teamNumber !== undefined && teamNumber > 0)) {
            setMatchParticipants([...matchParticipants,
            {
                match_participant: selectedWrestler,
                team_number: teamNumber,
                is_competitor: isCompetitor,
                accompanied_by: managersList
            }])
            setManagersList([]);
        }
    }

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

                        <div>
                            <div>
                                <Teams teamNumber={1} roster={roster} managersList={managersList} selectedWrestler={selectedWrestler} setManagersList={setManagersList} setSelectedWrestler={setSelectedWrestler} />
                            </div>
                            <div>
                                <Teams teamNumber={2} roster={roster} managersList={managersList} selectedWrestler={selectedWrestler} setManagersList={setManagersList} setSelectedWrestler={setSelectedWrestler} />
                            </div>
                        </div>
                        <div className={styles.form_group}>
                            <button type="button" onClick={addToParticipantList}>Add Superstar</button>
                        </div>
                        {matchParticipants.map((p, index) => (
                            <div key={index}>
                                <div>Wrestler: {p.match_participant.name}</div>
                                <div>Team {p.team_number}</div>
                                <div>Active? {p.is_competitor ? 'YES' : 'NO'}</div>
                                {p.accompanied_by && p.accompanied_by.map((manager) => (
                                    <div key={manager.id}>Accompanied By: {manager.name}</div>
                                ))}
                            </div >
                        ))}

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
"use client"
import { useEffect, useState } from "react";
import compStyle from "./Roster.module.css";
import styles from "../../app/page.module.css";
import MainLayout from "../MainComponents/MainLayout";
import RosterChampionsTable from "./RosterChampionsTable";

interface RosterEntry {
    SmackDown: string;
    RAW: string;
    NXT: string;
}

export default function RosterTable() {

    const [roster, setRoster] = useState<RosterEntry[]>([]);

    useEffect(() => {
        const fetchRoster = async () => {
            const response = await fetch("http://localhost:8000/api/roster");
            if (!response.ok) {
                throw new Error("Failed to fetch roster data");
            }
            const data: RosterEntry[] = await response.json();
            setRoster(data);
        };
        fetchRoster();
    }, []);

    return (
        <div>
            <MainLayout>
                <div className={compStyle.rosterContainer}>
                    <div>
                        <table className={styles.gridtable}>
                            <thead>
                                <tr>
                                    <th className={compStyle.sd_header}>SMACKDOWN</th>
                                    <th className={compStyle.raw_header}>RAW</th>
                                    <th className={compStyle.nxt_header}>NXT</th>
                                </tr>
                            </thead>
                            <tbody>
                                {roster.map((entry, index) => (
                                    <tr key={index}>
                                        <td className={compStyle.smackdown}>{entry.SmackDown || ""}</td>
                                        <td className={compStyle.raw}>{entry.RAW || ""}</td>
                                        <td className={compStyle.nxt}>{entry.NXT || ""}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <RosterChampionsTable />
                    </div>
                </div>
            </MainLayout>
        </div>
    )
}
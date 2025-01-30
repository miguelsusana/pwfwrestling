"use client"
import { useEffect, useState } from "react";
import styles from "./RosterTable.module.css";
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
                <div className={styles.rosterContainer}>
                    <div>
                        <table className={styles.gridtable}>
                            <thead>
                                <tr>
                                    <th className={styles.sd_header}>SMACKDOWN</th>
                                    <th className={styles.raw_header}>RAW</th>
                                    <th className={styles.nxt_header}>NXT</th>
                                </tr>
                            </thead>
                            <tbody>
                                {roster.map((entry, index) => (
                                    <tr key={index}>
                                        <td className={styles.smackdown}>{entry.SmackDown || ""}</td>
                                        <td className={styles.raw}>{entry.RAW || ""}</td>
                                        <td className={styles.nxt}>{entry.NXT || ""}</td>
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
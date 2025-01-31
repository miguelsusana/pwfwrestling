"use client"
import { useEffect, useState } from "react";
import compStyles from "./Roster.module.css";
import styles from "../../app/page.module.css";

interface ChampionsEntry {
    title: string,
    name: string | string[],
    image: string;
}

export default function RosterChampionsTable() {

    const [champions, setChampion] = useState<ChampionsEntry[]>([])
    if (champions) {
        useEffect(() => {
            const fetchChampions = async () => {
                const response = await fetch("http://localhost:8000/api/champions");
                if (!response.ok) {
                    throw new Error("Failed to fetch roster data");
                }
                const data = await response.json();
                setChampion(data);
                console.log(champions);
            }
            fetchChampions();
        }, []
        );
    }

    return (
        <div className={compStyles.table_container}>
            <table className={styles.gridtable}>
                <thead>
                    <tr>
                        <th colSpan={2} className={compStyles.sd_header}>SMACKDOWN CHAMPIONSHIPS</th>
                    </tr>
                </thead>
                <tbody className={compStyles.sd_roster_titles}>
                    {champions
                        .filter(champion =>
                            ["WWE Championship",
                                "Intercontinental Championship",
                                "WWE Tag Team Championship",
                                "WWE Women's Championship",
                                "Women's Tag Team Championship"]
                                .includes(champion.title)
                        )
                        .sort((a, b) => {
                            const order = [
                                "WWE Championship",
                                "Intercontinental Championship",
                                "WWE Tag Team Championship",
                                "WWE Women's Championship",
                                "Women's Tag Team Championship"
                            ];
                            return order.indexOf(a.title) - order.indexOf(b.title);
                        })
                        .map((champion, index) => (
                            <tr key={index}>
                                <td className={compStyles.champions_title}>{champion.title}</td>
                                <td>
                                    {Array.isArray(champion.name)
                                        ? champion.name.join(" & ")
                                        : champion.name}
                                </td>
                            </tr>
                        ))}
                </tbody>

            </table>

            <table className={styles.gridtable}>
                <thead>
                    <tr>
                        <th colSpan={2} className={compStyles.raw_header}>RAW CHAMPIONSHIPS</th>
                    </tr>
                </thead>
                <tbody className={compStyles.raw_roster_titles}>
                    {champions
                        .filter(champion =>
                            ["WWE World Heavyweight Championship",
                                "United States Championship",
                                "WWE World Tag Team Championship",
                                "Women's World Championship",
                                "Women's Tag Team Championship"]
                                .includes(champion.title)
                        )
                        .sort((a, b) => {
                            const order = [
                                "WWE World Heavyweight Championship",
                                "United States Championship",
                                "WWE World Tag Team Championship",
                                "Women's World Championship",
                                "Women's Tag Team Championship"
                            ];
                            return order.indexOf(a.title) - order.indexOf(b.title);
                        })
                        .map((champion, index) => (
                            <tr key={index}>
                                <td className={compStyles.champions_title}>{champion.title}</td>
                                <td>
                                    {Array.isArray(champion.name)
                                        ? champion.name.join(" & ")
                                        : champion.name}
                                </td>
                            </tr>
                        ))}
                </tbody>

            </table>

            <table className={styles.gridtable}>
                <thead>
                    <tr>
                        <th colSpan={2} className={compStyles.nxt_header}>NXT CHAMPIONSHIPS</th>
                    </tr>
                </thead>
                <tbody className={compStyles.nxt_roster_titles}>
                    {champions
                        .filter(champion =>
                            ["NXT Championship",
                                "NXT North American Championship",
                                "NXT Tag Team Championship",
                                "NXT Women's Championship"]
                                .includes(champion.title)
                        )
                        .sort((a, b) => {
                            const order = [
                                "NXT Championship",
                                "NXT North American Championship",
                                "NXT Tag Team Championship",
                                "NXT Women's Championship"
                            ];
                            return order.indexOf(a.title) - order.indexOf(b.title);
                        })
                        .map((champion, index) => (
                            <tr key={index}>
                                <td className={compStyles.champions_title}>{champion.title}</td>
                                <td>
                                    {Array.isArray(champion.name)
                                        ? champion.name.join(" & ")
                                        : champion.name}
                                </td>
                            </tr>
                        ))}
                </tbody>

            </table>
        </div>
    )
}
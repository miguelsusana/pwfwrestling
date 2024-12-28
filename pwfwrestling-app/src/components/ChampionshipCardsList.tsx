"use client";
import { useEffect, useState } from "react";
import ChampionshipCard from "./ChampionshipCard";
import styles from "../app/page.module.css";

interface ChampionsEntry {
    title: string;
    name: string | string[],
    image: string;
}

export default function ChampionshipCardsList() {
    const [champions, setChampion] = useState<ChampionsEntry[]>([]);
    const [loading, setLoading] = useState<boolean>(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchChampions = async () => {
            try {
                const response = await fetch("http://localhost:8000/api/champions");

                if (!response.ok) {
                    throw new Error("Failed to fetch champions data");
                }
                const data = await response.json();
                setChampion(data);
            } catch (error) {
                setError("Failed to load champions data");
                console.error(error);
            } finally {
                setLoading(false);
            }
        };

        fetchChampions();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>{error}</div>;

    // Define the custom order for the championships
    const worldTitles = [
        "WWE Championship",
        "Universal Championship",
        "WWE World Heavyweight Championship",
        "Women's World Championship",
        "WWE Women's Championship"
    ];

    const midcardTitles = [
        "Intercontinental Championship",
        "United States Championship",
        "Women's Intercontinental Championship",
        "Women's United States Championship",
        "WWE Speed Championship",
        "WWE Women's Speed Championship",
    ];

    const tagTeamTitles = [
        "WWE Tag Team Championship",
        "WWE World Tag Team Championship",
        "Women's Tag Team Championship"
    ]
    const nxtTitles = [
        "NXT Championship",
        "NXT North American Championship",
        "NXT Tag Team Championship",
        "NXT Women's Championship",
        "NXT Women's North American Championship"
    ];

    // Filter and sort the champions based on custom order
    const filteredChampions = champions.filter(
        (champion) =>
            worldTitles.includes(champion.title) ||
            midcardTitles.includes(champion.title) ||
            tagTeamTitles.includes(champion.title) ||
            nxtTitles.includes(champion.title)
    );

    const sortedChampions = filteredChampions.sort((a, b) => {
        const order = [...worldTitles, ...midcardTitles, ...tagTeamTitles, ...nxtTitles];
        return order.indexOf(a.title) - order.indexOf(b.title);
    });

    // Split the champions into three rows
    const topRow = sortedChampions.filter((champion) =>
        worldTitles.includes(champion.title)
    );

    const middleRow = sortedChampions.filter((champion) =>
        midcardTitles.includes(champion.title)
    );

    const middleRow2 = sortedChampions.filter((champion) =>
        tagTeamTitles.includes(champion.title)
    );

    const bottomRow = sortedChampions.filter((champion) =>
        nxtTitles.includes(champion.title)
    );

    return (
        <div>
            <h4 className={styles.champspage_subtitle}>MAIN ROSTER</h4>
            <h1 className={styles.champspage_subtitle}>CHAMPIONSHIPS</h1>
            <div className={styles.cards_container}>
                {/* Top Row - World Titles */}
                <div className={styles.row}>
                    {topRow.map((champion, index) => (
                        <ChampionshipCard
                            key={index}
                            championName={
                                Array.isArray(champion.name)
                                    ? champion.name.join(" & ")
                                    : champion.name
                            }
                            titleName={champion.title}
                            titleImage={champion.image}
                        />
                    ))}
                </div>

                {/* Middle Row - Midcard Titles */}
                <div className={styles.row}>
                    {middleRow.map((champion, index) => (
                        <ChampionshipCard
                            key={index}
                            championName={
                                Array.isArray(champion.name)
                                    ? champion.name.join(" & ")
                                    : champion.name
                            }
                            titleName={champion.title}
                            titleImage={champion.image}
                        />
                    ))}
                </div>

                {/* Middle Row 2 - Tag Team Titles */}
                <div className={styles.row}>
                    {middleRow2.map((champion, index) => (
                        <ChampionshipCard
                            key={index}
                            championName={
                                Array.isArray(champion.name)
                                    ? champion.name.join(" & ")
                                    : champion.name
                            }
                            titleName={champion.title}
                            titleImage={champion.image}
                        />
                    ))}
                </div>
            </div>
            <h4 className={styles.champspage_subtitle}>NXT</h4>
            <h1 className={styles.champspage_subtitle}>CHAMPIONSHIPS</h1>
            <div className={styles.cards_container}>
                {/* Bottom Row - NXT Titles */}
                <div className={styles.row}>
                    {bottomRow.map((champion, index) => (
                        <ChampionshipCard
                            key={index}
                            championName={
                                Array.isArray(champion.name)
                                    ? champion.name.join(" & ")
                                    : champion.name
                            }
                            titleName={champion.title}
                            titleImage={champion.image}
                        />
                    ))}
                </div>
            </div>
        </div>

    );
}

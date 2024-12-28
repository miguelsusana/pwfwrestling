"use client"
import { useState, useEffect } from "react";
import styles from "../app/page.module.css";

interface RetiredChampionships {
    image: string,
    title: string
}

export default function SidescrollBox() {
    const [retiredTitles, setRetiredTitles] = useState<RetiredChampionships[]>([]);
    const [listPosition, setListPosition] = useState(0);

    useEffect(() => {
        const fetchRetiredTitles = async () => {
            const response = await fetch("http://localhost:8000/api/retired_titles");
            if (!response.ok) {
                throw new Error("Failed to fetch championship data");
            }
            const data = await response.json();
            setRetiredTitles(data);
        }
        fetchRetiredTitles();
    }, [])

    return (
        <div className={styles.title_scrollerbox}>
            <div className={styles.title_scrollerheader}>
                RETIRED CHAMPIONSHIPS
            </div>
            <div className={styles.scroller_container}>
                {retiredTitles.slice(listPosition, Math.min(listPosition + 3, retiredTitles.length)).map((championship, index) => (
                    <div key={index} className={styles.scroller_item}>
                        <div><a href={`/championships/${championship.image.split("_design")[0]}`}><img src={`./images/titles/retired/${championship.image}`} /></a></div>
                        <div>{championship.title}</div>
                    </div>
                ))
                }
            </div>
            <div className={styles.navigation_buttons}>
                <button onClick={() => setListPosition(listPosition - 3)} disabled={listPosition <= 0}>PREVIOUS</button>
                <button onClick={() => setListPosition(listPosition + 3)} disabled={listPosition + 3 >= retiredTitles.length}>NEXT</button>
            </div>
        </div>
    );
}
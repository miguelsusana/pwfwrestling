"use client"
import MainHeader from "@/components/MainHeader"
import Navbar from "@/components/Navbar"
import MainLayout from "@/components/MainLayout"
import Footer from "@/components/Footer"
import TitleHistoryFullTable from "@/components/TitleHistoryFullTable"
import styles from "../../../page.module.css";
import { useParams } from "next/navigation"
import { useState, useEffect } from "react"

type HistoryProps = {
    reign_order: number,
    name: string,
    match_description: string,
    reign_duration: number
}

export default function TitleHistoryChampsList() {
    const params = useParams();
    const [titleHistory, setTitleHistory] = useState<HistoryProps[]>([]);
    useEffect(() => {
        const fetchTitles = async () => {
            const response = await fetch(`http://localhost:8000/api/belt/${params.belt}/history`);
            const data = await response.json();
            setTitleHistory(data);
        }
        fetchTitles();
    }, [])

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <TitleHistoryFullTable historyStats={titleHistory} />
            </MainLayout>

            <Footer />
        </div>
    )
}
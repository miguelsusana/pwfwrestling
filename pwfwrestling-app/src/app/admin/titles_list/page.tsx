"use client"
import styles from "../../page.module.css";
import compStyles from "../../../components/MainComponents/components.module.css";
import { useState, useEffect } from "react";
import MainHeader from "@/components/MainComponents/MainHeader";
import MainLayout from "@/components/MainComponents/MainLayout";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";

type TitlesProps = {
    id: number,
    title: string;
}

export default function TitlesList() {

    const [titlesList, setTitlesList] = useState<TitlesProps[]>([]);
    useEffect(() => {
        const fetchTitlesList = async () => {
            const response = await fetch("http://127.0.0.1:8000/api/titles_by_id");
            const data = await response.json();
            setTitlesList(data);
        }
        fetchTitlesList();
    }, []);

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={compStyles.justifycenter}>
                    <table className={styles.gridtable}>
                        <thead className={styles.pink}>
                            <tr>
                                <th>Title ID</th>
                                <th>Title Name</th>
                            </tr>
                        </thead>
                        <tbody className={styles.pink}>
                            {titlesList.map((entry, index) => (
                                <tr key={index}>
                                    <td>{entry.id}</td>
                                    <td>{entry.title}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>

            </MainLayout>
            <Footer />
        </div>

    )
}
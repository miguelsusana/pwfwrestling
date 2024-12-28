"use client"
import MainHeader from "@/components/MainHeader";
import MainLayout from "@/components/MainLayout";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import styles from "../../page.module.css";
import { useState, useEffect } from "react";

interface RosterList {
    id: number;
    name: string;
    brand: string;

}

export default function RosterManagement() {

    const [rosterList, setRosterList] = useState<RosterList[]>([]);
    useEffect(() => {
        const fetchRoster = async () => {
            const response = await fetch("http://localhost:8000/api/roster-id-names")
            const data = await response.json();
            setRosterList(data);
        }
        fetchRoster();

    }, [])

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className="filter-container">
                    <form action="/roster_management" method="GET">
                        <label htmlFor="brand">Filter by Brand:</label>
                        <select name="brand" id="brand">
                            <option value=""></option>
                            <option value="None">None</option>
                            <option value="RAW">RAW</option>
                            <option value="SmackDown">SmackDown</option>
                            <option value="NXT">NXT</option>
                        </select>
                        <div>
                            <label htmlFor="name">Filter by Name:</label>
                            <input type="text" id="name" name="name" placeholder="Type name..." />
                        </div>
                        <button type="submit">Apply Filter</button>
                        <a href='/roster_management'>
                            <button type="button">Clear Filter</button>
                        </a>
                    </form>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Wrestler ID</th>
                            <th>Name</th>
                            <th>Brand</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {rosterList.map((superstar, index) => (
                            <tr key={index}>
                                <td>{superstar.id}</td>
                                <td>{superstar.name}</td>
                                <td>{superstar.brand}</td>
                                <td>
                                    <form action={`roster_management/${superstar.id}`} method="PUT">
                                        <button type="submit">EDIT</button>
                                    </form>
                                </td>
                                <td><button>REMOVE</button></td>
                                <td><a href={`roster_management/${superstar.id}`}><button>DETAILS</button></a></td>
                            </tr>
                        ))}
                    </tbody>

                </table>
            </MainLayout>
            <Footer />
        </div>
    );
}
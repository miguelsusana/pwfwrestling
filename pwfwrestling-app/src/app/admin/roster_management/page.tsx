"use client"
import MainHeader from "@/components/MainComponents/MainHeader";
import MainLayout from "@/components/MainComponents/MainLayout";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import styles from "../../page.module.css";
import { useState, useEffect } from "react";
import { fetchFullRoster } from "@/api";

interface RosterList {
    id: number;
    name: string;
    brand: string;

}

export default function RosterManagement() {

    const [rosterList, setRosterList] = useState<RosterList[]>([]);
    const [filteredRoster, setFilteredRoster] = useState<RosterList[]>([]);
    useEffect(() => {
        fetchFullRoster().then((data) => {
            setRosterList(data);
            setFilteredRoster(data);
        })
    }, [])

    function filter(formData: any) {
        const brand = formData.get('brand');
        const name = formData.get('name');

        setFilteredRoster(rosterList.filter((elem) => {
            if (name && !elem.name.toLowerCase().includes(name.toLowerCase())) {
                return false;
            }
            if (brand) {
                if (brand === 'None') {
                    if (elem.brand) {
                        return false
                    }
                } else if (brand !== elem.brand) {
                    return false;
                }
            }
            return true
        }))

    }

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.filter_container}>
                    <form action={filter}>
                        <div className={styles.form_group}>
                            <label htmlFor="brand">Filter by Brand:</label>
                            <select name="brand" id="brand">
                                <option value=""></option>
                                <option value="None">None</option>
                                <option value="RAW">RAW</option>
                                <option value="SmackDown">SmackDown</option>
                                <option value="NXT">NXT</option>
                            </select>
                        </div>
                        <div className={styles.form_group}>
                            <label htmlFor="name">Filter by Name:</label>
                            <input type="text" id="name" name="name" placeholder="Type name..." />
                        </div>
                        <div className={styles.filter_buttons}>
                            <button type="submit">Apply Filter</button>
                            <a href='/admin/roster_management'>
                                <button type="button">Clear Filter</button>
                            </a>
                        </div>

                    </form>
                </div>
                <div className={styles.align_center}>
                    <table className={styles.gridtable}>
                        <thead className={styles.pink}>
                            <tr>
                                <th>Wrestler ID</th>
                                <th>Name</th>
                                <th>Brand</th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody className={styles.pink}>
                            {filteredRoster.map((superstar, index) => (
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
                </div>
            </MainLayout>
            <Footer />
        </div>
    );
}
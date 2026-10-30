"use client"
import MainHeader from "@/components/MainComponents/MainHeader";
import MainLayout from "@/components/MainComponents/MainLayout";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import styles from "../../page.module.css";
import { useState, useEffect } from "react";
import { createWrestlerEntry, deleteWrestlerEntry, fetchFullRoster, type Wrestler } from "@/api";

interface RosterList {
    id: number;
    name: string;
    brand: string | null;

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

    async function addWrestler(formData: FormData) {
        try {
            const wrestler = await createWrestlerEntry({
                name: String(formData.get("name") ?? "").trim(),
                status: String(formData.get("status")) as Wrestler["status"],
                gender: String(formData.get("gender")) as Wrestler["gender"],
                brand: (formData.get("brand") || null) as Wrestler["brand"],
                extra: (formData.get("extra") || null) as Wrestler["extra"],
            });

            setRosterList((current) => [wrestler, ...current]);
            setFilteredRoster((current) => [wrestler, ...current]);
        } catch (error) {
            window.alert(error instanceof Error ? error.message : "Could not add wrestler.")
        }
    }

    async function removeWrestler(wrestler: RosterList) {
        const confirmed = window.confirm(
            `Permanently delete ${wrestler.name}? Related title and match history may also be deleted.`
        );
        if (!confirmed) return;

        try {
            await deleteWrestlerEntry(wrestler.id);
            setRosterList((rows) => rows.filter((row) => row.id !== wrestler.id));
            setFilteredRoster((rows) => rows.filter((row) => row.id !== wrestler.id));
        } catch (error) {
            window.alert(error instanceof Error ? error.message : "Could not delete wrestler.");
        }
    }


    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.add_wrestler_container}>
                    <h2 className={styles.add_wrestler_title}>Add wrestler to roster.</h2>
                    <form action={(addWrestler)} className={styles.add_wrestler_form}>
                        <input name="name" required placeholder="Wrestler name" />
                        <select name="status" required defaultValue="Active">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                            <option value="Free Agent">Free Agent</option>
                            <option value="Deceased">Deceased</option>
                            <option value="Manager">Manager</option>
                        </select>

                        <select name="gender" required defaultValue="Men">
                            <option value="Men">Men</option>
                            <option value="Women">Women</option>
                        </select>

                        <select name="brand" defaultValue="">
                            <option value="">NO BRAND</option>
                            <option value="RAW">RAW</option>
                            <option value="SmackDown">SmackDown</option>
                            <option value="NXT">NXT</option>
                        </select>
                        <input name="extra" placeholder="Extra Information" />

                        <button type="submit">ADD WRESTLER</button>
                    </form>
                </div>

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
                                    <td><button type="button" onClick={() => removeWrestler(superstar)}>REMOVE</button></td>
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
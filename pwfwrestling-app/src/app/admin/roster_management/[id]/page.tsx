"use client"
import MainHeader from "@/components/MainComponents/MainHeader";
import MainLayout from "@/components/MainComponents/MainLayout";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import styles from "../../../page.module.css";
import { useParams, useRouter } from "next/navigation"
import { useState, useEffect, FormEvent } from "react";
import { fetchWrestler, updateWrestler, type Wrestler } from "@/api";

export default function EditWrestlerPage() {

    const router = useRouter();
    const { id } = useParams<{ id: string }>();
    const [wrestler, setWrestler] = useState<Wrestler | null>(null);
    const [error, setError] = useState("");
    const [saving, setSaving] = useState(false);

    useEffect(() => {
        let isCurrent = true

        fetchWrestler(id)
            .then((data) => {
                if (isCurrent) setWrestler(data);
            })
            .catch((err: unknown) => {
                if (isCurrent) {
                    setError(err instanceof Error ? err.message : "Could not load wrestler.");
                }
            });
        return () => {
            isCurrent = false;
        };
    }, [id]);

    async function saveWrestler(event: FormEvent<HTMLFormElement>) {
        event.preventDefault();
        if (!wrestler) return;

        setSaving(true);
        setError("");

        try {
            const updated = await updateWrestler(id, wrestler);
            setWrestler(updated);
        } catch (err) {
            setError(err instanceof Error ? err.message : "Could not update wrestler.")
        } finally {
            setSaving(false);
        }
    }

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.add_wrestler_container}>
                    <h2 className={styles.add_wrestler_title}>
                        {wrestler ? `Edit ${wrestler.name}` : "Edit Wrestler"}
                    </h2>

                    {error && <p role="alert">{error}</p>}
                    {!wrestler && !error && <p>Loading wrestler...</p>}

                    {wrestler && (
                        <form
                            onSubmit={saveWrestler}
                            className={styles.add_wrestler_form}
                        >
                            <div className={styles.form_group}>
                                <label htmlFor="wrestler-name">Name:</label>
                                <input
                                    id="wrestler-name"
                                    required
                                    maxLength={255}
                                    value={wrestler.name}
                                    onChange={(event) =>
                                        setWrestler({ ...wrestler, name: event.target.value })
                                    }
                                />
                            </div>

                            <div className={styles.form_group}>
                                <label htmlFor="wrestler-status">Status:</label>
                                <select
                                    id="wrestler-status"
                                    value={wrestler.status}
                                    onChange={(event) =>
                                        setWrestler({
                                            ...wrestler,
                                            status: event.target.value as Wrestler["status"],
                                        })
                                    }
                                >
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                    <option value="Free Agent">Free Agent</option>
                                    <option value="Deceased">Deceased</option>
                                    <option value="Manager">Manager</option>
                                </select>
                            </div>

                            <div className={styles.form_group}>
                                <label htmlFor="wrestler-gender">Gender:</label>
                                <select
                                    id="wrestler-gender"
                                    value={wrestler.gender}
                                    onChange={(event) =>
                                        setWrestler({
                                            ...wrestler,
                                            gender: event.target.value as Wrestler["gender"],
                                        })
                                    }
                                >
                                    <option value="Men">Men</option>
                                    <option value="Women">Women</option>
                                </select>
                            </div>

                            <div className={styles.form_group}>
                                <label htmlFor="wrestler-brand">Brand:</label>
                                <select
                                    id="wrestler-brand"
                                    value={wrestler.brand ?? ""}
                                    onChange={(event) =>
                                        setWrestler({
                                            ...wrestler,
                                            brand: (event.target.value || null) as Wrestler["brand"],
                                        })
                                    }
                                >
                                    <option value="">No brand</option>
                                    <option value="RAW">RAW</option>
                                    <option value="SmackDown">SmackDown</option>
                                    <option value="NXT">NXT</option>
                                </select>
                            </div>

                            <div className={styles.form_group}>
                                <label htmlFor="wrestler-extra">Extra:</label>
                                <input
                                    id="wrestler-extra"
                                    maxLength={255}
                                    value={wrestler.extra ?? ""}
                                    onChange={(event) =>
                                        setWrestler({
                                            ...wrestler,
                                            extra: event.target.value || null,
                                        })
                                    }
                                />
                            </div>

                            <button type="submit" disabled={saving}>
                                {saving ? "SAVING..." : "SAVE CHANGES"}
                            </button>
                            <button type="button" onClick={() => router.back()}>
                                BACK TO ROSTER MANAGEMENT
                            </button>
                        </form>
                    )}
                </div>
            </MainLayout>
            <Footer />
        </div>
    );
}
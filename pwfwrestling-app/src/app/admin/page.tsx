import styles from "../page.module.css";
import MainLayout from "@/components/MainComponents/MainLayout";
import Navbar from "@/components/MainComponents/Navbar";
import MainHeader from "@/components/MainComponents/MainHeader";
import Footer from "@/components/MainComponents/Footer";

export default function Admin() {

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <section className={styles.admin_dashboard}>
                    <h1 className={styles.admin_title}>Management Dashboard</h1>
                    <p className={styles.admin_subtitle}>Choose what you’d like to manage.</p>

                    <div className={styles.admin_grid}>
                        <a className={styles.admin_card} href="/admin/roster_management">
                            <h2>Roster Management</h2>
                            <p>Add, edit, and remove people from the roster.</p>
                            <span>MANAGE ROSTER</span>
                        </a>

                        <a className={styles.admin_card} href="/admin/titles_list">
                            <h2>Titles List</h2>
                            <p>View and manage championship titles.</p>
                            <span>MANAGE TITLES</span>
                        </a>

                        <a className={styles.admin_card} href="/admin/match_management">
                            <h2>Match Management</h2>
                            <p>Manage matches and their participants.</p>
                            <span>MANAGE MATCHES</span>
                        </a>

                        <a className={styles.admin_card} href="/admin/event_management">
                            <h2>Event Management</h2>
                            <p>Manage wrestling events.</p>
                            <span>MANAGE EVENTS</span>
                        </a>
                    </div>
                </section>
            </MainLayout>

            <Footer />
        </div>
    );
}
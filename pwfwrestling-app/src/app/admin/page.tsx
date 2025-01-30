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
                <div className={styles.navigation_buttons}>
                    <a href="/admin/titles_list"><button>Titles List</button></a>
                    <a href="/admin/matches_list"><button>Matches List</button></a>
                    <a href="/admin/events_list"><button>Events List</button></a>
                </div>

                <div className={styles.navigation_buttons}>
                    <a href="/admin/roster_management"><button>Roster Management</button></a>
                    <a href="/admin/match_management"><button>Match Management</button></a>
                    <a href="/admin/event_management"><button>Event Management</button></a>
                </div>
            </MainLayout>

            <Footer />
        </div>
    );
}
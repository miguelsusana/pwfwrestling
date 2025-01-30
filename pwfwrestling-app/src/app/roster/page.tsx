import styles from "../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import MainLayout from "@/components/MainComponents/MainLayout";
import RosterTable from "@/components/RosterPage/RosterTable";

export default function Home() {

  return (
    <div className={styles.container}>
      <MainHeader />
      <Navbar />
      <MainLayout>
        <RosterTable />
      </MainLayout>

      <Footer />
    </div>

  );
}
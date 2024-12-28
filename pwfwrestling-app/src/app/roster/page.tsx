import styles from "../page.module.css";
import MainHeader from "@/components/MainHeader";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import MainLayout from "@/components/MainLayout";
import RosterTable from "@/components/RosterTable";

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
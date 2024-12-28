import styles from "../page.module.css";
import MainHeader from "@/components/MainHeader";
import Navbar from "@/components/Navbar";
import MainLayout from "@/components/MainLayout";
import Footer from "@/components/Footer";
import ChampionshipCardsList from "@/components/ChampionshipCardsList";
import SidescrollBox from "@/components/SidescrollBox";


export default function Championships() {

  return (
    <div className={styles.container}>
      <MainHeader />
      <Navbar />
      <MainLayout>
        <ChampionshipCardsList />
        <SidescrollBox />
      </MainLayout>

      <Footer />
    </div>
  );
}

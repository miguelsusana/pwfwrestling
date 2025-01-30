import styles from "../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import MainLayout from "@/components/MainComponents/MainLayout";
import Footer from "@/components/MainComponents/Footer";
import ChampionshipCardsList from "@/components/ChampionshipPage/ChampionshipCardsList";
import SidescrollBox from "@/components/ChampionshipPage/SidescrollBox";


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

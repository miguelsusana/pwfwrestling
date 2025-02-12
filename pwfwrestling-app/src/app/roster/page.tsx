"use client"
import styles from "../page.module.css";
import MainHeader from "@/components/MainComponents/MainHeader";
import Navbar from "@/components/MainComponents/Navbar";
import Footer from "@/components/MainComponents/Footer";
import MainLayout from "@/components/MainComponents/MainLayout";
import RosterTable from "@/components/RosterPage/RosterTable";
import { RosterEntry } from "@/components/RosterPage/RosterTable";
import { useEffect, useState } from "react";
import { ChampionsEntry } from "@/components/RosterPage/RosterChampionsTable";
import { fetchChampions, fetchRosterByBrand } from "@/api";

export default function Roster() {
  const [roster, setRoster] = useState<RosterEntry[]>([]);
  const [champions, setChampions] = useState<ChampionsEntry[]>([]);

  useEffect(() => {
    fetchRosterByBrand().then((data) => setRoster(data));
    fetchChampions().then((data) => setChampions(data));
  }, []);

  return (
    <div className={styles.container}>
      <MainHeader />
      <Navbar />
      <MainLayout>
        <RosterTable rosterEntries={roster} championEntries={champions} />
      </MainLayout>

      <Footer />
    </div>

  );
}
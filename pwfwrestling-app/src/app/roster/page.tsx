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

export default function Roster() {
  const [roster, setRoster] = useState<RosterEntry[]>([]);
  const [champions, setChampions] = useState<ChampionsEntry[]>([]);

  useEffect(() => {
    const fetchRoster = async () => {
      const response = await fetch("http://localhost:8000/api/roster");
      if (!response.ok) {
        throw new Error("Failed to fetch roster data");
      }
      const data: RosterEntry[] = await response.json();
      setRoster(data);
    };
    const fetchChampions = async () => {
      const response = await fetch("http://localhost:8000/api/champions");
      if (!response.ok) {
        throw new Error("Failed to fetch champions data");
      }
      const data = await response.json();
      setChampions(data);
    };
    fetchRoster();
    fetchChampions();
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
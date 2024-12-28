import styles from "./page.module.css";
import Navbar from "@/components/Navbar";
import MainHeader from "@/components/MainHeader";
import Footer from "@/components/Footer";
import MainLayout from "@/components/MainLayout";

export default function Home() {
  return (
    <div className={styles.container}>
      <MainHeader />
      <Navbar />

      <MainLayout>
        <h2>Welcome to PWFWrestling</h2>
          <p>
              Explore the latest rosters, championship updates, and upcoming events. 
              Your journey into the world of PWF starts here!
          </p>
      </MainLayout>
  
      <Footer />
    </div>
  );
}

import React from 'react';
import styles from "../app/page.module.css";


type MainLayoutProps = {
  children: React.ReactNode;
}

const MainLayout = ({ children }: MainLayoutProps) => {
  return (
    <main className={styles.main}>
      {<section className={styles.content}>
        {children}
      </section>}
    </main>
  )
}

export default MainLayout;
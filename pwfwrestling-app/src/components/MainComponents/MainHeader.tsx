import styles from "../../app/page.module.css";

export default function MainHeader() {
    return (
        <header className={styles.header}>
            <h1><img src="/images/wwf-logo.png" className={styles.logo} />Portugal Wrestling Federation</h1>
            <p>Mikey's lifelong project! :3</p>
        </header>
    )
}

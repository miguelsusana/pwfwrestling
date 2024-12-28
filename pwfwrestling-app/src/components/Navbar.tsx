import styles from "../app/page.module.css";

export default function Navbar() {
  return (
    <nav className={styles.nav}>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/roster">Roster</a></li>
        <li><a href="/championships">Championships</a></li>
        <li><a href="/events">Events</a></li>
        <li><a href="/admin">Admin</a></li>
      </ul>
    </nav>
  );
}
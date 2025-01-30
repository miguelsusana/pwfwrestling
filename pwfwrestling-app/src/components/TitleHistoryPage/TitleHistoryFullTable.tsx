import styles from "./TitleHistoryFullTable.module.css";

type HistoryStats = {
    name: string,
    reign_order: number,
    reign_duration: number,
    match_description: string
}

type TitleHistoryProps = {
    historyStats: HistoryStats[]
}

export default function TitleHistoryFullTable(titleHistoryProps: TitleHistoryProps) {
    return (
        <div className={styles.historyContainer}>
            <table className={styles.history_table}>
                <thead>
                    <tr>
                        <th>Rank</th>
                        <th>Champion</th>
                        <th>Match</th>
                        <th>Reign</th>
                    </tr>
                </thead>
                <tbody>
                    {titleHistoryProps.historyStats.map(elem => (
                        <tr key={elem.reign_order}>
                            <td>{elem.reign_order}</td>
                            <td>{elem.name}</td>
                            <td>{elem.match_description}</td>
                            <td>{elem.reign_duration} days</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}
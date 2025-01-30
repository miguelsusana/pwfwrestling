import styles from "./TitleHistoryMiniTables.module.css";

type ChampionStatsProps = {
    name: string,
    value: number
}

export type HeaderProps = {
    headerName: string,
    championStats: ChampionStatsProps[]
}

export default function TitleHistoryMiniTables(headerProps: HeaderProps) {

    return (
        <table className={styles.grid_table}>
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Champion Name</th>
                    <th>{headerProps.headerName}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>{headerProps.championStats[0].name}</td>
                    <td>{headerProps.championStats[0].value}</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>{headerProps.championStats[1].name}</td>
                    <td>{headerProps.championStats[1].value}</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>{headerProps.championStats[2].name}</td>
                    <td>{headerProps.championStats[2].value}</td>
                </tr>
            </tbody>
        </table>
    )

}
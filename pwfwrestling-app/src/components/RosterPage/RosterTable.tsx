import compStyle from "./Roster.module.css";
import styles from "../../app/page.module.css";
import MainLayout from "../MainComponents/MainLayout";
import RosterChampionsTable, { ChampionsEntry } from "./RosterChampionsTable";

export type RosterEntry = {
    SmackDown: string;
    RAW: string;
    NXT: string;
}

type RosterTableProps = {
    rosterEntries: RosterEntry[],
    championEntries: ChampionsEntry[]
}

export default function RosterTable(rosterTableProps: RosterTableProps) {

    return (
        <div>
            <MainLayout>
                <div className={compStyle.rosterContainer}>
                    <div>
                        <table className={styles.gridtable}>
                            <thead>
                                <tr>
                                    <th className={compStyle.sd_header}>SMACKDOWN</th>
                                    <th className={compStyle.raw_header}>RAW</th>
                                    <th className={compStyle.nxt_header}>NXT</th>
                                </tr>
                            </thead>
                            <tbody>
                                {rosterTableProps.rosterEntries.map((entry, index) => (
                                    <tr key={index}>
                                        <td className={compStyle.smackdown}>{entry.SmackDown || ""}</td>
                                        <td className={compStyle.raw}>{entry.RAW || ""}</td>
                                        <td className={compStyle.nxt}>{entry.NXT || ""}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <RosterChampionsTable championEntries={rosterTableProps.championEntries} />
                    </div>
                </div>
            </MainLayout>
        </div>
    )
}
import compStyle from "./Roster.module.css";
import styles from "../../app/page.module.css";
import MainLayout from "../MainComponents/MainLayout";
import RosterChampionsTable, { ChampionsEntry } from "./RosterChampionsTable";

export const Brand = {
    SMACKDOWN: "SmackDown",
    RAW: "RAW",
    NXT: "NXT"
}

export type Brand = typeof Brand[keyof typeof Brand]

export const Gender = {
    MALE: "Men",
    FEMALE: "Women"
}

export type Gender = typeof Gender[keyof typeof Gender]

export type RosterEntry = {
    id: number;
    name: string;
    brand: Brand;
    gender: Gender;
}

type RosterTableProps = {
    rosterEntries: RosterEntry[],
    championEntries: ChampionsEntry[]
}

export default function RosterTable(rosterTableProps: RosterTableProps) {

    function renderRosterTableByGender(gender: Gender) {
        const wrestlers = rosterTableProps.rosterEntries.filter(entry => entry.gender === gender)

        const smackdown = wrestlers.filter(entry => entry.brand === Brand.SMACKDOWN);
        const raw = wrestlers.filter(entry => entry.brand === Brand.RAW);
        const nxt = wrestlers.filter(entry => entry.brand === Brand.NXT);

        const rowCount = Math.max(smackdown.length, raw.length, nxt.length);

        return <table className={styles.gridtable}>
            <thead>
                <tr>
                    <th colSpan={3} className={compStyle.divisionHeader} style={{
                        borderColor: gender === Gender.MALE ? "green" : "darkmagenta",
                        backgroundColor: gender === Gender.MALE
                            ? "darkgreen"
                            : "darkmagenta",
                    }}>
                        {gender === Gender.MALE ? "Men's Division" : "Women's Division"}
                    </th>
                </tr>
                <tr>
                    <th className={compStyle.sd_header}>SMACKDOWN</th>
                    <th className={compStyle.raw_header}>RAW</th>
                    <th className={compStyle.nxt_header}>NXT</th>
                </tr>
            </thead>
            <tbody>
                {Array.from({ length: rowCount }, (_, index) => (
                    <tr key={index}>
                        <td className={compStyle.smackdown}>{smackdown[index]?.name || ""}</td>
                        <td className={compStyle.raw}>{raw[index]?.name || ""}</td>
                        <td className={compStyle.nxt}>{nxt[index]?.name || ""}</td>
                    </tr>
                ))}
            </tbody>
        </table>
    }


    return (
        <div>
            <MainLayout>
                <div className={compStyle.rosterContainer}>
                    <div>
                        {renderRosterTableByGender(Gender.MALE)}
                        {renderRosterTableByGender(Gender.FEMALE)}
                    </div>
                    <div>
                        <RosterChampionsTable championEntries={rosterTableProps.championEntries} />
                    </div>
                </div>
            </MainLayout>
        </div>
    )
}
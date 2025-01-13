import styles from "../app/page.module.css";
import Navbar from "./Navbar";
import Footer from "./Footer";
import MainHeader from "./MainHeader";
import MainLayout from "./MainLayout";
import TitleHistoryMiniTables from "./TitleHistoryMiniTables";

type TitleInfo = {
    titleImage: string,
    titleName: string,
    brand: string,
    championName: string
}

type ChampStats = {
    name: string,
    value: number
}

export type BeltProps = {
    title_info: TitleInfo,
    champ_stats: ChampStats[][]
}


export default function TitleHistoryPage(beltProps: BeltProps) {

    const beltPage = beltProps.title_info.titleImage.split("_design.png")[0]

    return (
        <div className={styles.container}>
            <MainHeader />
            <Navbar />
            <MainLayout>
                <div className={styles.championship_title}>
                    <div>
                        <img src={`/images/titles/${beltProps.title_info.titleImage}`} />
                    </div>
                    <div className={styles.title_name}>{`${beltProps.title_info.titleName.toUpperCase()}`}</div>
                </div>

                <div className={styles.championship_hero_footer}>
                    <div>
                        <p className={styles.championship_holder}>Championship Holder</p>
                        <p className={styles.championship_holder_name}>{`${beltProps.title_info.championName}`}</p>
                    </div>
                    <div>
                        <p className={styles.championship_holder}>Time Held</p>
                        <p className={styles.championship_holder_name}>??? days</p>
                    </div>
                </div>

                <div className={styles.championship_tables}>
                    <TitleHistoryMiniTables headerName="Times Held" championStats={beltProps.champ_stats[0]} />
                    <TitleHistoryMiniTables headerName="Longest Reign" championStats={beltProps.champ_stats[1]} />
                    <TitleHistoryMiniTables headerName="Combined Days" championStats={beltProps.champ_stats[2]} />
                </div>

                <a href={`/championships/${beltPage}/history`}><button>VIEW HISTORY</button></a>

            </MainLayout>

            <Footer />
        </div>
    )
}
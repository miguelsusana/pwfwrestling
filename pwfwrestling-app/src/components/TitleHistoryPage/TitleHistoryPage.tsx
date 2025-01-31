import compStyle from "./TitleHistory.module.css";
import styles from "../../app/page.module.css"
import Navbar from "../MainComponents/Navbar";
import Footer from "../MainComponents/Footer";
import MainHeader from "../MainComponents/MainHeader";
import MainLayout from "../MainComponents/MainLayout";
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
                <div className={compStyle.championship_title}>
                    <div>
                        <img src={`/images/titles/${beltProps.title_info.titleImage}`} />
                    </div>
                    <div className={compStyle.title_name}>{`${beltProps.title_info.titleName.toUpperCase()}`}</div>
                </div>

                <div className={compStyle.championship_hero_footer}>
                    <div>
                        <p className={compStyle.championship_holder}>Championship Holder</p>
                        <p className={compStyle.championship_holder_name}>{`${beltProps.title_info.championName}`}</p>
                    </div>
                    <div>
                        <p className={compStyle.championship_holder}>Time Held</p>
                        <p className={compStyle.championship_holder_name}>??? days</p>
                    </div>
                </div>

                <div className={compStyle.championship_tables}>
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
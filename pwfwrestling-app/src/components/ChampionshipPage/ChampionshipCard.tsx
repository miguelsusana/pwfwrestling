import styles from "./ChampionshipCard.module.css";

interface ChampionshipCardProps {
    championName: string,
    titleName: string,
    titleImage: string
}

const ChampionshipCard = ({ championName, titleName, titleImage }: ChampionshipCardProps) => {

    return (
        <div className={styles.card}>
            <img src={`/images/titles/${titleImage}`} className={styles.overlay_image} />
            <div className={styles.card_body}>
                <h1 className={styles.card_champ}>{championName}</h1>
                <h6 className={styles.card_title}>{titleName}</h6>
                <a href={`/championships/${titleImage.split("_design")[0]}`} className={styles.card_button}>History</a>
            </div>
        </div>
    )
}

export default ChampionshipCard;
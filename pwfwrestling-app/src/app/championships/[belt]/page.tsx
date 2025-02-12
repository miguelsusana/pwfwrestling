"use client"
import { useState, useEffect } from "react";
import { useParams } from "next/navigation";
import TitleHistoryPage from "@/components/TitleHistoryPage/TitleHistoryPage";
import { BeltProps } from "@/components/TitleHistoryPage/TitleHistoryPage";
import { fetchSpecificTitle } from "@/api";

export default function BeltPage() {

    const params = useParams();
    const [selectedTitle, setSelectedTitle] = useState<BeltProps>();
    useEffect(() => {
        fetchSpecificTitle(params.belt).then((data) => setSelectedTitle(data));
    }, [])

    return <div>
        {selectedTitle && (
            <TitleHistoryPage
                title_info={selectedTitle.title_info}
                champ_stats={selectedTitle.champ_stats} />
        )}
    </div>
}
"use client"
import { useState, useEffect } from "react";
import { useParams } from "next/navigation";
import TitleHistoryPage from "@/components/TitleHistoryPage";
import { BeltProps } from "@/components/TitleHistoryPage";

export default function BeltPage() {

    const params = useParams();
    const [selectedTitle, setSelectedTitle] = useState<BeltProps>();
    useEffect(() => {
        const fetchTitles = async () => {
            const response = await fetch(`http://localhost:8000/api/belt/${params.belt}`);
            const data = await response.json();
            setSelectedTitle(data);
        }
        fetchTitles();
    }, [])

    return <div>
        {selectedTitle && (
            <TitleHistoryPage
                title_info={selectedTitle.title_info}
                champ_stats={selectedTitle.champ_stats} />
        )}
    </div>
}
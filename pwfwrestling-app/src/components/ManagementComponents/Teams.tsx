"use client"
import styles from "../../app/page.module.css";
import { useState } from "react";
import { Autocomplete, TextField } from "@mui/material";
import { RosterData } from "@/app/admin/match_management/page";

type TeamProps = {
    teamNumber: number,
    roster: RosterData[],
    managersList: RosterData[],
    selectedWrestler: RosterData | undefined,
    setManagersList: (managers: RosterData[]) => void;
    setSelectedWrestler: (wrestler: RosterData) => void;
}

export function Teams(teamProps: TeamProps) {
    const [selectedManager, setSelectedManager] = useState<RosterData | undefined>();
    const [filteredRoster, setFilteredRoster] = useState<RosterData[]>([]);
    const [filteredManagers, setFilteredManagers] = useState<RosterData[]>([]);
    const [inputValue, setInputValue] = useState("");
    const [inputValueManager, setInputValueManager] = useState("");

    const handleWrestlerSearch = (event: any, value: string) => {
        setInputValue(value);
        const filtered = teamProps.roster.filter(wrestler =>
            wrestler.name.toLowerCase().startsWith(value.toLowerCase())
        );
        setFilteredRoster(filtered);
    };

    const handleManagerSearch = (event: any, value: string) => {
        setInputValueManager(value);
        const filtered = teamProps.roster.filter(manager =>
            manager.name.toLowerCase().startsWith(value.toLowerCase())
            && !teamProps.managersList.some(m => m.id === manager.id)
            && manager.id !== teamProps.selectedWrestler?.id
        );
        setFilteredManagers(filtered);
    }

    const addToManagerList = () => {
        if (selectedManager && inputValueManager.trim() !== "" && selectedManager !== teamProps.selectedWrestler) {
            teamProps.setManagersList([...teamProps.managersList, selectedManager])
            setInputValueManager("");
            setSelectedManager(undefined);
            console.log(teamProps.managersList)
        }
    }

    return (
        <div>
            <h1>Team {teamProps.teamNumber}</h1>
            <span>Wrestler 1</span>
            <Autocomplete
                options={filteredRoster.map((wrestler, idx) => { return { label: wrestler.name, id: idx } })}
                className={styles.Autocomplete}
                onChange={(event, wrestler) => wrestler && teamProps.setSelectedWrestler(filteredRoster[wrestler.id])}
                inputValue={inputValue}
                onInputChange={handleWrestlerSearch}
                renderInput={(params) => <TextField {...params} label="Select Participant" />}
            />
            <button>Add Wrestler</button>
            <span>Manager 1</span>
            <Autocomplete
                options={filteredManagers.map((wrestler, idx) => { return { label: wrestler.name, id: idx } })}
                className={styles.Autocomplete}
                onChange={(event, wrestler) => wrestler && setSelectedManager(filteredManagers[wrestler.id])}
                inputValue={inputValueManager}
                onInputChange={handleManagerSearch}
                renderInput={(params) => <TextField {...params} label="Accompanied By: " />}
            />
            <button type="button" onClick={addToManagerList} style={{ border: '2px solid red', backgroundColor: 'yellow', color: 'black' }}>Add Manager</button>
        </div>
    )
}
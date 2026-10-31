"use client"
import { useState, useMemo, useEffect } from "react";
import styles from "./management.module.css";
import type { MatchCreatePayload } from "@/api";

type Team = {
    teamNumber: number;
    competitors: (number | null)[];
    managers: (number | null)[];
};

type RosterOption = {
    id: number;
    name: string;
};

type Participant = MatchCreatePayload["participants"][number];

type AddMatchParticipantsProps = {
    roster: RosterOption[];
    onParticipantsChange: (participants: Participant[]) => void;
    matchPreviewHeader: string;
    isMainEvent: boolean;
};

function formatNames(names: string[]): string {
    if (names.length <= 1) return names[0] ?? "";
    if (names.length === 2) return `${names[0]} & ${names[1]}`;
    return `${names.slice(0, -1).join(", ")} & ${names[names.length - 1]}`;
}

export function AddMatchParticipants({ roster, onParticipantsChange, matchPreviewHeader, isMainEvent }: AddMatchParticipantsProps) {

    const [teams, setTeams] = useState<Team[]>([
        { teamNumber: 1, competitors: [null], managers: [] },
        { teamNumber: 2, competitors: [null], managers: [] },
    ]);
    const [specialReferees, setSpecialReferees] = useState<(number | null)[]>([]);


    const canAddOpponent = teams.every((team) =>
        team.competitors.some((id) => id !== null),
    );

    function updateTeamSelection(
        teamNumber: number,
        field: "competitors" | "managers",
        index: number,
        wrestlerId: number | null,
    ) {
        setTeams((current) =>
            current.map((team) => {
                if (team.teamNumber !== teamNumber) return team;

                const members = [...team[field]];
                members[index] = wrestlerId;

                return { ...team, [field]: members };
            }),
        );
    }

    function addTeamMember(teamNumber: number, field: "competitors" | "managers") {
        setTeams((current) =>
            current.map((team) =>
                team.teamNumber === teamNumber
                    ? { ...team, [field]: [...team[field], null] }
                    : team,
            ),
        );
    }

    function removeTeamMember(
        teamNumber: number,
        field: "competitors" | "managers",
        index: number,
    ) {
        setTeams((current) =>
            current.map((team) => {
                if (team.teamNumber !== teamNumber) return team;
                if (field === "competitors" && team.competitors.length <= 1) return team;

                return {
                    ...team,
                    [field]: team[field].filter((_, memberIndex) => memberIndex !== index),
                };
            }),
        );
    }

    function addNewOpponent() {
        setTeams((current) => [
            ...current,
            {
                teamNumber: Math.max(...current.map((team) => team.teamNumber)) + 1,
                competitors: [null],
                managers: [],
            },
        ]);
    }


    function removeTeam(teamNumber: number) {
        setTeams((current) => {
            if (current.length <= 2) return current;

            return current
                .filter((team) => team.teamNumber !== teamNumber)
                .map((team, index) => ({ ...team, teamNumber: index + 1 }));
        });
    }

    function addSpecialReferee() {
        setSpecialReferees((current) => [...current, null]);
    }

    function updateSpecialReferee(index: number, wrestlerId: number | null) {
        setSpecialReferees((current) =>
            current.map((id, currentIndex) =>
                currentIndex === index ? wrestlerId : id,
            ),
        );
    }

    function removeSpecialReferee(index: number) {
        setSpecialReferees((current) => current.filter((_, refereeIndex) => refereeIndex !== index));
    }

    const participants = useMemo<Participant[]>(
        () => [
            ...teams.flatMap((team) => [
                ...team.competitors
                    .filter((id): id is number => id !== null)
                    .map((wrestler_id) => ({
                        wrestler_id,
                        role: "Competitor" as const,
                        team_number: team.teamNumber,
                    })),
                ...team.managers
                    .filter((id): id is number => id !== null)
                    .map((wrestler_id) => ({
                        wrestler_id,
                        role: "Manager" as const,
                        team_number: team.teamNumber,
                    })),
            ]),
            ...specialReferees
                .filter((id): id is number => id !== null)
                .map((wrestler_id) => ({
                    wrestler_id,
                    role: "Special Referee" as const,
                    team_number: null,
                })),
        ],
        [teams, specialReferees],
    );

    useEffect(() => {
        onParticipantsChange(participants);
    }, [onParticipantsChange, participants]);

    const matchPreview = teams
        .map((team) => {
            const competitorNames = team.competitors
                .map((id) => roster.find((wrestler) => wrestler.id === id)?.name)
                .filter((name): name is string => name !== undefined);

            const managerNames = team.managers
                .map((id) => roster.find((wrestler) => wrestler.id === id)?.name)
                .filter((name): name is string => name !== undefined);

            const competitors = formatNames(competitorNames) || "TBD";
            const managers = formatNames(managerNames);

            return managers
                ? `${competitors} w/ ${managers}`
                : competitors;
        })
        .join(" vs. ");

    const refereeNames = specialReferees
        .map((id) => roster.find((wrestler) => wrestler.id === id)?.name)
        .filter((name): name is string => name !== undefined);

    return (
        <section className={styles.participantsEditor}>
            <div className={styles.participantsHeader}>
                <div>
                    <h2>Participants</h2>
                    <p>Add competitors and managers to each team.</p>
                </div>
                <span>{teams.length} teams</span>
            </div>

            <div className={styles.teamGrid}>
                {teams.map((team) => (
                    <article className={styles.teamCard} key={team.teamNumber}>
                        <div className={styles.teamHeading}>
                            <h3>Team {team.teamNumber}</h3>
                            {teams.length > 2 && (
                                <button
                                    type="button"
                                    className={styles.removeButton}
                                    aria-label={`Remove team ${team.teamNumber}`}
                                    onClick={() => removeTeam(team.teamNumber)}
                                >
                                    ×
                                </button>
                            )}
                        </div>

                        <div className={styles.participantGroup}>
                            <h4>Competitors</h4>
                            {team.competitors.map((wrestlerId, index) => (
                                <div className={styles.participantRow} key={`competitor-${index}`}>
                                    <select
                                        value={wrestlerId ?? ""}
                                        aria-label={`Team ${team.teamNumber} competitor ${index + 1}`}
                                        onChange={(event) =>
                                            updateTeamSelection(
                                                team.teamNumber,
                                                "competitors",
                                                index,
                                                event.target.value ? Number(event.target.value) : null,
                                            )
                                        }
                                    >
                                        <option value="">Select a wrestler</option>
                                        {roster.map((wrestler) => (
                                            <option key={wrestler.id} value={wrestler.id}>
                                                {wrestler.name}
                                            </option>
                                        ))}
                                    </select>

                                    {index > 0 && (
                                        <button
                                            type="button"
                                            className={styles.removeButton}
                                            aria-label={`Remove Team ${team.teamNumber} competitor ${index + 1}`}
                                            onClick={() =>
                                                removeTeamMember(team.teamNumber, "competitors", index)
                                            }
                                        >
                                            ×
                                        </button>
                                    )}
                                </div>
                            ))}

                            <button
                                type="button"
                                onClick={() => addTeamMember(team.teamNumber, "competitors")}
                            >
                                + Add Partner
                            </button>
                        </div>

                        <div className={styles.participantGroup}>
                            <h4>Managers</h4>
                            {team.managers.map((wrestlerId, index) => (
                                <div className={styles.participantRow} key={`manager-${index}`}>
                                    <select
                                        value={wrestlerId ?? ""}
                                        aria-label={`Team ${team.teamNumber} manager ${index + 1}`}
                                        onChange={(event) =>
                                            updateTeamSelection(
                                                team.teamNumber,
                                                "managers",
                                                index,
                                                event.target.value ? Number(event.target.value) : null,
                                            )
                                        }
                                    >
                                        <option value="">Select a manager</option>
                                        {roster.map((wrestler) => (
                                            <option key={wrestler.id} value={wrestler.id}>
                                                {wrestler.name}
                                            </option>
                                        ))}
                                    </select>

                                    <button
                                        type="button"
                                        className={styles.removeButton}
                                        aria-label={`Remove Team ${team.teamNumber} manager ${index + 1}`}
                                        onClick={() =>
                                            removeTeamMember(team.teamNumber, "managers", index)
                                        }
                                    >
                                        ×
                                    </button>
                                </div>
                            ))}

                            <button
                                type="button"
                                onClick={() => addTeamMember(team.teamNumber, "managers")}
                            >
                                + Add Manager
                            </button>
                        </div>
                    </article>
                ))}
            </div>

            <button
                type="button"
                onClick={addNewOpponent}
                disabled={!canAddOpponent}
            >
                + Add New Opponent
            </button>

            <div className={styles.participantGroup}>
                <h3>Special Referees</h3>
                {specialReferees.map((wrestlerId, index) => (
                    <div className={styles.participantRow} key={`referee-${index}`}>
                        <select
                            value={wrestlerId ?? ""}
                            aria-label={`Special referee ${index + 1}`}
                            onChange={(event) =>
                                updateSpecialReferee(
                                    index,
                                    event.target.value ? Number(event.target.value) : null,
                                )
                            }
                        >
                            <option value="">Select a referee</option>
                            {roster.map((wrestler) => (
                                <option key={wrestler.id} value={wrestler.id}>
                                    {wrestler.name}
                                </option>
                            ))}
                        </select>

                        <button
                            type="button"
                            className={styles.removeButton}
                            aria-label={`Remove special referee ${index + 1}`}
                            onClick={() => removeSpecialReferee(index)}
                        >
                            ×
                        </button>
                    </div>
                ))}
                <button type="button" onClick={addSpecialReferee}>
                    + Add Special Referee
                </button>
            </div>

            <div className={styles.matchPreview}>
                <h3>Match Preview</h3>
                <p className={styles.previewDetails}>
                    {isMainEvent && (
                        <>
                            <span className={styles.mainEventLabel}>MAIN-EVENT</span>
                            {matchPreviewHeader && " - "}
                        </>
                    )}
                    <strong>
                        {matchPreviewHeader || (!isMainEvent && "Select match details to preview.")}
                    </strong>
                </p>
                <p className={styles.previewMatchup}>
                    {matchPreview}
                    {refereeNames.length > 0 &&
                        ` (${formatNames(refereeNames)})`}
                </p>
            </div>
        </section>
    );
}
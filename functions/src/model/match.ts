import { Competition } from "./competition";
import { Team } from "./team";

export interface Match {
  id: number;
  utcDate: string;
  status: MatchStatus;
  matchday: number;
  lastUpdated: string;
  homeTeam: Team;
  awayTeam: Team;
  competition: Competition;
  score: {
    winner: "HOME_TEAM" | "AWAY_TEAM" | "DRAW" | null;
    duration: "REGULAR";
    fullTime: {
      home: number | null;
      away: number | null;
    };
    halfTime: {
      home: number | null;
      away: number | null;
    };
  };
}

export type MatchStatus =
  | "SCHEDULED"
  | "TIMED"
  | "IN_PLAY"
  | "PAUSED"
  | "LIVE"
  | "FINISHED"
  | "SUSPENDED"
  | "POSTPONED"
  | "CANCELLED"
  | "AWARDED";

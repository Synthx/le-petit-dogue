import { Team } from "./team";

export interface Standing {
  stage: string;
  type: "TOTAL" | "HOME" | "AWAY";
  group: string | null;
  table: Table[];
}

export interface Table {
  position: number;
  team: Team;
  playedGames: number;
  form: string | null;
  won: number;
  draw: number;
  lost: number;
  points: number;
  goalsFor: number;
  goalsAgainst: number;
  goalDifference: number;
}

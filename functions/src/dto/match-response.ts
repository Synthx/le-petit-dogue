import { Competition } from "../model/competition";
import { Match } from "../model/match";

export interface MatchResponse {
  competition?: Competition;
  matches: Match[];
}

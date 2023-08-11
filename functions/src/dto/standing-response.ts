import { Area } from "../model/area";
import { Competition } from "../model/competition";
import { Season } from "../model/season";
import { Standing } from "../model/standing";

export interface StandingResponse {
  filters: unknown;
  area: Area;
  competition: Competition;
  season: Season;
  standings: Standing[];
}

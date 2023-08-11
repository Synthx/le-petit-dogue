import { Person } from "../model/person";

export interface TeamResponse {
  id: number;
  name: string;
  shortName: string;
  tla: string;
  crest: string;
  address: string;
  website: string;
  founded: number;
  clubColors: string;
  venue: string;
  coach: Person;
  squad: Person[];
  staff: Person[];
}

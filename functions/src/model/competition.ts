export interface Competition {
  id: number;
  name: string;
  code: string;
  type: CompetitionType;
  emblem: string;
}

export type CompetitionType = "LEAGUE";

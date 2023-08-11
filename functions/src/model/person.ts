export interface Person {
  id: number;
  name: string;
  position: "Offence" | "Midfield" | "Defence" | "Goalkeeper" | "Coach" | null;
  dateOfBirth: string;
  nationality: string;
  contract?: {
    start: string;
    until: string;
  };
}

import { Person } from "./model/person";
import { Team } from "./model/team";

export const cleanTeam = (team: Team) => ({
  id: team.id,
  name: TEAM_NAMES[team.id],
  shortName: team.shortName,
  fullName: team.name,
  tla: team.tla,
});

export const TEAM_NAMES: { [id: number]: string } = {
  511: "Toulouse",
  512: "Brest",
  516: "Marseille",
  518: "Montpellier",
  521: "Lille",
  522: "Nice",
  523: "Lyon",
  524: "Paris",
  525: "Lorient",
  529: "Rennes",
  533: "Le Havre",
  541: "Clermont",
  543: "Nantes",
  545: "Metz",
  546: "Lens",
  547: "Reims",
  548: "Monaco",
  576: "Strasbourg",
};

export const cleanPerson = (person: Person) => ({
  id: person.id,
  name: person.name,
  position: person.position?.toUpperCase(),
  dateOfBirth: new Date(person.dateOfBirth),
  nationality: PERSON_NATIONALITY[person.nationality],
});

export const PERSON_NATIONALITY: { [nationality: string]: string } = {
  Turkey: "TR",
  France: "FR",
  Brazil: "BR",
  Portugal: "PT",
  Cameroon: "CM",
  Algeria: "DZ",
  Sweden: "SE",
  England: "GB",
  Slovakia: "SK",
  Canada: "CA",
  Kosovo: "XK",
  Guinea: "GN",
};

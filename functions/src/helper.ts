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

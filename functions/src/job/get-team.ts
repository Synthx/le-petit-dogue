import { TEAM_ID } from "../constant";
import { TeamResponse } from "../dto/team-response";
import { cleanPerson } from "../helper";
import { http } from "../http";
import { firestore } from "../index";

export const getTeam = async () => {
  const batch = firestore.batch();
  const collection = firestore.collection("squads");

  const response = await http.get(`teams/${TEAM_ID}`);
  const data = response.data as TeamResponse;

  batch.set(collection.doc(`${data.coach.id}`), cleanPerson(data.coach));
  for (const person of data.squad) {
    batch.set(collection.doc(`${person.id}`), cleanPerson(person));
  }

  await batch.commit();

  return data;
};

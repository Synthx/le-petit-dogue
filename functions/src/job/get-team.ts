import { TEAM_ID } from "../constant";
import { TeamResponse } from "../dto/team-response";
import { http } from "../http";
import { firestore } from "../index";

export const getTeam = async () => {
  const batch = firestore.batch();
  const collection = firestore.collection("squads");

  const response = await http.get(`teams/${TEAM_ID}`);
  const data = response.data as TeamResponse;

  batch.set(collection.doc(`${data.coach.id}`), {
    id: data.coach.id,
    name: data.coach.name,
    dateOfBirth: data.coach.dateOfBirth,
    position: "Coach",
  });

  for (const person of data.squad) {
    batch.set(collection.doc(`${person.id}`), {
      id: person.id,
      name: person.name,
      position: person.position,
      dateOfBirth: person.dateOfBirth,
      nationality: person.nationality,
    });
  }

  await batch.commit();

  return data;
};

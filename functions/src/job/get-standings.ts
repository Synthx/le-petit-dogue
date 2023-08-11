import { COMPETITION_ID } from "../constant";
import { StandingResponse } from "../dto/standing-response";
import { http } from "../http";
import { firestore } from "../index";

/**
 * get ligue-1 standings
 * ran every 15 minutes during match-day
 */
export const getStandings = async () => {
  const response = await http.get(`competitions/${COMPETITION_ID}/standings`);
  const { standings } = response.data as StandingResponse;
  const tables = standings.find((s) => s.type === "TOTAL")?.table;
  if (!tables) {
    return [];
  }

  const batch = firestore.batch();
  const collection = firestore.collection("standings");
  for (const standing of tables) {
    const standingDocument = collection.doc(`${standing.team.id}`);
    batch.set(standingDocument, {
      position: standing.position,
      team: standing.team,
      playedGames: standing.playedGames,
      won: standing.won,
      draw: standing.draw,
      lost: standing.lost,
      points: standing.points,
      goalsFor: standing.goalsFor,
      goalsAgainst: standing.goalsAgainst,
      goalDifference: standing.goalDifference,
    });
  }

  await batch.commit();

  return tables;
};

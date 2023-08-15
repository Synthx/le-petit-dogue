import { Moment } from "moment";
import { COMPETITION_ID } from "../constant";
import { MatchResponse } from "../dto/match-response";
import { cleanTeam } from "../helper";
import { http } from "../http";
import { firestore } from "../index";
import { MatchStatus } from "../model/match";

/**
 * get all next matches by a particular status
 */
export const getMatches = async (statuses?: MatchStatus[], date?: Moment) => {
  const collection = firestore.collection("matches");
  const batch = firestore.batch();

  const response = await http.get(`competitions/${COMPETITION_ID}/matches`, {
    params: {
      status: statuses?.join(","),
      dateFrom: date?.format("YYYY-MM-DD"),
      dateTo: date?.format("YYYY-MM-DD"),
    },
  });
  const { matches } = response.data as MatchResponse;
  for (const match of matches) {
    const document = collection.doc(`${match.id}`);
    batch.set(document, {
      id: match.id,
      matchday: match.matchday,
      status: match.status,
      date: new Date(match.utcDate),
      competition: match.competition,
      home: cleanTeam(match.homeTeam),
      away: cleanTeam(match.awayTeam),
      score: match.score,
    });
  }

  await batch.commit();

  return matches;
};

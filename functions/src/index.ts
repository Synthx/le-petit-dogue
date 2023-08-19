import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { Response } from "firebase-functions";
import { setGlobalOptions } from "firebase-functions/v2";
import { onRequest, Request } from "firebase-functions/v2/https";
import { onSchedule } from "firebase-functions/v2/scheduler";
import * as moment from "moment";
import { getMatches } from "./job/get-matches";
import { getStandings } from "./job/get-standings";
import { getTeam } from "./job/get-team";

setGlobalOptions({
  region: "europe-west1",
  maxInstances: 2,
});

const app = initializeApp();
const timezone = "Europe/Paris";
export const firestore = getFirestore(app);
firestore.settings({
  ignoreUndefinedProperties: true,
});

/**
 * scheduled jobs
 */

export const scheduledGetScheduledMatches = onSchedule(
  {
    schedule: "0 6 * * *",
    timeZone: timezone,
  },
  async () => {
    await getMatches(["SCHEDULED", "TIMED"]);
  },
);

export const scheduledGetLiveMatches = onSchedule(
  {
    schedule: "*/5 12-23 * * *",
    timeZone: timezone,
  },
  async () => {
    await getMatches(["LIVE"]);
  },
);

export const scheduledGetFinishedMatches = onSchedule(
  {
    schedule: "0 3 * * *",
    timeZone: timezone,
  },
  async () => {
    const yesterday = moment().subtract(1, "days");
    await getMatches(["FINISHED"], yesterday);
  },
);

export const scheduledGetStandings = onSchedule(
  {
    schedule: "0 6 * * *",
    timeZone: timezone,
  },
  async () => {
    await getStandings();
  },
);

/**
 * manual jobs
 */

export const requestGetStandings = onRequest(
  { cors: "*" },
  async (request, response) => {
    const valid = secureEndpoint(request, response);
    if (!valid) return;

    await getStandings();
    response.json(true);
  },
);

export const requestGetMatches = onRequest(
  { cors: "*" },
  async (request, response) => {
    const valid = secureEndpoint(request, response);
    if (!valid) return;

    await getMatches();
    response.json(true);
  },
);

export const requestGetTeam = onRequest(
  { cors: "*" },
  async (request, response) => {
    const valid = secureEndpoint(request, response);
    if (!valid) return;

    await getTeam();
    response.json(true);
  },
);

const secureEndpoint = (request: Request, response: Response) => {
  if (request.method !== "POST") {
    response.status(405).json({ error: "Method Not Allowed" });
    return false;
  }

  const token = request.header("Authorization");
  if (!token) {
    response.status(401).json({ error: "Unauthorized" });
    return false;
  } else if (token !== "Bearer " + process.env.SECRET_TOKEN) {
    response.status(403).json({ error: "Forbidden" });
    return false;
  }

  return true;
};

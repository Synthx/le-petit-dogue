import axios from "axios";

const BASE_URL = "https://api.football-data.org/v4";

export const http = axios.create({
  baseURL: BASE_URL,
  responseType: "json",
  headers: {
    "Content-Type": "application/json",
    common: {
      "X-Auth-Token": process.env.API_KEY,
    },
  },
});

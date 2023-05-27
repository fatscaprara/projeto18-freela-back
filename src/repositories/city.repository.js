import { db } from "../config/database.js";

export function getAllCitiesDB() {
  const cities = db.query(`
      SELECT
        *
      FROM
        cities
      ;
    `);

  return cities;
}

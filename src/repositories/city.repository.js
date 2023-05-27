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

export function getCityByIdDB(id) {
  const city = db.query(
    `
    SELECT
      *
    FROM
      cities
    WHERE
      id = $1
  `,
    [id]
  );

  return city;
}

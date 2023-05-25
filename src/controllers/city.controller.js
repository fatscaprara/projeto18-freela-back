import { db } from "../config/database.js";

export async function getCities(req, res) {
  try {
    const cities = await db.query(`
      SELECT
        *
      FROM
        cities
      ;
    `);

    res.send(cities.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

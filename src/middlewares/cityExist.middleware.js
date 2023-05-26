import { db } from "../config/database.js";

export async function cityExist(req, res, next) {
  try {
    const { id } = req.params;
    const city = await db.query(
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

    if (!city.rowCount) return res.sendStatus(401);

    res.cityId = city.rows[0].id;
    next();
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

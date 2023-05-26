import { db } from "../config/database.js";

export async function hotelExist(req, res, next) {
  try {
    const { id } = req.params;
    const hotel = await db.query(
      `
      SELECT
        *
      FROM
        hotels
      WHERE
        id = $1
    `,
      [id]
    );

    if (!hotel.rowCount) return res.sendStatus(404);

    req.hotelId = hotel.rows[0].id;
    next();
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

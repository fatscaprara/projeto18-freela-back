import { db } from "../config/database.js";

export async function getHotelById(req, res) {
  try {
    const { hotelId } = req;
    const hotel = await db.query(
      `
      SELECT
        h.id,
        h.name,
        h.address,
        h.price,
        h.description,
        c.name AS city
      FROM
        hotels AS h
      JOIN
        cities AS c
      ON
        h.city_id = c.id 
      WHERE
        h.id = $1
      ;
    `,
      [hotelId]
    );

    res.send(hotel.rows[0]);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

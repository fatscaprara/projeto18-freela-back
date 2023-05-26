import { db } from "../config/database.js";

export async function ticketExist(req, res, next) {
  try {
    const { id } = req.params;
    const ticket = await db.query(
      `
      SELECT
        t.id AS id,
        oc.name AS origin_city,
        dc.name AS destination_city,
        a.name AS airline,
        t.departure_time AS departure_time,
        t.arrival_time AS arrival_time,
        t.price AS price,
        t.image_url AS image_url
      FROM
        cities AS oc
      JOIN
        tickets AS t
      ON
        oc.id = t.origin_city_id
      JOIN
        cities AS dc
      ON
        dc.id = t.destination_city_id
      JOIN
        airlines AS a
      ON
        a.id = t.airline_id
      WHERE
        t.id = $1
      ;
    `,
      [id]
    );

    if (!ticket.rowCount) return res.sendStatus(404);

    req.ticket = ticket.rows[0];
    next();
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}

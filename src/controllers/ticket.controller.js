import { db } from "../config/database.js";

export async function getTicketById(req, res) {
  try {
    const { ticket } = req;

    res.send(ticket);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

export async function getTicketByDestination(req, res) {
  try {
    const { cityId } = req;

    const tickets = await db.query(
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
        t.destination_city_id = $1
      ;
    `,
      [cityId]
    );

    if (!tickets.rowCount) return res.sendStatus(404);

    res.send(tickets.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

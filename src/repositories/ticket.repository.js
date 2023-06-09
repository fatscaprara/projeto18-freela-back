import { db } from "../config/database.js";

export function getTicketByIdDB(id) {
  const ticket = db.query(
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

  return ticket;
}

export function getTicketsByDestinationDB(destinationCityId) {
  const tickets = db.query(
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
    [destinationCityId]
  );

  return tickets;
}

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

    const { rows: amenitiesRows } = await db.query(
      `
      SELECT
        a.name AS amenity
      FROM
        hotel_amenities AS ha
      JOIN
        amenities AS a
      ON
        a.id = ha.amenity_id
      WHERE
        ha.hotel_id = $1
      ;
    `,
      [hotelId]
    );

    const amenities = amenitiesRows.map(({ amenity }) => amenity);

    const { rows: imageRows } = await db.query(
      `
      SELECT
        url
      FROM
        images
      WHERE
        hotel_id = $1
      ;
    `,
      [hotelId]
    );

    const images = imageRows.map(({ url }) => url);

    const hotelData = {
      ...hotel.rows[0],
      amenities,
      images,
    };

    res.send(hotelData);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

export async function getHotelsByDestination(req, res) {
  try {
    const { cityId } = req;

    const hotels = await db.query(
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
        h.city_id = $1
      ;
    `,
      [cityId]
    );

    res.send(hotels.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

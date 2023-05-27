import { db } from "../config/database.js";

export function getHotelByIdDB(id) {
  const hotel = db.query(
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

  return hotel;
}

export function getCompleteDataHotelByIdDB(id) {
  const hotel = db.query(
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
    [id]
  );

  return hotel;
}

export function getAmenitiesByHotelIdDB(id) {
  const amenities = db.query(
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
    [id]
  );

  return amenities;
}

export function getImagesByHotelIdDB(id) {
  const images = db.query(
    `
    SELECT
      url
    FROM
      images
    WHERE
      hotel_id = $1
    ;
  `,
    [id]
  );

  return images;
}

export function getHotelsByDestinationDB(cityId) {
  const hotels = db.query(
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

  return hotels;
}

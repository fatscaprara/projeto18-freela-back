import {
  getAmenitiesByHotelIdDB,
  getCompleteDataHotelByIdDB,
  getHotelsByDestinationDB,
  getImagesByHotelIdDB,
} from "../repositories/hotel.repository.js";

export async function getHotelById(req, res) {
  try {
    const { hotelId } = req;
    const hotel = await getCompleteDataHotelByIdDB(hotelId);

    const { rows: amenitiesRows } = await getAmenitiesByHotelIdDB(hotelId);

    const amenities = amenitiesRows.map(({ amenity }) => amenity);

    const { rows: imageRows } = await getImagesByHotelIdDB(hotelId);

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

    const hotels = await getHotelsByDestinationDB(cityId);

    res.send(hotels.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

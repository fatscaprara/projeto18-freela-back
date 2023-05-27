import { db } from "../config/database.js";
import { getAllCitiesDB } from "../repositories/city.repository.js";

export async function getCities(req, res) {
  try {
    const cities = await getAllCitiesDB();

    res.send(cities.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

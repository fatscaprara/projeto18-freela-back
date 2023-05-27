import { getCityByIdDB } from "../repositories/city.repository.js";

export async function cityExist(req, res, next) {
  try {
    const { id } = req.params;
    const city = await getCityByIdDB(id);

    if (!city.rowCount) return res.sendStatus(404);

    req.cityId = city.rows[0].id;
    next();
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

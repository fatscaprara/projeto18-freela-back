import express from "express";
import { hotelExist } from "../middlewares/hotelExist.middleware.js";
import {
  getHotelById,
  getHotelsByDestination,
} from "../controllers/hotel.controller.js";
import { cityExist } from "../middlewares/cityExist.middleware.js";

const router = express.Router();

router.get("/hotels/:id", hotelExist, getHotelById);
router.get("/hotels/destination/:id", cityExist, getHotelsByDestination);

export default router;

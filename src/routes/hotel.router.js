import express from "express";
import { hotelExist } from "../middlewares/hotelExist.middleware.js";
import { getHotelById } from "../controllers/hotel.controller.js";

const router = express.Router();

router.get("/hotels/:id", hotelExist, getHotelById);

export default router;

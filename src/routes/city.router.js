import express from "express";
import { getCities } from "../controllers/city.controller.js";

const router = express.Router();

router.get("/cities", getCities);

export default router;

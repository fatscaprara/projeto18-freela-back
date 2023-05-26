import express from "express";
import { ticketExist } from "../middlewares/ticketExist.middleware.js";
import { getTicketById } from "../controllers/ticket.controller.js";
import { cityExist } from "../middlewares/cityExist.middleware.js";

const router = express.Router();

router.get("/tickets/:id", ticketExist, getTicketById);
router.get("/tickets/destination/:id", cityExist);

export default router;

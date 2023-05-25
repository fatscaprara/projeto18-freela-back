import express from "express";
import { ticketExist } from "../middlewares/ticketExist.middleware.js";
import { getTicketById } from "../controllers/ticket.controller.js";

const router = express.Router();

router.get("/tickets/:id", ticketExist, getTicketById);

export default router;

import express from "express";
import cors from "cors";
import dotenv from "dotenv";
dotenv.config();

import cityRouter from "./routes/city.router.js";
import ticketRouter from "./routes/ticket.router.js";
import hotelRouter from "./routes/hotel.router.js";

const server = express();
server.use(express.json());
server.use(cors());
server.use(cityRouter);
server.use(ticketRouter);
server.use(hotelRouter);

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`Server running in PORT: ${port}`));

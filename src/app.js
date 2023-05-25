import express from "express";
import cors from "cors";
import dotenv from "dotenv";
dotenv.config();

import cityRouter from "./routes/city.router.js";

const server = express();
server.use(express.json());
server.use(cors());
server.use(cityRouter);

const port = process.env.PORT || 5000;
server.listen(port, () => console.log(`Server running in PORT: ${port}`));

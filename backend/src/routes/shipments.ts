import express from "express";
import { createShipment, getShipment } from "../controllers/shipmentsController";

export const shipmentsRouter = express.Router();

// Create a new shipment
shipmentsRouter.post("/", createShipment);

// Get a shipment by its polica ID
shipmentsRouter.get("/:polica", getShipment);

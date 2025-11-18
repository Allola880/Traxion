import express from "express";

export const shipmentsRouter = express.Router();

shipmentsRouter.get("/:polica", (_req, res) => {
    return res.status(501).json({ error: "Not implemented" });
});

shipmentsRouter.post("/", (_req, res) => {
    return res.status(501).json({ error: "Not implemented" });
});

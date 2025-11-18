import express from "express";
import cors from "cors";
import { shipmentsRouter } from "./routes/shipments";

const app = express();

app.use(cors());
app.use(express.json());

app.use("/api/shipments", shipmentsRouter);

app.get("/health", (_req, res) => {
    return res.json({ status: "OK" });
});

const PORT = process.env.PORT ? Number(process.env.PORT) : 5000;

app.listen(PORT, () => {
    console.log(`Traxion backend listening on http://localhost:${PORT}`);
});
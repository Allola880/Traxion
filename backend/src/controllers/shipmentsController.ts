import { Request, Response } from "express";
import crypto from "crypto";
import { db } from "../db";

function generatePolica(): string {
    const randomPart= crypto.randomBytes(3).toString("hex").toUpperCase().slice(0,6);

    const letters = Array.from({ length: 2 }, () =>
        String.fromCharCode(65 + Math.floor(Math.random() * 26))
    ).join("");

    return letters + randomPart;
}

export const createShipment = (req: Request, res: Response) => {
    const {
        shipper_id,
        receiver_id,
        package_type_id,
        shipping_mode_id,
        origin_country_id,
        destination_country_id,
        actual_weight,
        volumetric_weight,
        content
    } = req.body;

    if (
        !shipper_id ||
        !receiver_id ||
        !package_type_id ||
        !shipping_mode_id ||
        !origin_country_id ||
        !destination_country_id ||
        actual_weight === undefined ||
        volumetric_weight === undefined
    ) {
        return res.status(400).json({ error: "Missing required shipment fields" });
    }

    // Generate an 8-character polica
    const polica = generatePolica();

    const sql = `
        INSERT INTO shipments (
            polica,
            shipper_id,
            receiver_id,
            package_type_id,
            shipping_mode_id,
            origin_country_id,
            destination_country_id,
            actual_weight,
            volumetric_weight,
            content
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const params = [
        polica,
        shipper_id,
        receiver_id,
        package_type_id,
        shipping_mode_id,
        origin_country_id,
        destination_country_id,
        actual_weight,
        volumetric_weight,
        content || null
    ];

    db.query(sql, params, (err: any) => {
        if (err) {
            console.error("Error inserting shipment:", err);
            return res.status(500).json({ error: "Database insert failed", details: err });
        }

        return res.status(201).json({ polica });
    });
};

export const getShipment = (req: Request, res: Response) => {
    return res.status(501).json({ error: "getShipment not implemented" });
};

import mysql from "mysql2";
import dotenv from "dotenv";

dotenv.config();

export const db = mysql.createPool({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER,
    password: process.env.DB_PASS || undefined,
    database: process.env.DB_NAME
});

db.getConnection((err, connection) => {
    if (err) {
        console.error("✕ Database connection failed:", err);
    } else {
        console.log("✓ Connected to MySQL database:");
        connection.release();
    }
});

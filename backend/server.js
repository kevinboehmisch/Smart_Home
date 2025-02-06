require("dotenv").config();
const express = require("express");
const { Pool } = require("pg");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: 5432,
});

app.get("/", (req, res) => {
    res.send("Server läuft!");
});

app.get("/data", async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM test_table");
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send("Fehler beim Abrufen der Daten");
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server läuft auf Port ${PORT}`));

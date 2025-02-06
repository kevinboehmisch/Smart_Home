-- Tabelle für Sensoren
CREATE TABLE IF NOT EXISTS sensor (
    sensor_id TEXT PRIMARY KEY,  -- Manuelle ID für den Sensor (z. B. "device-123")
    co2 NUMERIC(10,2),
    humidity NUMERIC(10,2),
    temperature NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabelle für historische Sensordaten
CREATE TABLE IF NOT EXISTS sensor_history (
    id SERIAL PRIMARY KEY,  -- Automatische ID für historische Einträge
    sensor_id TEXT NOT NULL,  -- Sensor-ID als Fremdschlüssel
    co2 NUMERIC(10,2),
    humidity NUMERIC(10,2),
    temperature NUMERIC(10,2),
    reading_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sensor_id) REFERENCES sensor(sensor_id) ON DELETE CASCADE
);

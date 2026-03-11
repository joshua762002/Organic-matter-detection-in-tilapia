CREATE DATABASE IF NOT EXISTS organic_tilapia;
USE organic_tilapia;


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    role ENUM('admin','manager','staff') DEFAULT 'staff',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

INSERT INTO users (username, password, full_name, role)
VALUES
('admin', '1234', 'System Administrator', 'admin'),
('manager1', '1234', 'Maria Santos', 'manager'),
('staff1', '1234', 'Juan Dela Cruz', 'staff'),
('staff2', '1234', 'Pedro Reyes', 'staff'),
('staff3', '1234', 'Linda walker', 'staff'),
('staff4', '1234', 'Coco martin', 'staff');

CREATE TABLE ponds (
    pond_id INT AUTO_INCREMENT PRIMARY KEY,
    pond_name VARCHAR(50),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    status ENUM('Safe','Moderate','High') DEFAULT 'Safe',
    last_reading DECIMAL(5,2),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ponds (pond_name, latitude, longitude, status, last_reading)
VALUES
('Pond A', 14.657000, 120.986000, 'Safe', 35.5),
('Pond B', 14.659000, 120.990000, 'High', 78.2),
('Pond C', 14.661000, 120.992000, 'Moderate', 45.1);


CREATE TABLE detections (
    detection_id INT AUTO_INCREMENT PRIMARY KEY,
    pond_id INT,
    sample_code VARCHAR(50) NOT NULL,
    organic_level DECIMAL(5,2) NOT NULL,
    water_temperature DECIMAL(5,2),
    ph_level DECIMAL(4,2),
    status ENUM('Safe','Moderate','High'),
    created_by INT,
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pond_id) REFERENCES ponds(pond_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

INSERT INTO detections (pond_id, sample_code, organic_level, water_temperature, ph_level, status, created_by)
VALUES
(1, 'SAMPLE-001', 35.50, 28.4, 7.5, 'Safe', 3),
(2, 'SAMPLE-002', 78.20, 30.1, 6.8, 'High', 4),
(3, 'SAMPLE-003', 45.10, 27.9, 7.2, 'Moderate', 3);
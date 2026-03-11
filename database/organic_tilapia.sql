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
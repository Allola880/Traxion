-- ------------------------------------------
-- Traxion Database Schema
-- Created by: Ali
-- Sector 1 - SQL-1
-- ------------------------------------------

DROP DATABASE IF EXISTS traxion;

CREATE DATABASE traxion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE traxion;

CREATE TABLE countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    iso_code CHAR(2) NOT NULL UNIQUE   -- da el howa US, EG keda
);

CREATE TABLE package_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE shipping_modes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mode_name VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE shippers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    account_number CHAR(6) UNIQUE,
    address VARCHAR(255)
);


CREATE TABLE receivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE shipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    polica CHAR(8) NOT NULL UNIQUE,   -- e.g. AB123456
    shipper_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content VARCHAR(255),
    actual_weight DECIMAL(6,2),
    volumetric_weight DECIMAL(6,2),
    package_type_id INT,
    piece_count INT DEFAULT 1,
    origin_country_id INT NOT NULL,
    destination_country_id INT NOT NULL,
    shipping_mode_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (shipper_id) REFERENCES shippers(id),
    FOREIGN KEY (receiver_id) REFERENCES receivers(id),
    FOREIGN KEY (origin_country_id) REFERENCES countries(id),
    FOREIGN KEY (destination_country_id) REFERENCES countries(id),
    FOREIGN KEY (package_type_id) REFERENCES package_types(id),
    FOREIGN KEY (shipping_mode_id) REFERENCES shipping_modes(id)
);
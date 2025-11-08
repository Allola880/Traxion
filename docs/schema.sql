-- ------------------------------------------
-- Traxion Database Schema
-- Created by: Ali
-- Sector 1 - SQL-1
-- ------------------------------------------

DROP DATABASE IF EXISTS traxion;

CREATE DATABASE traxion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE traxion;

    -- Shipments Table:

    CREATE TABLE shipments (
        id BIGNIT AUTO_INCREMENT PRIMARY KEY,
        waybill_number VARCHAR(64) NOT NULL,
        shipment_waybill_number VARCHAR(64),
        piece_id VARCHAR(64),
        product_code VARCHAR(64),
        product_desc VARCHAR(255),
        origin_code VARCHAR(16),
        origin_country VARCHAR(64),
        destination_code VARCHAR(16),
        destination_country VARCHAR(64),
        shipper_name VARCHAR(255),
        shipper_phone VARCHAR(64),
        receiver_name VARCHAR(255),
        receiver_phone VARCHAR(64),
        piece_count INT DEFAULT 1,
        weight_kg DECIMAL(8,3) DEFAULT 0.0,
        vol_weight_kg DECIMAL(8,3) DEFAULT 0.0,
        longest_piece_cm VARCHAR(64),
        customs_value DECIMAL(12,2) DEFAULT 0.00,
        currency VARCHAR(8) DEFAULT 'USD',
        pickup_datetime DATETIME NULL,
        expected_delivery DATETIME NULL,
        committed_delivery DATETIME NULL,
        service_code VARCHAR(64),
        product_content VARCHAR(255),
        edd_status VARCHAR(64),
        paperwork JSON DEFAULT NULL,
        status VARCHAR(64) DEFAULT 'unknown',
        raw_row JSON DEFAULT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        UNIQUE KEY ux_waybill_piece (waybill_number, piece_id),
        INDEX idx_waybill (waybill_number),
        INDEX idx_origin (origin_code),
        INDEX idx_destination (destination_code)
    );
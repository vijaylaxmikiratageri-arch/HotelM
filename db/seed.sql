-- Hotel Management System — Seed Data

-- Room Types
INSERT INTO room_types (name, description, base_price, capacity) VALUES
('Standard',   'Comfortable room with essential amenities',          2500.00, 2),
('Deluxe',     'Spacious room with premium amenities and city view', 4500.00, 2),
('Suite',      'Luxury suite with separate living area',             8000.00, 4),
('Family',     'Large room designed for families with children',     6000.00, 6);

-- Rooms
INSERT INTO rooms (room_number, room_type_id, floor, status) VALUES
('101', 1, 1, 'available'),
('102', 1, 1, 'available'),
('103', 2, 1, 'available'),
('201', 2, 2, 'available'),
('202', 3, 2, 'available'),
('301', 3, 3, 'available'),
('302', 4, 3, 'available'),
('303', 1, 3, 'available');

-- Sample Guest
INSERT INTO guests (first_name, last_name, email, phone, id_proof_type, id_proof_number, address) VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '+91-9876543210', 'Aadhaar', '1234-5678-9012', 'Mumbai, Maharashtra');

-- Hotel Management System — Initial Schema
-- Provider: Neon PostgreSQL

-- ============================================
-- GUESTS
-- ============================================
CREATE TABLE IF NOT EXISTS guests (
    id              SERIAL PRIMARY KEY,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    phone           VARCHAR(20),
    id_proof_type   VARCHAR(50),
    id_proof_number VARCHAR(100),
    address         TEXT,
    created_at      TIMESTAMP DEFAULT NOW(),
    updated_at      TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- ROOM TYPES
-- ============================================
CREATE TABLE IF NOT EXISTS room_types (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE,   -- e.g. Standard, Deluxe, Suite
    description TEXT,
    base_price  DECIMAL(10, 2) NOT NULL,
    capacity    INT NOT NULL DEFAULT 2
);

-- ============================================
-- ROOMS
-- ============================================
CREATE TABLE IF NOT EXISTS rooms (
    id          SERIAL PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type_id INT NOT NULL REFERENCES room_types(id),
    floor       INT,
    status      VARCHAR(20) DEFAULT 'available',  -- available, occupied, maintenance
    created_at  TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- BOOKINGS
-- ============================================
CREATE TABLE IF NOT EXISTS bookings (
    id              SERIAL PRIMARY KEY,
    guest_id        INT NOT NULL REFERENCES guests(id),
    room_id         INT NOT NULL REFERENCES rooms(id),
    check_in_date   DATE NOT NULL,
    check_out_date  DATE NOT NULL,
    status          VARCHAR(20) DEFAULT 'confirmed',  -- confirmed, checked_in, checked_out, cancelled
    total_amount    DECIMAL(10, 2),
    payment_status  VARCHAR(20) DEFAULT 'pending',    -- pending, paid, refunded
    created_at      TIMESTAMP DEFAULT NOW(),
    updated_at      TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- STAFF
-- ============================================
CREATE TABLE IF NOT EXISTS staff (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(255) UNIQUE NOT NULL,
    phone       VARCHAR(20),
    role        VARCHAR(50) NOT NULL,  -- admin, receptionist, housekeeping, manager
    password_hash VARCHAR(255) NOT NULL,
    is_active   BOOLEAN DEFAULT TRUE,
    created_at  TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- USERS
-- ============================================
CREATE TABLE IF NOT EXISTS users (
    id              SERIAL PRIMARY KEY,
    email           VARCHAR(255) UNIQUE NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    role            VARCHAR(50) DEFAULT 'guest', -- guest, staff, admin
    guest_id        INT REFERENCES guests(id),   -- Optional link to guest profile
    staff_id        INT REFERENCES staff(id),    -- Optional link to staff profile
    is_active       BOOLEAN DEFAULT TRUE,
    created_at      TIMESTAMP DEFAULT NOW(),
    updated_at      TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX idx_bookings_guest ON bookings(guest_id);
CREATE INDEX idx_bookings_room ON bookings(room_id);
CREATE INDEX idx_bookings_dates ON bookings(check_in_date, check_out_date);
CREATE INDEX idx_rooms_status ON rooms(status);

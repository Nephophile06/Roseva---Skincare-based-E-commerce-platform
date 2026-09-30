-- ============================================================================
-- Roséva Skincare - Oracle Database Schema (Oracle 21c / XE)
-- Description: Table definitions and initial seed data for Roséva Skincare
-- ============================================================================

-- Drop tables if needed (optional)
-- DROP TABLE payment_details CASCADE CONSTRAINTS;
-- DROP TABLE order_items CASCADE CONSTRAINTS;
-- DROP TABLE orders CASCADE CONSTRAINTS;
-- DROP TABLE cart_items CASCADE CONSTRAINTS;
-- DROP TABLE skin_profiles CASCADE CONSTRAINTS;
-- DROP TABLE products CASCADE CONSTRAINTS;
-- DROP TABLE users CASCADE CONSTRAINTS;

-- 1. USERS TABLE
CREATE TABLE users (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(150) NOT NULL,
    email VARCHAR2(150) UNIQUE NOT NULL,
    phone VARCHAR2(50),
    address VARCHAR2(300),
    contact_number VARCHAR2(50),
    gender VARCHAR2(20),
    role VARCHAR2(50) DEFAULT 'Member',
    password_hash VARCHAR2(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. PRODUCTS TABLE
CREATE TABLE products (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(200) UNIQUE NOT NULL,
    price NUMBER(10,2) NOT NULL,
    prod_size VARCHAR2(50),
    image VARCHAR2(255),
    category VARCHAR2(100),
    description VARCHAR2(1000),
    ingredients VARCHAR2(2000)
);

-- 3. CART_ITEMS TABLE
CREATE TABLE cart_items (
    id NUMBER PRIMARY KEY,
    user_email VARCHAR2(150) NOT NULL,
    product_id NUMBER,
    product_name VARCHAR2(200) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    item_size VARCHAR2(50),
    image VARCHAR2(255),
    quantity NUMBER DEFAULT 1,
    selected NUMBER(1) DEFAULT 1,
    CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL
);

-- 4. ORDERS TABLE
CREATE TABLE orders (
    id NUMBER PRIMARY KEY,
    order_code VARCHAR2(50) UNIQUE NOT NULL,
    user_email VARCHAR2(150) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    phone VARCHAR2(50),
    street_address VARCHAR2(300),
    district VARCHAR2(100),
    city VARCHAR2(100),
    payment_method VARCHAR2(50),
    account_holder_name VARCHAR2(150),
    card_last4 VARCHAR2(10),
    subtotal NUMBER(10,2),
    shipping_fee NUMBER(10,2),
    discount NUMBER(10,2),
    total_amount NUMBER(10,2),
    status VARCHAR2(50) DEFAULT 'Processing',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. ORDER_ITEMS TABLE
CREATE TABLE order_items (
    id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_id NUMBER,
    product_name VARCHAR2(200) NOT NULL,
    item_size VARCHAR2(50),
    price NUMBER(10,2) NOT NULL,
    quantity NUMBER NOT NULL,
    subtotal NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- 6. PAYMENT_DETAILS TABLE
CREATE TABLE payment_details (
    id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    payment_method VARCHAR2(50),
    account_holder_name VARCHAR2(150),
    card_number VARCHAR2(50),
    expiry_date VARCHAR2(20),
    cvc VARCHAR2(10),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- 7. SKIN_PROFILES TABLE
CREATE TABLE skin_profiles (
    id NUMBER PRIMARY KEY,
    user_email VARCHAR2(150) UNIQUE NOT NULL,
    skin_barrier VARCHAR2(50),
    skin_hydration VARCHAR2(50),
    skin_sensitivity VARCHAR2(50),
    skin_sebum VARCHAR2(50),
    stressors VARCHAR2(500),
    other_notes VARCHAR2(1000),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- INITIAL SEED DATA
-- ============================================================================

-- Seed demo user (password: roseva123 with SHA-256 + salt RosevaSkincare@2026)
INSERT INTO users (id, name, email, phone, address, contact_number, gender, role, password_hash)
VALUES (1, 'Tousif Tasrik', 'tousif.tasrik@roseva.com', '+880 1712 345678', '45/A, Banani Avenue, Road 11', '+880 1712 345678', 'male', 'VIP Member', 'da206fba1fd2f46b149bfe36b48459a9307399f36f3630623a31c5b8b92b6db4');

-- Seed initial products
INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (1, 'Roséva Hydro-Boost', 20.00, '100ml', 'assets/hydro boost.png', 'Moisturizer', 'Deeply hydrating botanical cream infused with multi-molecular hyaluronic acid.', 'Aqua, Hyaluronic Acid, Squalane, Rose Extract');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (2, 'Roséva Glow Restore', 35.00, '320ml', 'assets/glow restore.png', 'Serum', 'Restores youthful radiance with concentrated clinical vitamin C and rosehip oil.', 'Aqua, Ascorbic Acid 10%, Rosehip Seed Oil, Niacinamide');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (3, 'Roséva Skin Renewal', 40.00, '60ml', 'assets/skin renewal.png', 'Serum', 'Cellular renewal elixir formulated with gentle plant-derived retinoid alternatives.', 'Aqua, Bakuchiol 2%, Peptides, Rose Floral Water');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (4, 'Roséva Cloud Drench', 15.00, '250ml', 'assets/cloud drench.png', 'Cleanser', 'Weightless foaming face wash that purifies without compromising skin barrier.', 'Aqua, Cocamidopropyl Betaine, Glycerin, Centella Asiatica');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (5, 'Roséva Cloud Drench Intensive', 58.00, '200ml', 'assets/cloud drench.png', 'Moisturizer', 'Intense barrier repair moisturizer for very dry and compromised complexions.', 'Aqua, Ceramides NP/AP/EOP, Shea Butter, Panthenol');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (6, 'Roséva Hydro-Boost Crème', 46.00, '50ml', 'assets/hydro boost.png', 'Moisturizer', 'Rich nourishing gel-cream delivering 72 hours of lock-in hydration.', 'Aqua, Sodium Hyaluronate, Beta-Glucan, Jojoba Oil');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (7, 'Roséva Skin Renewal Concentrate', 62.00, '30ml', 'assets/skin renewal.png', 'Serum', 'Targeted night repair concentrate accelerating epidermal regeneration.', 'Aqua, Tri-Peptide Complex, Ferulic Acid, Resveratrol');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (8, 'Roséva Glow Restore Milk', 35.00, '150ml', 'assets/glow restore.png', 'Cleanser', 'Silky brightening cleansing milk for dull, dry and hyperpigmented skin.', 'Aqua, Lactic Acid 5%, Rosehip Oil, Licorice Root');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (9, 'Roséva Hydro-Boost Balm', 48.00, '50ml', 'assets/hydro boost.png', 'Moisturizer', 'Melting lipid balm soothing dry patches and strengthening barrier resilience.', 'Aqua, Shea Butter, Squalane, Allantoin, Vitamin E');

INSERT INTO products (id, name, price, prod_size, image, category, description, ingredients)
VALUES (10, 'Roséva Cloud Drench Mist', 52.00, '120ml', 'assets/cloud drench.png', 'Face Masks', 'Ultra-fine hydrating facial mist with micro-droplet moisture lock.', 'Rosa Damascena Flower Water, Aloe Barbadensis, Glycerin');

-- Seed demo skin profile
INSERT INTO skin_profiles (id, user_email, skin_barrier, skin_hydration, skin_sensitivity, skin_sebum, stressors, other_notes)
VALUES (1, 'tousif.tasrik@roseva.com', 'Healthy Barrier', 'Balanced', 'Non-Sensitive', 'Normal-Combination', 'Artificial Fragrances, Harsh Alcohols', 'Sensitive under high UV exposure, responds well to hyaluronic acid.');

COMMIT;

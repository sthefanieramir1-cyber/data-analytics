CREATE DATABASE IF NOT EXISTS lanas_dogwalking
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE lanas_dogwalking;

-- ─────────────────────────────────────────────
--  Drop existing tables (reverse FK order)
-- ─────────────────────────────────────────────
DROP TABLE IF EXISTS Walk;
DROP TABLE IF EXISTS Dog;
DROP TABLE IF EXISTS Walker;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Customer;

-- ─────────────────────────────────────────────
--  1. CUSTOMER
-- ─────────────────────────────────────────────
CREATE TABLE Customer (
    Customer_ID       INT            NOT NULL AUTO_INCREMENT,
    Customer_Name     VARCHAR(100)   NOT NULL,
    Customer_PhoneNumber VARCHAR(20)  NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY (Customer_ID)
);

-- ─────────────────────────────────────────────
--  2. LOCATION
-- ─────────────────────────────────────────────
CREATE TABLE Location (
    Location_ID       INT            NOT NULL AUTO_INCREMENT,
    Location_Address  VARCHAR(200)   NOT NULL,
    Location_City     VARCHAR(100)   NOT NULL,
    Location_State    CHAR(2)        NOT NULL,
    Location_Zipcode  VARCHAR(10)    NOT NULL,
    CONSTRAINT PK_Location PRIMARY KEY (Location_ID)
);

-- ─────────────────────────────────────────────
--  3. WALKER
-- ─────────────────────────────────────────────
CREATE TABLE Walker (
    Walker_ID            INT            NOT NULL AUTO_INCREMENT,
    Walker_Name          VARCHAR(100)   NOT NULL,
    Walker_PhoneNumber   VARCHAR(20)    NOT NULL,
    Walker_Email         VARCHAR(150)   NOT NULL,
    Walker_Address       VARCHAR(200)   NOT NULL,
    CONSTRAINT PK_Walker PRIMARY KEY (Walker_ID)
);

-- ─────────────────────────────────────────────
--  4. DOG  (references Customer + Location)
-- ─────────────────────────────────────────────
CREATE TABLE Dog (
    Dog_ID            INT            NOT NULL AUTO_INCREMENT,
    Dog_Name          VARCHAR(100)   NOT NULL,
    Dog_Breed         VARCHAR(100)   NOT NULL,
    Size              ENUM('Small','Medium','Large','X-Large') NOT NULL,
    Customer_ID       INT            NOT NULL,
    Location_ID       INT            NOT NULL,
    CONSTRAINT PK_Dog         PRIMARY KEY (Dog_ID),
    CONSTRAINT FK_Dog_Cust    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT FK_Dog_Loc     FOREIGN KEY (Location_ID)
        REFERENCES Location(Location_ID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ─────────────────────────────────────────────
--  5. WALK  (references Dog + Walker)
-- ─────────────────────────────────────────────
CREATE TABLE Walk (
    Walk_ID            INT             NOT NULL AUTO_INCREMENT,
    Dog_ID             INT             NOT NULL,
    Walker_ID          INT             NOT NULL,
    Scheduled_DateTime DATETIME        NOT NULL,
    Duration_Minutes   INT             NOT NULL DEFAULT 30,
    Price              DECIMAL(8,2)    NOT NULL,
    CONSTRAINT PK_Walk        PRIMARY KEY (Walk_ID),
    CONSTRAINT FK_Walk_Dog    FOREIGN KEY (Dog_ID)
        REFERENCES Dog(Dog_ID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT FK_Walk_Walker FOREIGN KEY (Walker_ID)
        REFERENCES Walker(Walker_ID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
-- ============================================================
--  SAMPLE DATA
-- ============================================================

INSERT INTO Customer (Customer_Name, Customer_PhoneNumber) VALUES
    ('Sarah Johnson',   '916-555-0101'),
    ('Marcus Lee',      '916-555-0202'),
    ('Priya Patel',     '916-555-0303');

INSERT INTO Location (Location_Address, Location_City, Location_State, Location_Zipcode) VALUES
    ('1420 Oak Street',       'Sacramento',  'CA', '95814'),
    ('880 Elm Avenue',        'Sacramento',  'CA', '95816'),
    ('345 Maple Drive',       'Elk Grove',   'CA', '95758');
    
INSERT INTO Walker (Walker_Name, Walker_PhoneNumber, Walker_Email, Walker_Address) VALUES
    ('Lana Rivera',       '916-555-0001', 'lana@dogsbyLana.com', '2210 Rivera Lane, Sacramento, CA 95814'),
    ('Sthefanie Ramirez', '916-555-0022', 'sthefanie@dogsbyLana.com',  '487 Sunset Blvd, Sacramento, CA 95822');

INSERT INTO Dog (Dog_Name, Dog_Breed, Size, Customer_ID, Location_ID) VALUES
    ('Biscuit',   'Golden Retriever',  'Large',   1,  1),
    ('Mochi',     'Shih Tzu',          'Small',   1,  1),
    ('Rex',       'German Shepherd',   'Large',   2,  2);
    
INSERT INTO Walk (Dog_ID, Walker_ID, Scheduled_DateTime, Duration_Minutes, Price) VALUES
    ( 1,  1, '2026-04-18 09:00:00', 60, 30.00),
    ( 2,  1, '2026-04-18 10:30:00', 30, 18.00),
    ( 3,  1, '2026-04-18 08:00:00', 60, 30.00);
    
-- ============================================================
--  VERIFY
-- ============================================================
SELECT 'Customer' AS tbl, COUNT(*) AS row_count FROM Customer
UNION ALL
SELECT 'Location',  COUNT(*) FROM Location
UNION ALL
SELECT 'Walker',    COUNT(*) FROM Walker
UNION ALL
SELECT 'Dog',       COUNT(*) FROM Dog
UNION ALL
SELECT 'Walk',      COUNT(*) FROM Walk;
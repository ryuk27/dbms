-- 1. Create a table "animal" with an auto-increment "id" field and insert values
CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO animal (id, name) VALUES 
(100, 'Dog'),
(101, 'Cat'),
(102, 'Elephant'),
(103, 'Lion'),
(104, 'Tiger');

-- 2. Create a table "location" with columns "location_id" and "regional_group"
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    regional_group VARCHAR(50)
);

-- 3. Insert at least 5 values into the "location" table
INSERT INTO location (location_id, regional_group) VALUES 
(100, 'North'),
(101, 'South'),
(102, 'East'),
(103, 'West'),
(104, 'Central');

-- 4. Rename the "location" table to "location_of_india" and display its contents
ALTER TABLE location RENAME TO location_of_india;

SELECT * FROM location_of_india;

-- 5. Create a view of all locations where "location_id" equals 101
CREATE VIEW location_101 AS
SELECT * FROM location_of_india WHERE location_id = 101;

-- 6. Alter the "location_of_india" table to add a column "location_name"
ALTER TABLE location_of_india ADD COLUMN location_name VARCHAR(100);

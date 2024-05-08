/* Consider the relational database
 supplier(sid, sname, address)
 parts(pid, pname, color)
 catlog(sid, pid, cost)
 Write SQL queries for the following :
 i) Find the name of supplier who supply some red parts.
 ii) Find the name of all part whose cost is more than Rs. 250.
 iii) Find the name of all part whose color is green.
 iv) Find the name of all part supplied by each supplier. */

-- Create the supplier table
CREATE TABLE supplier (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    address VARCHAR(100)
);

-- Create the parts table
CREATE TABLE parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(50),
    color VARCHAR(20)
);

-- Create the catalog table
CREATE TABLE catalog (
    sid INT,
    pid INT,
    cost DECIMAL(10, 2),
    FOREIGN KEY (sid) REFERENCES supplier(sid),
    FOREIGN KEY (pid) REFERENCES parts(pid)
);

-- Insert sample data into the supplier table
INSERT INTO supplier (sid, sname, address) VALUES
(1, 'Supplier A', 'Address A'),
(2, 'Supplier B', 'Address B'),
(3, 'Supplier C', 'Address C');

-- Insert sample data into the parts table
INSERT INTO parts (pid, pname, color) VALUES
(101, 'Part X', 'red'),
(102, 'Part Y', 'green'),
(103, 'Part Z', 'blue');

-- Insert sample data into the catalog table
INSERT INTO catalog (sid, pid, cost) VALUES
(1, 101, 200),
(1, 102, 300),
(2, 101, 250),
(2, 102, 280),
(3, 102, 270),
(3, 103, 350);

-- Question i) Find the name of the supplier who supplies some red parts.
SELECT DISTINCT supplier.sname
FROM supplier
JOIN catalog ON supplier.sid = catalog.sid
JOIN parts ON catalog.pid = parts.pid
WHERE parts.color = 'red';

-- Question ii) Find the name of all parts whose cost is more than Rs. 250.
SELECT parts.pname
FROM parts
JOIN catalog ON parts.pid = catalog.pid
WHERE catalog.cost > 250;

-- Question iii) Find the name of all parts whose color is green.
SELECT pname
FROM parts
WHERE color = 'green';

-- Question iv) Find the name of all parts supplied by each supplier.
SELECT supplier.sname, parts.pname
FROM supplier
JOIN catalog ON supplier.sid = catalog.sid
JOIN parts ON catalog.pid = parts.pid
ORDER BY supplier.sname, parts.pname;

-- 1. Create the Student table with data
CREATE TABLE Student (
Regd_no VARCHAR(10) PRIMARY KEY,
Name VARCHAR(50),
Branch VARCHAR(50)
);

-- 2. Insert data into the Student table
INSERT INTO Student (Regd_no, Name, Branch)
VALUES 
('0001', 'Ram', 'CSE'),
('0002', 'Hari', 'MECH'),
('0003', 'Pradeep', 'EEE'),
('0004', 'Deepak', 'ETC');

-- 3. Show the regd no of Pradeep
SELECT Regd_no FROM Student WHERE Name = 'Pradeep';

-- 4. Display the name and branch of regd no 0002
SELECT Name, Branch FROM Student WHERE Regd_no = '0002';

-- 5. Count the number of rows existing in the Student table
SELECT COUNT(*) FROM Student;

-- 6. Add another column Address in Student table and update all addresses
ALTER TABLE Student ADD COLUMN Address TEXT;
UPDATE Student SET Address = 'Some Address';

-- 7. Change the branch of Ram from CSE to ETC
UPDATE Student SET Branch = 'ETC' WHERE Name = 'Ram';

-- 8. Delete record of Ram
DELETE FROM Student WHERE Name = 'Ram';

-- 9. Show all records whose name starts with R
SELECT * FROM Student WHERE Name LIKE 'R%';

-- 10. Update the name of Pradeep to Pradeep Kumar
UPDATE Student SET Name = 'Pradeep Kumar' WHERE Name = 'Pradeep';

-- 11. Find the total registration count of each branch
SELECT Branch, COUNT(*) AS Total_Registration FROM Student GROUP BY Branch;

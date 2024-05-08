/*  Consider following database:
 Student (Roll_no, Name, Address)
 Subject (Sub_code, Sub_name)
 Marks (Roll_no, Sub_code, marks)
 Write following queries in SQL:
 i) Find average marks of each student, along with the Roll_no of
 student of subject code ‘CE2412’.
 ii) Find how many students have failed in the subject “DBMS”.
 iii) Construct suitable view on above schema. */

-- Create the Student table
CREATE TABLE Student (
Roll_no INT PRIMARY KEY,
Name VARCHAR(100),
Address VARCHAR(100)
);

-- Create the Subject table
CREATE TABLE Subject (
Sub_code VARCHAR(10) PRIMARY KEY,
Sub_name VARCHAR(100)
);

-- Create the Marks table
CREATE TABLE Marks (
Roll_no INT,
Sub_code VARCHAR(10),
marks DECIMAL(5, 2),
FOREIGN KEY (Roll_no) REFERENCES Student(Roll_no),
FOREIGN KEY (Sub_code) REFERENCES Subject(Sub_code)
);

-- Insert sample data into the Student table
INSERT INTO Student (Roll_no, Name, Address) VALUES
(101, 'Ram V', 'Kalyan'),
(102, 'Apurva N', 'Pune'),
(103, 'Dipesh P', 'Thane'),
(104, 'Mitali P', 'Vadala'),
(105, 'Krishnanand P', 'Dehradun');

-- Insert sample data into the Subject table
INSERT INTO Subject (Sub_code, Sub_name) VALUES
('CE2412', 'Mathematics'),
('CE2413', 'DBMS'),
('CE2414', 'CG');

-- Insert sample data into the Marks table
INSERT INTO Marks (Roll_no, Sub_code, marks) VALUES
(101, 'CE2412', 85.50),
(101, 'CE2413', 75.00),
(101, 'CE2414', 90.00),
(102, 'CE2412', 80.00),
(102, 'CE2413', 60.00),
(102, 'CE2414', 85.00),
(103, 'CE2412', 70.00),
(103, 'CE2413', 55.00),
(103, 'CE2414', 75.00),
(104, 'CE2412', 65.00),
(104, 'CE2413', 40.00),
(104, 'CE2414', 80.00),
(105, 'CE2412', 75.00),
(105, 'CE2413', 70.00),
(105, 'CE2414', 85.00);

-- i) Find average marks of each student, along with the Roll_no of student of subject code ‘CE2412’.
SELECT m.Roll_no, s.Name, AVG(m.marks) AS average_marks
FROM Marks m
JOIN Student s ON m.Roll_no = s.Roll_no
WHERE m.Sub_code = 'CE2412'
GROUP BY m.Roll_no, s.Name;

-- ii) Find how many students have failed in the subject “DBMS”.
SELECT COUNT(*) AS num_failed
FROM Marks
WHERE Sub_code = 'CE2413' AND marks < 40;

-- iii) Construct suitable view on above schema.
CREATE VIEW Student_Marks_View AS
SELECT s.Roll_no, s.Name, s.Address, m.Sub_code, m.marks
FROM Student s
JOIN Marks m ON s.Roll_no = m.Roll_no;

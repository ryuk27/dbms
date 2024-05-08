/* Consider the following database.
 Doctor (Doctor_no, Doctor_name, Address, City).
 Hospital (Hospital_no. Name. Street, City).
 Doc_Hosp (Doctor_no, Hospital_no, Date).
 Construct the following Queries in SQL.
*/

-- Create the Doctor table
CREATE TABLE Doctor (
Doctor_no INT PRIMARY KEY,
Doctor_name VARCHAR(50),
Address VARCHAR(100),
City VARCHAR(50)
);

-- Create the Hospital table
CREATE TABLE Hospital (
Hospital_no INT PRIMARY KEY,
Name VARCHAR(100),
Street VARCHAR(100),
City VARCHAR(50)
);

-- Create the Doc_Hosp table
CREATE TABLE Doc_Hosp (
Doctor_no INT,
Hospital_no INT,
Date DATE,
FOREIGN KEY (Doctor_no) REFERENCES Doctor(Doctor_no),
FOREIGN KEY (Hospital_no) REFERENCES Hospital(Hospital_no)
);

-- Insert sample data into the Doctor table
INSERT INTO Doctor (Doctor_no, Doctor_name, Address, City) VALUES
(1, 'Dr. Nagrale', '123, ABC Road', 'Mumbai'),
(2, 'Dr. Joshi', '456, XYZ Street', 'Delhi'),
(3, 'Dr. Sharma', '789, PQR Avenue', 'Kolkata'),
(4, 'Dr. Pardeshi', '321, LMN Lane', 'Chennai'),
(5, 'Dr. Singh', '654, JKL Boulevard', 'Bangalore');

-- Insert sample data into the Hospital table
INSERT INTO Hospital (Hospital_no, Name, Street, City) VALUES
(101, 'City Hospital', '456, ABC Road', 'Mumbai'),
(102, 'Shree Clinic', '789, XYZ Street', 'Delhi'),
(103, 'Sunrise Hospital', '123, PQR Avenue', 'Kolkata'),
(104, 'Star Hospital', '321, LMN Lane', 'Chennai'),
(105, 'Apollo Hospital', '654, JKL Boulevard', 'Bangalore'),
(106, 'Global Hospital', '789, XYZ Street', 'Delhi'),
(107, 'ABC Hospital', '321, PQR Avenue', 'Kolkata');

-- Insert sample data into the Doc_Hosp table
INSERT INTO Doc_Hosp (Doctor_no, Hospital_no, Date) VALUES
(1, 101, '2014-01-01'),
(1, 103, '2014-02-01'),
(2, 102, '2014-03-01'),
(2, 106, '2014-04-01'),
(3, 103, '2014-05-01'),
(3, 107, '2014-06-01'),
(4, 104, '2014-07-01'),
(4, 105, '2014-08-01'),
(5, 105, '2014-09-01'),
(5, 107, '2014-10-01');

/* 1) Find out all Doctors who have visited to Hospital in the same city in
 which they live. */

SELECT DISTINCT D.Doctor_name
FROM Doctor D
JOIN Doc_Hosp DH ON D.Doctor_no = DH.Doctor_no
JOIN Hospital H ON DH.Hospital_no = H.Hospital_no
WHERE D.City = H.City;

/* 2) Find to which Hospital “Dr. Joshi” has visited. */

SELECT H.Name AS Hospital_name
FROM Hospital H
JOIN Doc_Hosp DH ON H.Hospital_no = DH.Hospital_no
JOIN Doctor D ON DH.Doctor_no = D.Doctor_no
WHERE D.Doctor_name = 'Dr. Joshi';

/* 3) Count no. of Doctors visited to “Shree Clinic” on 1st March 2014. */

SELECT COUNT(DISTINCT D.Doctor_no) AS Num_of_Doctors
FROM Doctor D
JOIN Doc_Hosp DH ON D.Doctor_no = DH.Doctor_no
JOIN Hospital H ON DH.Hospital_no = H.Hospital_no
WHERE H.Name = 'Shree Clinic' AND DH.Date = '2014-03-01';

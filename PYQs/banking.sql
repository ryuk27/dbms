/* Consider the following Relations. It defines the schema of the database
 application for a bank. It manages the branches and customers of the
 bank. Customers take loans (borrow money) or open accounts (deposit
 money) at one or more branches. [8]
 Branch (B_No, B_name, B_city, asset), Customer (C_No,C_Name,
 C_citystreet)
 Loan(Loan_no, B_name, amount), Account (Acc_No, B_name,
 Balance)
 Borrower (C_No, Loan_No), Depositor (C_No, Acc_No)
 Answer the following queries in SQL :
*/

-- Create the Branch table
CREATE TABLE Branch (
B_No INT PRIMARY KEY,
B_name VARCHAR(100),
B_city VARCHAR(100),
asset DECIMAL(10, 2)
);

-- Create the Customer table
CREATE TABLE Customer (
C_No INT PRIMARY KEY,
C_Name VARCHAR(100),
C_citystreet VARCHAR(100)
);

-- Create the Loan table
CREATE TABLE Loan (
Loan_no INT PRIMARY KEY,
B_name VARCHAR(100),
amount DECIMAL(10, 2)
);

-- Create the Account table
CREATE TABLE Account (
Acc_No INT PRIMARY KEY,
B_name VARCHAR(100),
Balance DECIMAL(10, 2)
);

-- Create the Borrower table
CREATE TABLE Borrower (
C_No INT,
Loan_No INT,
FOREIGN KEY (C_No) REFERENCES Customer(C_No),
FOREIGN KEY (Loan_No) REFERENCES Loan(Loan_no)
);

-- Create the Depositor table
CREATE TABLE Depositor (
C_No INT,
Acc_No INT,
FOREIGN KEY (C_No) REFERENCES Customer(C_No),
FOREIGN KEY (Acc_No) REFERENCES Account(Acc_No)
);

-- Insert sample data into the Branch table
INSERT INTO Branch (B_No, B_name, B_city, asset) VALUES
(1, 'Branch_1', 'Pune', 100000.00),
(2, 'Branch_2', 'Mumbai', 150000.00),
(3, 'Branch_3', 'Delhi', 200000.00),
(4, 'Branch_4', 'Kolkata', 175000.00),
(5, 'Branch_5', 'Chennai', 120000.00),
(6, 'Branch_6', 'Bangalore', 180000.00),
(7, 'Branch_7', 'Hyderabad', 140000.00);

-- Insert sample data into the Customer table
INSERT INTO Customer (C_No, C_Name, C_citystreet) VALUES
(101, 'Rahul Sharma', 'Pune, Shivaji Nagar'),
(102, 'Neha Gupta', 'Mumbai, Dadar'),
(103, 'Amit Patel', 'Delhi, Connaught Place'),
(104, 'Priya Singh', 'Kolkata, Park Street'),
(105, 'Rajesh Verma', 'Chennai, Anna Nagar'),
(106, 'Anjali Desai', 'Bangalore, MG Road'),
(107, 'Sandeep Reddy', 'Hyderabad, Banjara Hills');

-- Insert sample data into the Loan table
INSERT INTO Loan (Loan_no, B_name, amount) VALUES
(201, 'Branch_1', 50000.00),
(202, 'Branch_2', 75000.00),
(203, 'Branch_3', 60000.00),
(204, 'Branch_4', 45000.00),
(205, 'Branch_5', 55000.00),
(206, 'Branch_6', 80000.00),
(207, 'Branch_7', 70000.00);

-- Insert sample data into the Account table
INSERT INTO Account (Acc_No, B_name, Balance) VALUES
(301, 'Branch_1', 10000.00),
(302, 'Branch_2', 15000.00),
(303, 'Branch_3', 20000.00),
(304, 'Branch_4', 17500.00),
(305, 'Branch_5', 12000.00),
(306, 'Branch_6', 18000.00),
(307, 'Branch_7', 14000.00);

-- Insert sample data into the Borrower table
INSERT INTO Borrower (C_No, Loan_No) VALUES
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205),
(106, 206),
(107, 207);

-- Insert sample data into the Depositor table
INSERT INTO Depositor (C_No, Acc_No) VALUES
(101, 301),
(102, 302),
(103, 303),
(104, 304),
(105, 305),
(106, 306),
(107, 307);

-- 1) Find the names and address of customers who have a loan.
SELECT C.C_Name, C.C_citystreet
FROM Customer C
JOIN Borrower B ON C.C_No = B.C_No;

-- 2) Find the total amount of balance of all the accounts
SELECT SUM(Balance) AS Total_Balance
FROM Account;

-- 3) List all the customers who are borrowers
SELECT C.C_Name
FROM Customer C
JOIN Borrower B ON C.C_No = B.C_No;

-- 4) Find all the accounts of “Shivaji Nagar” branch of Pune city.
SELECT A.Acc_No
FROM Account A
JOIN Branch B ON A.B_name = B.B_name
WHERE B.B_city = 'Pune' AND B.B_name = 'Branch_1';

```sql
/* Consider the following relations:
 Departments(Department_id, Department_name, manager_id, Location_id)
 Employees(Employee_id, Employee_name, mphone_number, Hire_Date,
  Job_Id, Salary, commission_PCT, manager_Id, Department_Id)
Write SQL queries for the following:
*/

-- Create the Departments table
CREATE TABLE Departments (
Department_id INT PRIMARY KEY,
Department_name VARCHAR(50),
manager_id INT,
Location_id INT
);

-- Create the Employees table
CREATE TABLE Employees (
Employee_id INT PRIMARY KEY,
Employee_name VARCHAR(50),
mphone_number VARCHAR(15),
Hire_Date DATE,
Job_Id INT,
Salary DECIMAL(10, 2),
commission_PCT DECIMAL(5, 2),
manager_Id INT,
Department_Id INT,
FOREIGN KEY (manager_Id) REFERENCES Employees(Employee_id),
FOREIGN KEY (Department_Id) REFERENCES Departments(Department_id)
);

-- Insert sample data into the Departments table
INSERT INTO Departments (Department_id, Department_name, manager_id, Location_id) VALUES
(1, 'HR', 101, 1800),
(2, 'Finance', 102, 1800),
(3, 'Sales', 103, 1700);

-- Insert sample data into the Employees table
INSERT INTO Employees (Employee_id, Employee_name, mphone_number, Hire_Date, Job_Id, Salary, commission_PCT, manager_Id, Department_Id) VALUES
(101, 'Ram V', '123456789', '2022-01-01', 1, 80000.00, NULL, NULL, 1),
(102, 'Apurva N', '987654321', '2022-02-01', 2, 68000.00, 0.05, 101, 1),
(103, 'Dipesh P', '555555555', '2022-03-01', 3, 55000.00, 0.03, 102, 2),
(104, 'Mitali P', '333333333', '2022-04-01', 1, 52000.00, NULL, 101, 1),
(105, 'Dhanshree M', '666666666', '2022-05-01', 3, 58000.00, 0.02, 103, 3),
(106, 'Nishant M', '999999999', '2022-06-01', 1, 51000.00, NULL, 102, 2),
(107, 'Shivam B', '777777777', '2022-07-01', 2, 62000.00, 0.06, 102, 2),
(108, 'Palash D', '444444444', '2022-08-01', 3, 54000.00, NULL, 103, 3);

-- Question i) Show the name, job, salary, and commission of those employees who earn commission. Sort the data by the salary in descending order.
SELECT Employee_name, Job_Id, Salary, commission_PCT
FROM Employees
WHERE commission_PCT IS NOT NULL
ORDER BY Salary DESC;

-- Question ii) Show the department names, locations, names, job titles, and salaries of employees who work in location 1800.
SELECT D.Department_name, D.Location_id, E.Employee_name, E.Job_Id, E.Salary
FROM Departments D
JOIN Employees E ON D.Department_id = E.Department_Id
WHERE D.Location_id = 1800;

-- Question iii) How many employees have a name that ends with an “n”?
SELECT COUNT(*)
FROM Employees
WHERE Employee_name LIKE '%n';

-- Question iv) Show the names and locations for all departments and the number of employees working in each department. Make sure that departments without employees are included as well.
SELECT D.Department_name, D.Location_id, COUNT(E.Employee_id) AS num_employees
FROM Departments D
LEFT JOIN Employees E ON D.Department_id = E.Department_Id
GROUP BY D.Department_name, D.Location_id;
```

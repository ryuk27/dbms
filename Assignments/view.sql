/*1. Create a Simple Table:*/
   
   CREATE TABLE Employee (
       Employee_id INT PRIMARY KEY,
       Employee_name VARCHAR(100),
       Department VARCHAR(100),
       Salary DECIMAL(10, 2)
   );
   

/*2. Insert Sample Data into the Employee Table:*/
   
   INSERT INTO Employee (Employee_id, Employee_name, Department, Salary) VALUES
   (1, 'John Doe', 'IT', 50000.00),
   (2, 'Jane Smith', 'HR', 45000.00),
   (3, 'David Lee', 'Finance', 60000.00),
   (4, 'Emily Brown', 'Marketing', 48000.00),
   (5, 'Michael Johnson', 'Sales', 55000.00);
   

/*3. Create a View from the Employee Table:*/
   
   CREATE VIEW HighPaidEmployees AS
   SELECT * FROM Employee WHERE Salary > 50000;
   

/*4. Retrieve Data from the View:*/
   
   SELECT * FROM HighPaidEmployees;
   

/*5. Update the Base Table using its Corresponding View:*/
   
   UPDATE HighPaidEmployees SET Salary = 60000 WHERE Employee_id = 1;
   

/*6. View Creation from Multiple Tables:*/
   
   CREATE VIEW EmployeeDepartment AS
   SELECT Employee.Employee_id, Employee.Employee_name, Employee.Department, Department.Location
   FROM Employee
   JOIN Department ON Employee.Department = Department.Department_name;
   

/*7. Retrieve Data from the View:*/
   ```sql
   SELECT * FROM EmployeeDepartment;
  

/* Consider the following relations:
 Departments(Department_id, Department_name, manager_id, Location_id)
 Employees(Employee_id, Employee_name, mphone_number, Hire_Date,
  Job_Id, Salary, commission_PCT, manager_Id, Department_Id)
Write SQL queries for the following:
*/

-- create the Departments table

create table departments (
department_id int primary key,
department_name varchar(50),
manager_id int,
location_id int
);

-- create the Employees table

create table employees (
employee_id int primary key,
employee_name varchar(50),
mphone_number varchar(15),
hire_date date,
job_id int,
salary decimal(10, 2),
commission_pct decimal(5, 2),
manager_id int,
department_id int,
foreign key (manager_id) references employees(employee_id),
foreign key (department_id) references departments(department_id)
);

-- insert sample data into the Departments table

insert into departments (department_id, department_name, manager_id, location_id) values
(1, 'HR', 101, 1800),
(2, 'Finance', 102, 1800),
(3, 'Sales', 103, 1700);

-- insert sample data into the Employees table

insert into employees (employee_id, employee_name, mphone_number,
hire_date, job_id, salary, commission_pct, manager_id, department_id) values
(101, 'Ram V', '123456789', '2022-01-01', 1, 80000.00, NULL, NULL, 1),
(102, 'Apurva N', '987654321', '2022-02-01', 2, 68000.00, 0.05, 101, 1),
(103, 'Dipesh P', '555555555', '2022-03-01', 3, 55000.00, 0.03, 102, 2),
(104, 'Mitali P', '333333333', '2022-04-01', 1, 52000.00, NULL, 101, 1),
(105, 'Dhanshree M', '666666666', '2022-05-01', 3, 58000.00, 0.02, 103, 3),
(106, 'Nishant M', '999999999', '2022-06-01', 1, 51000.00, NULL, 102, 2),
(107, 'Shivam B', '777777777', '2022-07-01', 2, 62000.00, 0.06, 102, 2),
(108, 'Palash D', '444444444', '2022-08-01', 3, 54000.00, NULL, 103, 3);

/* Question i) Show the name, job, salary, and commission of those
employees who earn commission. Sort the data by the salary in descending order. */

select employee_name, job_id, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc;

/* Question ii) Show the department names, locations, names, job titles,
and salaries of employees who work in location 1800. */

select d.department_name, d.location_id, e.employee_name, e.job_id, e.salary
from departments d
join employees e on d.department_id = e.department_id
where d.location_id = 1800;

/* Question iii) How many employees have a name that ends with an “n”? */

select count(*)
from employees
where employee_name like '%n';

/* Question iv) Show the names and locations for all departments and the number of
employees working in each department. Make sure that departments without employees are included as well. */

select d.department_name, d.location_id, count(e.employee_id) as num_employees
from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name, d.location_id;

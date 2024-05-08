create database demo; 

delimiter ! 

show databases ! 

use demo ! 

create table company(
emp_id int,
emp_name varchar(10),
dept varchar(10),
address varchar(10));
! 

create table emp(
emp_id int,
emp_name varchar(10),
dept varchar(10),
address varchar(10));
! 

insert into company values
(1, 'Ram', 'IT', 'Kalyan'),
(2, 'Apurva', 'BPT', 'Pune');
! 

create trigger emp_info
after insert on company
for each row
begin
insert into emp values
(new.emp_id,new.emp_name,new.dept,new.address);
end;! 

select * from emp;! 

insert into company values(3, 'Dipesh', 'ENTC', 'Thane');! 
insert into company values(4, 'Krishna', 'Mech', 'Mulund' );! 

select * from emp;! 

select * from company;! 

create table t1(a int,b char(10));! 

create table t2(c char(10),b int);! 

create trigger trig
after insert on t1
for each row
begin
insert into t2 values(new.b, new.a);
end;! 

insert into t1 values(9, 'Ram'), (14, 'Apurva');! 

select * from t2;! 

drop trigger trig;! 

show triggers;! 

create trigger emp_info2
before update on company
for each row
begin
insert into emp values(old.emp_id, old.emp_name, old.dept, old.address);
end;! 

truncate table emp;! 

update company set emp_id=5,emp_name='Aryan',dept='Civil',address='Mulund' where emp_id=3;! 

select * from emp;! 

select * from company;! 

create trigger emp_info3
after update on company
for each row
begin
insert into emp values(new.emp_id, emp_name, emp_dept, new.address);
end;! 

create trigger emp_info4
after update on company
for each row
begin
insert into emp values(new.emp_id,emp_name,new.dept,new.address);
end;! 

truncate table emp;! 

update company set emp_id=3,emp_name='ABC',dept='ENTC',address='Mumbai' where emp_id=4;! 

create trigger emp_info5
after delete on company
for each row
begin
insert into emp values(old.emp_id,old.emp_name,old.dept,old.address);
end;! 

truncate table emp;! 

delete from company where emp_id=5;! 

select * from emp;! 

select * from company;! 

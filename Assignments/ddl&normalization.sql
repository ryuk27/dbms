select version();

show databases;

create database dbms;

use dbms;

create table student(rollno int(10), sname varchar(30), city varchar(30), DOB date, mobno int(10));

create table subject(subcode varchar(30), subname varchar(30));

create table marks(rollno int(10), submarks int(10), subcode varchar(30));

show tables;

describe student;

desc subject;

describe marks;

insert into student(rollno, sname, city, DOB, mobno) values
(1, "Ram", "Kalyan", '2004-12-09', 1234567890),
(2, "Apurva", "Pune", '2004-12-14', 0987654321),
(3, "Dipesh", "Thane", '2004-04-21', 1122334455);

select * from student;

insert into subject(subcode, subname) values("S11", "DBMS"), ("B22", "PA");

select * from subject;

insert into marks(rollno, submarks, subcode) values(1, 20, "S11"), (2, 25, "S11"), (3, 27, "S11");

select * from marks;

update student set sname="Nishant" where rollno=1;

select * from student;

delete from marks where rollno=2;

select * from marks;

delete from marks;

select * from marks;

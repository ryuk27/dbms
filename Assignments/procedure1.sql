use dbms;

create table student (stu_id int(5) not null, student_name varchar(10), DOB date, primary key(stu_id));

insert into student values(1, 'Ram', 20040912);
insert into student values(2, 'Apurva', 20041214);
insert into student values(3, 'Dipesh', 20040818), (4, 'Mitali', 20040321);

select * from student;

delimiter $
create procedure my_pro() 
select stu_id, student_name from student
$
  
call my_pro()$

create procedure stud(IN id INT(5), OUT name varchar(10))) 
begin 
select student_name into name from student where stu_id = id; 
end$

call stud(2, @x)$
select @x$

create procedure cleanup() 
delete from student;
$

call cleanup()$
select * from student;

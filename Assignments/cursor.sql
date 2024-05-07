show databases;

use ram;

create table employee(firstname varchar(10), lastname varchar(10), salary int);

insert into employee values('Ram', 'Vinchurkar', 95000), ('Apurva', 'Nagarale', 100000);

update employee set lastname = 'Nagrale' where lastname = 'Nagarale' and firstname = 'Apurva';

select * from employee;

delimiter $
create procedure demo() 
begin 
declare fn, cn varchar(30); 
declare cur cursor for select firstname, lastname from employee where salary>95000; 
open cur; 
l:loop 
fetch cur into fn,cn; 
select fn,cn; 
end loop; 
close cur; 
end$
  
call demo();$

create table mark(roll int, m1 int, m2 int, m3 int);$

insert into mark values(9,68,64,70), (14,69,69,70);$

select * from mark;$

create procedure curse() 
begin 
declare done boolean default false; 
declare r1, ma1, ma2, ma3, r int; 
declare s float; 
declare s_cur cursor for select roll, m1, m2, m3 from mark; 
declare continue handler for not found set done = true; 
open s_cur; 
l:loop 
fetch s_cur into r1, ma1, ma2, ma3; 
if done then 
leave l; 
end if; 
set r = r1; 
set s = (ma1 + ma2 + ma3) / 3; 
select r as 'roll', s as 'avg'; 
end loop l; 
close s_cur; 
end$
  
call curse();$

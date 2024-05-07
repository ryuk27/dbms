delimiter @
  
create function oddeve(a int) 
returns varchar(10) 
deterministic 
begin 
declare result varchar(10); 
if a%2=0 then 
set result = 'Even'; 
else 
set result = 'Odd'; 
end if; 
return result; 
end@

select oddeve(14);

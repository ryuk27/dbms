delimiter #

create procedure findmax(IN a int, IN b int) 
begin 
declare maxx int; 
if a>b then set maxx = a; 
else set maxx = b; 
end if; 
select maxx as 'Maximum Number'; 
end#

call findmax(14, 9);

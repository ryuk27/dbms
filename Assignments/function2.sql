delimiter $

create function find_max_min(input_values varchar(255), operation varchar(10)) 
returns int
deterministic
begin
declare max_min int;
declare value int;

set max_min = if(operation = 'max', -9999999, 9999999);

while length(input_values) > 0 do
set value = cast(substring_index(input_values, ',', 1) as unsigned);
set max_min = if(operation = 'max', greatest(max_min, value), least(max_min, value));
set input_values = trim(both ',' from substring(input_values, length(substring_index(input_values, ',', 1)) + 2));
end while;

return max_min;
end$

select find_max_min('5,10,8,3,15', 'max');

select find_max_min('5,10,8,3,15', 'min');

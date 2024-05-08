/* Procedure to find max number among given 3*/

DELIMITER @

CREATE PROCEDURE find_max_number(
IN num1 INT,
IN num2 INT,
IN num3 INT
)
BEGIN
DECLARE max_num INT;

IF num1 >= num2 AND num1 >= num3 THEN
SET max_num = num1;
ELSEIF num2 >= num1 AND num2 >= num3 THEN
SET max_num = num2;
ELSE
SET max_num = num3;
END IF;

SELECT max_num AS max_number;
END;@

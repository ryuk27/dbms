/*Create table student(rollno, marks1, marks2, marks3, marsk4). Insert some values.
Create a procedure to calculate average of marks of each student using cursor.*/
DELIMITER @

CREATE TABLE student (
rollno INT PRIMARY KEY,
mark1 INT,
mark2 INT,
mark3 INT,
mark4 INT
);

INSERT INTO student (rollno, mark1, mark2, mark3, mark4) VALUES
(1, 80, 75, 85, 90),
(2, 70, 65, 75, 80),
(3, 85, 90, 80, 95);

CREATE PROCEDURE calculate_average_marks()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE rollno_val, mark1_val, mark2_val, mark3_val, mark4_val INT;
DECLARE avg_marks FLOAT;

DECLARE student_cursor CURSOR FOR
SELECT rollno, mark1, mark2, mark3, mark4 FROM student;
        
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN student_cursor;

mark_loop: LOOP
FETCH student_cursor INTO rollno_val, mark1_val, mark2_val, mark3_val, mark4_val;
IF done THEN
LEAVE mark_loop;
END IF;

SET avg_marks = (mark1_val + mark2_val + mark3_val + mark4_val) / 4.0;
SELECT CONCAT('Average marks for student with rollno ', rollno_val, ' is: ', avg_marks) AS result;

END LOOP mark_loop;

CLOSE student_cursor;
END;@

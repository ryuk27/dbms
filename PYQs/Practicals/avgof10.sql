/* Write a PL/SQL block to calculate the grade of minimum 10 students using procedure and function.*/

CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
marks INT
);

INSERT INTO students (name, marks) VALUES
('Ram', 85),
('Apurva', 70),
('Mitali', 60),
('Dipesh', 75),
('Krishna', 90),
('Sanket', 80),
('Shivam', 55),
('Nishant', 65),
('Palash', 95),
('Dhanshree', 72);

CREATE FUNCTION calculate_grade(marks INT) RETURNS VARCHAR(10)
BEGIN
DECLARE grade VARCHAR(10);
IF marks >= 90 THEN
SET grade = 'A';
ELSEIF marks >= 80 THEN
SET grade = 'B';
ELSEIF marks >= 70 THEN
SET grade = 'C';
ELSEIF marks >= 60 THEN
SET grade = 'D';
ELSE
SET grade = 'F';
END IF;
RETURN grade;
END;

CREATE PROCEDURE calculate_student_grades()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE student_id, student_marks INT;
DECLARE student_name VARCHAR(100);
DECLARE cur CURSOR FOR SELECT id, name, marks FROM students;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;
grade_loop: LOOP
FETCH cur INTO student_id, student_name, student_marks;
IF done THEN
LEAVE grade_loop;
END IF;

-- Calculate grade using the function
SELECT CONCAT(student_name, ': Grade - ', calculate_grade(student_marks)) AS result;

END LOOP;
CLOSE cur;
END;

CALL calculate_student_grades();

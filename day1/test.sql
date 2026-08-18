SELECT @@VERSION;

--Cmd + Shift + Eで実行する！！
CREATE DATABASE sql_study;

USE sql_study;

--コンマの位置に注意。
CREATE TABLE users(
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  age INT,
  city NVARCHAR(50)
);

--Nを忘れない。
INSERT into users(id,name,age,city)
VALUES
  (1, N'山田', 25, N'福井'),
  (2, N'田中', 20, N'福井'),
  (3, N'佐藤', 30, N'福井');

--*ですべて表示
SELECT * FROM users;
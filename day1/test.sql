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
SELECT * FROM users
WHERE age >= 25;

SELECT * FROM users
WHERE city = N'福井';

INSERT into users(id,name,age,city)
VALUES
  (4, N'小倉', 25, N'大阪'),
  (5, N'井川', 20, N'東京'),
  (6, N'高島', 30, N'石川');

SELECT * FROM users
ORDER BY age DESC;

SELECT * FROM users
ORDER BY age ASC;

--update whereで指定する
UPDATE users
SET age = 26
WHERE id = 1;

SELECT * FROM users
WHERE id = 1;

--delete　事前確認してから消す
SELECT * FROM users
where id = 6;

DELETE from users
WHERE id = 6;

SELECT * from users;
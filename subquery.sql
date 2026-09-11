USE sql_study;

INSERT INTO users (id,name, age, city)
VALUES
(6, N'高橋', 18, N'福井'),
(7, N'伊藤', 40, N'福井'),
(8, N'中村', 22, N'大阪'),
(9, N'加藤', 35, N'東京'),
(10, N'吉田', 50, N'福井');

SELECT *
FROM users;

--サブクエリとはSQLの中に、別のSQLを入れること
-- 比較するための値を、別のSELECTで作ってしまう

-- 練習問題
-- users全体の平均年齢より年齢が高いユーザーを表示する
SELECT
  users.name,
  users.age
FROM users
WHERE users.age > (
  SELECT AVG(age)
  FROM users
);

-- users全体の平均年齢より年齢が高いユーザーの、名前と年齢を表示
SELECT
  users.name,
  users.age
FROM users
WHERE users.age >(
  SELECT AVG(age)
  FROM users
);

-- users テーブルから、福井県のユーザーの平均年齢より年齢が高いユーザーの「名前・年齢・都道府県」を表示
SELECT
  users.name,
  users.age,
  users.city
FROM users
WHERE users.age >(
  SELECT AVG(age)
  FROM users
  WHERE users.city =N'福井'
);

-- 大阪のユーザーの平均年齢より年齢が高いユーザーを、全ユーザーの中から取得
-- 表示するのはid、name、age、city
SELECT
  users.id,
  users.name,
  users.age,
  users.city
FROM users
WHERE users.age >(
  SELECT AVG(age)
  FROM users
  WHERE users.city =N'大阪'
);

-- 「福井」に住んでいるユーザーと同じ年齢のユーザーを、全ユーザーから取得してください。
-- 表示するのはid、name、age、city
SELECT *
FROM users
WHERE users.age IN(
  SELECT users.age
  FROM users
  WHERE users.city = N'福井'
);

-- 福井」に住んでいるユーザーと同じ年齢ではないユーザーを、全ユーザーから取得
-- 表示するのはid、name、age、city
SELECT *
FROM users
WHERE users.age NOT IN(
  SELECT users.age
  FROM users
  WHERE users.city =N'福井'
);

-- ユーザーの年齢を判定してください。
-- 30歳以上 → N'30代以上'、30歳未満 → N'30歳未満'
-- 表示する列：id、name、age、そしてCASEで作るage_category
SELECT
  users.id,
  users.name,
  users.age,
  CASE
    WHEN users.age >= 30 THEN N'30代以上'
    ELSE N'30歳未満'
  END AS age_category
FROM users;
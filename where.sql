SELECT @@VERSION;
USE sql_study;

-- 1 福井の人
SELECT * FROM users
WHERE city = N'福井';
-- 2 大阪の人
SELECT * FROM users
WHERE city = N'大阪';
-- 3 25歳以上で福井の人　and かつ
SELECT * FROM users
WHERE age >= 25
AND city = N'福井';
-- 3 福井か大阪の人　or または
SELECT * FROM users
WHERE city = N'福井'
OR city =N'大阪';

-- 4　複数候補のいずれか　in または
SELECT * FROM users
WHERE city IN (N'福井', N'大阪');

SELECT * FROM users
WHERE city IN (N'福井', N'大阪', N'東京', N'石川');

-- 5 BETWEEN AND は両端の値を含む 20以上25以下
SELECT * FROM users
WHERE age BETWEEN 20 and 25;
-- 同じ意味で違う書き方ができる
SELECT * FROM users
WHERE age >= 20
AND age <= 25;

-- 6 like 文字列検索 % → 位置で意味がかわる
-- % は0文字以上の任意の文字列、_ は任意の1文字
SELECT * FROM users
WHERE name LIKE N'%田%';

-- 「田」で終わる
SELECT * FROM users
WHERE name LIKE N'%田';

-- 「田」で始まる
SELECT * FROM users
WHERE name LIKE N'田%';

-- 2文字目が「田」
SELECT * FROM users
WHERE name LIKE N'_田%';

SELECT * FROM users
WHERE city IS NULL;

SELECT * FROM users
WHERE city IS NOT NULL;
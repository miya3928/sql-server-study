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

-- 以下はcase.sqlに移動。
-- -- 「福井」に住んでいるユーザーと同じ年齢のユーザーを、全ユーザーから取得してください。
-- -- 表示するのはid、name、age、city
-- SELECT *
-- FROM users
-- WHERE users.age IN(
--   SELECT users.age
--   FROM users
--   WHERE users.city = N'福井'
-- );

-- -- 福井」に住んでいるユーザーと同じ年齢ではないユーザーを、全ユーザーから取得
-- -- 表示するのはid、name、age、city
-- SELECT *
-- FROM users
-- WHERE users.age NOT IN(
--   SELECT users.age
--   FROM users
--   WHERE users.city =N'福井'
-- );

-- -- ユーザーの年齢を判定してください。
-- -- 30歳以上 → N'30代以上'、30歳未満 → N'30歳未満'
-- -- 表示する列：id、name、age、そしてCASEで作るage_category
-- SELECT
--   users.id,
--   users.name,
--   users.age,
--   CASE
--     WHEN users.age >= 30 THEN N'30代以上'
--     ELSE N'30歳未満'
--   END AS age_category
-- FROM users;

-- /* 年齢を次の4段階に分類してください。
-- 条件	表示
-- 40歳以上	40歳以上
-- 30歳以上	30歳以上
-- 20歳以上	20歳以上
-- 20歳未満	20歳未満
-- 表示する列：id,name,age,age_category*/

-- SELECT
--   users.id,
--   users.name,
--   users.age,
--   CASE
--     WHEN users.age >= 40 THEN N'40歳以上'
--     WHEN users.age >= 30 THEN N'30歳以上'
--     WHEN users.age >= 20 THEN N'20歳以上'
--     ELSE N'20歳未満'
--   END AS age_category
-- FROM users;

-- /*
-- 福井県内外と年齢によって、次の3段階に分類してください。

-- 条件                                      表示
-- 福井県 かつ 30歳以上                       福井・30歳以上
-- 福井県 かつ 30歳未満                       福井・30歳未満
-- 福井県以外                                県外

-- 表示する列：id, name, age, city, location_category
-- */
-- SELECT
--   users.id,
--   users.name,
--   users.age,
--   users.city,
--   CASE
--     WHEN users.city = N'福井' AND users.age >= 30 THEN N'福井・30歳以上'
--     WHEN users.city = N'福井' AND users.age < 30 THEN N'福井・30歳未満'
--     ELSE N'県外'
--   END AS location_category
-- FROM users;

-- /*
-- 商品の価格を次の3段階に分類してください。

-- 条件                                      表示
-- 価格が300円以上                            高価格
-- 価格が200円以上                            中価格
-- 価格が200円未満                            低価格

-- 対象テーブル：orders

-- 表示する列：id, product, price, price_category
-- */
-- SELECT
--   orders.id,
--   orders.product,
--   orders.price,
--   CASE
--     WHEN orders.price >= 300 THEN N'高価格'
--     WHEN orders.price >= 200 THEN N'中価格'
--     ELSE N'低価格'
--   END AS price_category
-- FROM orders;

-- /*
-- ユーザーを年齢と地域によって分類してください。

-- 条件                                      表示
-- 福井県 かつ 40歳以上                       福井・40歳以上
-- 福井県 かつ 30歳以上                       福井・30歳以上
-- 福井県 かつ 30歳未満                       福井・30歳未満
-- 福井県以外                                県外

-- 表示する列：id, name, age, city, user_category
-- */
-- SELECT
--   users.id,
--   users.name,
--   users.age,
--   users.city,
--   CASE
--     WHEN users.city = N'福井' AND users.age >= 40 THEN N'福井・40歳以上'
--     WHEN users.city = N'福井' AND users.age >= 30 THEN N'福井・30歳以上'
--     WHEN users.city = N'福井' AND users.age < 30 THEN N'福井・30歳未満'
--     ELSE N'県外'
--   END AS user_category
-- FROM users;

-- /*
-- 注文データを価格と商品名によって分類してください。

-- 条件                                      表示
-- 価格が300円以上                            高価格商品
-- 価格が200円以上                            中価格商品
-- 商品名が「バナナ」                          バナナ商品
-- それ以外                                  その他

-- 対象テーブル：orders

-- 表示する列：id, product, price, order_category
-- */
-- SELECT
--   orders.id,
--   orders.product,
--   orders.price,
--   case
--     when orders.product = N'バナナ' then N'バナナ商品'
--     when orders.price >= 200 then N'中価格商品'
--     when orders.price >= 300 then N'高価格商品'
--     else N'その他'
--     END AS order_category
-- FROM orders;


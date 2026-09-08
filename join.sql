USE sql_study;

-- テーブル作成・データ追加は一度だけ実行
-- CREATE TABLE orders (
--   id INT PRIMARY KEY,
--   user_id INT,
--   product NVARCHAR(50),
--   price INT,
-- );

INSERT INTO orders (id, user_id, product, price)
VALUES
  (1,1,N'りんご',200),
  (2,1,N'みかん',300),
  (3,2,N'バナナ',150),
  (4,3,N'りんご',200);

SELECT * FROM users;
SELECT * FROM orders;

/*INNER JOIN の特徴。
両方のテーブルに対応するデータがあるものだけ取得する*/
SELECT
  users.name,
  orders.product,
  orders.price
FROM users
INNER JOIN orders
  ON users.id = orders.user_id;

/* LEFT JOIN
usersのデータを全部残す*/
SELECT
  users.name,
  orders.product,
  orders.price
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id;

--ユーザーごとの注文金額の合計
SELECT
  users.name,
  SUM (orders.price)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.name;

--注文金額の合計が300円以上のユーザーだけ表示
SELECT
  users.name,
  SUM (orders.price)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.name
  HAVING SUM(orders.price) >= 300;

--ユーザーごとの注文金額の合計を、金額が高い順に表示
SELECT
  users.name,
  SUM (orders.price)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.name
  ORDER BY SUM(orders.price) DESC;

--注文がないユーザーも含めて、ユーザーごとの注文金額の合計を表示
SELECT
  users.name,
  COALESCE(SUM(orders.price),0)
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id, users.name;

--ユーザーごとの注文数を表示
SELECT
  users.name,
  COUNT(orders.id)
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id, users.name;

--注文数が2件以上のユーザーだけを表示
SELECT
  users.name,
  COUNT(orders.id)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id, users.name
  HAVING COUNT(orders.id) >= 2;

--注文数が多いユーザー順に、ユーザー名と注文数を表示
SELECT
  users.name,
  COUNT(orders.id)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id, users.name
  ORDER BY COUNT(orders.id) DESC;

--商品ごとの売上金額の合計を表示
SELECT
  orders.product,
  SUM(orders.price)
FROM orders
--INNER JOIN users
--ON orders.user_id = users.id
  GROUP BY orders.product;

SELECT
  orders.product,
  SUM(orders.price)
FROM orders
  GROUP BY orders.product;

--福井に住んでいるユーザーの注文金額の合計を、ユーザーごとに表示
--集計前の絞り込み→havingではなく、whereを使う
SELECT
  users.name,
  SUM(orders.price)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  WHERE users.city = N'福井'
  GROUP BY users.id, users.name;

/*注文履歴があるユーザーについて、ユーザーごとの注文金額の合計を計算し、
合計金額が200円以上のユーザーだけを、合計金額の高い順に表示*/
SELECT
  users.name,
  SUM(orders.price)
FROM users
INNER JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id,users.name
  HAVING SUM(orders.price) >= 200
  ORDER BY SUM(orders.price) DESC;
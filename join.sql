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
  SUM(orders.price)
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
  GROUP BY users.id, users.name;
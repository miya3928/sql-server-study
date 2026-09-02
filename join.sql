USE sql_study;

CREATE TABLE orders (
  id INT PRIMARY KEY,
  user_id INT,
  product NVARCHAR(50),
  price INT,
);

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
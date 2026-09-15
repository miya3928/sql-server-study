USE sql_study;

/*
NULLの練習

学習内容：
- NULL
- IS NULL
- IS NOT NULL
- COALESCE
*/

USE sql_study;


/*
① LEFT JOINでNULLを確認する
*/

SELECT
  users.id,
  users.name,
  orders.product,
  orders.price
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id;


/*
② 注文がない場合、NULLを0に変える
*/

SELECT
  users.id,
  users.name,
  COALESCE(SUM(orders.price), 0) AS total_price
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
GROUP BY users.id, users.name;

-- NULL問題①：NULLの確認
-- usersとordersをLEFT JOINして、
-- 注文がないユーザーを表示してください。
-- 【条件】
-- ・users.nameを表示する
-- ・orders.productを表示する
-- ・注文がないユーザーだけ表示する
-- ・IS NULLを使う

SELECT
  users.name,
  orders.product
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- NULL問題②：COALESCE
--
-- usersとordersをLEFT JOINしてください。
--
-- 【条件】
-- ・users.nameを表示する
-- ・orders.productを表示する
-- ・注文がない場合は、NULLではなく
--   「注文なし」と表示する
-- ・COALESCEを使う
--
-- 【ヒントなし】
-- 使用するテーブル：
-- users
-- orders

SELECT
  users.name,
  COALESCE(orders.product, N'注文なし')
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- NULL問題③：全ユーザーとCOALESCE
--
-- usersとordersをLEFT JOINしてください。
--
-- 【条件】
-- ・全ユーザーを表示する
-- ・users.nameを表示する
-- ・orders.productを表示する
-- ・注文がない場合は、NULLではなく
--   「注文なし」と表示する
-- ・COALESCEを使う
-- ・WHEREは使わない
SELECT
  users.name,
  COALESCE(orders.product, N'注文なし')
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id

-- NULL問題④：COALESCEとCOUNT
--
-- usersとordersをLEFT JOINしてください。
--
-- 【条件】
-- ・全ユーザーを表示する
-- ・users.nameを表示する
-- ・注文数を表示する
-- ・注文がない場合も、注文数を0と表示する
-- ・COALESCEを使う
-- ・COUNTを使う
-- ・GROUP BYを使う
-- ・WHEREは使わない
SELECT
  users.name,
  coalesce(COUNT(orders.id), 0) AS N'注文数'
FROM users
LEFT JOIN orders
  ON users.id = orders.user_id
GROUP BY users.id, users.name;
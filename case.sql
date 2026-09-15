USE sql_study;


-- =========================================
-- CASE① 年齢による分類
-- =========================================

SELECT
    name,
    age,
    CASE
        WHEN age >= 40 THEN N'40歳以上'
        WHEN age >= 30 THEN N'30歳以上'
        WHEN age >= 20 THEN N'20歳以上'
        ELSE N'20歳未満'
    END AS age_category
FROM users;


-- =========================================
-- CASE② 都市による分類
-- =========================================

SELECT
    name,
    city,
    CASE
        WHEN city = N'福井' THEN N'福井県民'
        WHEN city = N'大阪' THEN N'大阪府民'
        WHEN city = N'東京' THEN N'東京都民'
        ELSE N'その他'
    END AS city_category
FROM users;


-- =========================================
-- CASE③ 都市と年齢による分類
-- =========================================

SELECT
    name,
    city,
    age,
    CASE
        WHEN city = N'福井' AND age >= 30 THEN N'福井・30歳以上'
        WHEN city = N'福井' AND age < 30 THEN N'福井・30歳未満'
        WHEN city = N'大阪' THEN N'大阪'
        WHEN city = N'東京' THEN N'東京'
        ELSE N'その他'
    END AS user_category
FROM users;


-- =========================================
-- CASE④ 注文価格による分類
-- =========================================

SELECT
    id,
    product,
    price,
    CASE
        WHEN price >= 300 THEN N'高価格商品'
        WHEN price >= 200 THEN N'中価格商品'
        ELSE N'低価格商品'
    END AS price_category
FROM orders;


-- =========================================
-- CASE⑤ 商品名と価格による分類
-- =========================================

SELECT
    id,
    product,
    price,
    CASE
        WHEN product = N'バナナ' THEN N'バナナ商品'
        WHEN price >= 300 THEN N'高価格商品'
        WHEN price >= 200 THEN N'中価格商品'
        ELSE N'その他'
    END AS order_category
FROM orders;


-- =========================================
-- CASE⑥ ユーザーと注文情報を結合して分類
-- =========================================

SELECT
    users.name,
    orders.product,
    orders.price,
    CASE
        WHEN orders.price >= 300 THEN N'高価格商品'
        WHEN orders.price >= 200 THEN N'中価格商品'
        ELSE N'低価格商品'
    END AS price_category
FROM users
INNER JOIN orders
    ON users.id = orders.user_id;
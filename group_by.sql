USE sql_study;

SELECT city, COUNT(*)
FROM users
GROUP BY city;

SELECT city, AVG(age)
FROM users
GROUP BY city;

SELECT city, SUM(age)
FROM users
GROUP BY city;

SELECT city, MAX(age),MIN(age)
FROM users
GROUP BY city;

SELECT city, COUNT(*)
FROM users
GROUP BY city
HAVING COUNT(*) >= 2;

SELECT city, COUNT(*)
FROM users
GROUP BY city
ORDER BY COUNT(*) DESC;

/*
WHERE → 行を絞る
GROUP BY → グループを作る
HAVING → グループを絞る
*/
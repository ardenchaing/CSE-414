-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 4
-- # rows: 12

.headers ON
.nullvalue NULL

SELECT DISTINCT c.name AS name
FROM FLIGHTS AS f, CARRIERS AS c
WHERE f.carrier_id = c.cid
GROUP BY c.name, f.month_id, f.day_of_month
HAVING count(*) > 1000
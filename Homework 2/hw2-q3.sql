-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 3
-- # rows: 1

.headers ON
.nullvalue NULL

SELECT w.day_of_week, AVG(f.arrival_delay) AS delay
FROM FLIGHTS AS f, WEEKDAYS AS w
WHERE f.day_of_week_id = w.did
GROUP BY w.day_of_week
ORDER BY AVG(f.arrival_delay) DESC
LIMIT 1;
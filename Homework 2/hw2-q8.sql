-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 7
-- # rows: 22

.headers ON
.nullvalue NULL

SELECT c.name AS name, SUM(f.departure_delay) AS delay
FROM FLIGHTS AS f, CARRIERS AS c
WHERE f.carrier_id = c.cid 
GROUP BY c.name;
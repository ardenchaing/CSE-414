-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 5
-- # rows: 6

.headers ON
.nullvalue NULL

SELECT c.name AS name, (SUM(f.canceled)*100.0/COUNT(*)) AS percent
FROM FLIGHTS AS f, CARRIERS AS c
WHERE f.carrier_id = c.cid AND
	f.origin_City = 'Seattle WA'
GROUP BY c.name
HAVING percent > 0.5
ORDER BY percent ASC;
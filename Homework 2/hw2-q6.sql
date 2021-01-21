-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 6
-- # rows: 3

.headers ON
.nullvalue NULL

SELECT c.name AS carrier, MAX(price) AS max_price
FROM FLIGHTS AS f, CARRIERS AS c
WHERE f.carrier_id = c.cid AND
	((f.origin_city = 'Seattle WA' AND f.dest_city = 'New York NY') OR 
	(f.origin_city = 'New York NY' AND f.dest_city = 'Seattle WA'))
GROUP BY c.name;
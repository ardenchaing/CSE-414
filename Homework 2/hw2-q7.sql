-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 7
-- # rows: 1

.headers ON
.nullvalue NULL

SELECT SUM(f.capacity) AS capacity
FROM FLIGHTS AS f, CARRIERS AS c, MONTHS as m 
WHERE f.carrier_id = c.cid AND
	f.month_id = m.mid AND
	m.month = 'July' AND
	f.day_of_month = 10 AND
	((f.origin_city = 'Seattle WA' AND f.dest_city = 'San Francisco CA') OR 
	(f.origin_city = 'San Francisco CA' AND f.dest_city = 'Seattle WA'));
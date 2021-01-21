-- CSE 414
-- Homework 2
-- Due: 01/20/21
-- Subject: Question 1
-- # rows: 3

.headers ON
.nullvalue NULL

SELECT DISTINCT f.flight_num
FROM FLIGHTS AS f, CARRIERS AS c, WEEKDAYS AS w
WHERE f.origin_city = 'Seattle WA' AND
	f.dest_city = 'Boston MA' AND
	f.carrier_id = c.cid AND
	c.name = 'Alaska Airlines Inc.' AND
	f.day_of_week_id = w.did AND
	w.day_of_week = 'Monday';
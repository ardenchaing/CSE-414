-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 6
-- # rows: 4
-- duration: 22s

SELECT DISTINCT c.name carrier
FROM dbo.CARRIERS c
WHERE c.cid IN (SELECT f.carrier_id
				FROM dbo.FLIGHTS f
				WHERE f.origin_city = 'Seattle WA' AND
					  f.dest_city = 'San Francisco CA');

/*
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/
-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 7
-- # rows: 4
-- duration: 27s

SELECT DISTINCT c.name carrier
FROM dbo.CARRIERS c, dbo.FLIGHTS f
WHERE f.origin_city = 'Seattle WA' AND
	  f.dest_city = 'San Francisco CA' AND
	  f.carrier_id = c.cid;

/*
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/
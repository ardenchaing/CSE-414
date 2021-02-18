-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 5
-- # rows: 4
-- duration: 40s

SELECT DISTINCT f1.dest_city city
FROM dbo.FLIGHTS f1
WHERE f1.dest_city NOT IN (SELECT DISTINCT f2.dest_city
						   FROM dbo.FLIGHTS f2, dbo.FLIGHTS f3
						   WHERE f3.origin_city = 'Seattle WA' AND
						         f3.dest_city != 'Seattle WA' AND
						         f2.origin_city != 'Seattle WA' AND
						         f2.dest_city != 'Seattle WA' AND
						         f3.dest_city = f2.origin_city AND
						         f2.dest_city NOT IN (SELECT DISTINCT f4.dest_city
						         					  FROM dbo.FLIGHTS f4
						         					  WHERE f4.origin_city = 'Seattle WA'))
	  AND f1.dest_city NOT IN (SELECT DISTINCT f5.dest_city
	  						   FROM dbo.FLIGHTS f5
	  						   WHERE f5.origin_city = 'Seattle WA')
GROUP BY f1.dest_city;

/*
Devils Lake ND
Hattiesburg/Laurel MS
Seattle WA
St. Augustine FL
*/
-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 4
-- # rows: 256
-- duration: 14s

SELECT c.dest_city city
FROM dbo.FLIGHTS f JOIN(SELECT origin_city, dest_city
						FROM dbo.FLIGHTS
						WHERE dest_city != 'Seattle WA' AND
						dest_city NOT IN (SELECT dest_city
										  FROM dbo.FLIGHTS
										  WHERE origin_city = 'Seattle WA')
						GROUP BY origin_city, dest_city) c
						ON f.dest_city = c.origin_city
WHERE f.origin_city = 'Seattle WA'
GROUP BY c.dest_city
ORDER BY c.dest_city;

/*
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/
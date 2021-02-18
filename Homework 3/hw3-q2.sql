-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 2
-- # rows: 109
-- duration: 37s

SELECT DISTINCT f.origin_city city
FROM dbo.FLIGHTS f JOIN (SELECT origin_city, max(actual_time) time_max
							FROM dbo.FLIGHTS
							GROUP BY origin_city) c
							ON f.origin_city = c.origin_city AND 
							   f.actual_time = c.time_max
WHERE (f.actual_time < 180) AND (f.canceled != 1)
ORDER BY f.origin_city;
 
 /*
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/
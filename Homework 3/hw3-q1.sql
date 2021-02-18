-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 1
-- # rows: 334
-- duration: 33s

SELECT DISTINCT f.origin_city origin_city, 
				f.dest_city dest_city, 
				f.actual_time time
FROM dbo.FLIGHTS f JOIN (SELECT origin_city, max(actual_time) time_max
						FROM dbo.FLIGHTS
						GROUP BY origin_city) c
						ON c.origin_city = f.origin_city AND 
						   f.actual_time = c.time_max
ORDER BY origin_city, dest_city;

/*
Aberdeen SD 	Minneapolis MN 	106
Abilene TX 		Dallas/Fort Worth TX	111
Adak Island AK 	Anchorage AK 	471
Aguadilla PR 	New York NY 	368
Akron OH 		Atlanta GA 		408
Albany GA 		Atlanta GA 		243
Albany NY 		Atlanta GA 		390
Albuquerque NM 	Houston TX 		492
Alexandria LA 	Atlanta GA 		391
Allentown/Bethlehem/Easton PA 	Atlanta GA 	456
Alpena MI 		Detroit MI 		80
Amarillo TX 	Houston TX 		390
Anchorage AK 	Barrow AK 		490
Appleton WI 	Atlanta GA 		405
Arcata/Eureka CA 	San Francisco CA 	476
Asheville NC 	Chicago IL 		279
Ashland WV 		Cincinnati OH 	84
Aspen CO 		Los Angeles CA 	304
Atlanta GA 		Honolulu HI 	649
Atlantic City NJ 	Fort Lauderdale FL 	212
*/
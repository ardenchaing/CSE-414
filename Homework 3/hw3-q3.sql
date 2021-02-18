-- CSE 414
-- Homework 3
-- Due: 01/30/21
-- Subject: Question 3
-- # rows: 327
-- duration: 38s

SELECT f.origin_city, (case when ct is null then 0 ELSE CAST(ROUND((CAST(ct AS numeric(10, 2))
	   * 100 / CAST(count(f.fid) as numeric(10, 2))), 2) as numeric(10,2)) END) percentage
FROM dbo.FLIGHTS f LEFT JOIN (SELECT origin_city, count(fid) ct
							  FROM dbo.FLIGHTS
							  WHERE (actual_time < 180 OR (actual_time = NULL)) AND
							  		(canceled != 1)
							  GROUP BY origin_city) c
							  ON f.origin_city = c.origin_city
WHERE canceled != 1
GROUP BY f.origin_city, ct
ORDER BY percentage, origin_city;

/*
Guam TT 		0.00
Pago Pago TT	0.00
Aguadilla PR 	28.90
Anchorage AK 	31.81
San Juan PR 	33.66
Charlotte Amalie VI 	39.56
Ponce PR 		40.98
Fairbanks AK 	50.12
Kahului HI 		53.51
Honolulu HI 	54.74
San Francisco CA 	55.83
Los Angeles CA 	56.08
Seattle WA 		57.61
Long Beach CA 	62.18
New York NY 	62.37
Kona HI 		63.16
Las Vegas NV 	64.92
Christiansted VI 	65.10
Newark NJ 		65.85
Plattsburgh NY 	66.67
*/
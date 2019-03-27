-- ONE
WITH 
	rain_date
AS (
	SELECT 
		DATE(date) as rainy_date
	FROM
		weather
	WHERE
		events = 'Rain'
	GROUP BY 
		1
)
	SELECT 
		DATE(trips.start_date) ,
		trips.duration
	FROM
		trips
	JOIN
	    rain_date
	ON
		DATE(trips.start_date) = rain_date.rainy_date	
	ORDER BY duration DESC
	LIMIT 3
;

-- on 04/22/2016 there was a trip with a duration of 85900
-- on 11/15/2015 there was a trip with a duration of 84349
-- on 05/21/2016 there was a trip with a duration of 83915
 
 -- TWO
 
WITH 
	station_status
AS (
SELECT 
	stations.name,
	(CASE WHEN docks_available = 0 THEN 1 ELSE 0 END) as full_station,
	stations.dockcount,
	status.docks_available,
	status.timestamp
FROM
	status
JOIN
	stations
ON
	status.station_id = stations.station_id	
)

SELECT 
	name,
	SUM(full_station) as times_full
FROM
	station_status
GROUP BY 1
ORDER BY times_full DESC;

-- Santa Clara at Almaden is full most often

-- THREE
SELECT 
	trips.start_station AS station,
	stations.dockcount,
	COUNT(*) AS station_count
FROM
	trips
JOIN
	stations
ON
	trips.start_station = stations.name
GROUP BY
	1,2
ORDER BY
	stations.dockcount DESC
	
	
-- FOUR
WITH 
	rain_date
AS (
	SELECT 
		DATE(date) as rainy_date
	FROM
		weather
	WHERE
		events = 'Rain'
	GROUP BY 
		1
)
	SELECT 
		DATE(trips.start_date) ,
		trips.duration
	FROM
		trips
	JOIN
	    rain_date
	ON
		DATE(trips.start_date) = rain_date.rainy_date	
	ORDER BY duration DESC
;





 

	
-- One
SELECT
	max(maxtemperaturef) as temp
FROM
    weather
;

SELECT 
	date,
	zip
FROM
	weather
WHERE 
	maxtemperaturef = 134
;
-- Two
SELECT 
	start_station,
	COUNT(*) as trips_count
FROM
	trips
GROUP BY 1
;

-- Three
SELECT
	min(duration) as min_duration
FROM
    trips
;

SELECT 
	*
FROM
	trips
WHERE 
	duration = 60
;

-- Four
SELECT 
	end_station,
	AVG(duration) as avg_duration
FROM
	trips
GROUP BY 1
;


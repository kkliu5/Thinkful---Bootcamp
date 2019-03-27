-- First

SELECT
    trip_id,
    duration
FROM
    trips
WHERE
    duration > 500
ORDER BY duration DESC;

-- Second

SELECT
	*
FROM
    stations
WHERE
    station_id = 84
;

-- Third

SELECT
    mintemperaturef
FROM
    weather
WHERE
    events = 'Rain' AND
	zip = 94301
;

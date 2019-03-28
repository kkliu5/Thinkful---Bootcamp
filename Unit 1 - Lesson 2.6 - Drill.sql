--ONE
SELECT 
	*
FROM
	sfo_listings
ORDER BY price DESC
LIMIT 1
;

-- The most expensive listing is for $10,000 hosted by Sarah. It is a Full House Victorian: 7,500 SqFt house with 4 floors and a hot tub.

-- TWO
SELECT 
	sfo_listings.neighbourhood,
	SUM(number_of_reviews) AS total_reviews
FROM 
	sfo_listings
GROUP BY 1
ORDER BY total_reviews DESC
;

-- Based off of reviews, the most popular neighborhood is Mission

-- THREE
-- Busiest
SELECT 
	EXTRACT(MONTH FROM calender_date) AS date_month,
	SUM((CASE WHEN available = 'f' THEN 1 ELSE 0 END)) AS booked_count
FROM
	sfo_calendar
GROUP BY 1
ORDER BY booked_count DESC
;

-- Cheapest
CREATE TABLE cal_price AS
SELECT
	sfo_calendar.listing_id,
	sfo_calendar.calender_date,
	sfo_listings.price
FROM
	sfo_calendar
JOIN
	sfo_listings
ON
	sfo_calendar.listing_id = sfo_listings.id
;

CREATE TABLE cal_price_2 AS
SELECT 
	listing_id,
	EXTRACT(MONTH FROM calender_date) AS date_month,
	SUM(price) AS sum_price
FROM
	cal_price
GROUP BY 1,2
;

SELECT 
	date_month,
	AVG(sum_price) AS avg_price
FROM
	cal_price_2
GROUP BY 1
ORDER BY avg_price ASC

-- Septmeber is the most busiest time of the year
-- Febuary is the cheapest time of the year
-- Could not find the cheapest time since price is set as a text variable not integer, had to join from listing table. 
-- NOTE: spelt 'calendar' incorrectly in calender_date column

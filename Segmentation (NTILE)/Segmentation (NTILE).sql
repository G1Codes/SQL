-- Bucket the smartphones according to price

SELECT BRAND_NAME, MODEL, PRICE,
NTILE(3) OVER(ORDER BY price DESC) 
FROM smartphones;


-- Assign categories to the buckets

SELECT BRAND_NAME, MODEL, PRICE,
CASE
	WHEN bucket = 1 Then "Premium"
    WHEN bucket = 2 Then "Midrange"
    WHEN bucket = 3 Then "Budget"
END AS "Phone_Type"

FROM
(SELECT BRAND_NAME, MODEL, PRICE,
NTILE(3) OVER(ORDER BY price DESC) as bucket
FROM smartphones) AS t;
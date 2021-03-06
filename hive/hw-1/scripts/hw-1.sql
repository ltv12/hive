
-- Count total number of flights per carrier in 2007
--EXPLAIN
SELECT COUNT(*) total_flights, c.description carrier
FROM flights f JOIN carriers c ON (c.code = f.uniquecarrier)
GROUP BY c.description
SORT BY total_flights;


-- The total number of flights served in Jun 2007 by NYC (all airports, use join with Airports data).
SELECT COUNT(*) total_flights
    FROM flights f,
    airports airports  
WHERE  (f.origin = airports.iata or f.dest = airports.iata)
    AND f.month = 6
    AND "New York" = airports.city;

-- Find five most busy airports in US during Jun 01 - Aug 31.
SELECT COUNT(*) total_flights, r.airport FROM (
    SELECT  airports.airport 
        FROM flights f
        LEFT JOIN airports airports ON (f.origin = airports.iata)
        WHERE  "USA" = airports.country
                AND f.month BETWEEN 6 AND 8
    UNION ALL
    SELECT  airports.airport FROM flights f
        LEFT JOIN airports airports ON (f.dest = airports.iata)
        WHERE  "USA" = airports.country
                AND f.month BETWEEN 6 AND 8
) r
GROUP BY r.airport
SORT BY total_flights DESC
LIMIT 5;

-- Find the carrier who served the biggest number of flights
SELECT COUNT(*) total_flights, c.description  carrier
FROM flights f JOIN carriers c ON (c.code = f.uniquecarrier)
GROUP BY c.description
SORT BY total_flights DESC
LIMIT 1;

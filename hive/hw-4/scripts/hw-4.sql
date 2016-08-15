
-- Count total number of flights per carrier in 2007
--EXPLAIN

set hivevar:flights=hw_4__flights_indexed_composite_index__;
set hivevar:airports=hw_4__airports_indexed_composite_index__;
set hivevar:carriers=carriers_indexed;


-- EXPLAIN
SELECT COUNT(*) total_flights, c.description carrier
    FROM ${flights} f
    JOIN ${carriers} c ON (c.code = f.uniquecarrier)
GROUP BY c.description
SORT BY total_flights;


-- The total number of flights served in Jun 2007 by NYC (all airports, use join with Airports data).
-- EXPLAIN
SELECT COUNT(*) total_flights
    FROM ${flights} f,
         ${airports} a
WHERE  (f.origin = a.iata or f.dest = a.iata)
    AND f.month = 6
    AND "New York" = a.city;

-- Find five most busy airports in US during Jun 01 - Aug 31.
-- EXPLAIN
SELECT COUNT(*) total_flights, r.airport FROM (
    SELECT  a.airport
        FROM ${flights} f
        JOIN ${airports} a ON (f.origin = a.iata)
        WHERE  "USA" = a.country
                AND f.month BETWEEN 6 AND 8
    UNION ALL
    SELECT  a.airport
        FROM ${flights} f
        JOIN ${airports} a ON (f.dest = a.iata)
        WHERE  "USA" = a.country
                AND f.month BETWEEN 6 AND 8
) r
GROUP BY r.airport
SORT BY total_flights DESC
LIMIT 5;

-- Find the carrier who served the biggest number of flights
SELECT COUNT(*) total_flights, c.description  carrier
    FROM ${flights} f
    JOIN ${carriers} c ON (c.code = f.uniquecarrier)
GROUP BY c.description
SORT BY total_flights DESC
LIMIT 1;

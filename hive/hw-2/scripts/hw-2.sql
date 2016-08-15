--Find all carriers who cancelled more than 1 flights during 2007, order them from biggest to lowest
--by number of cancelled flights and list in each record all departure cities where cancellation
--happened.

SELECT
       f.uniquecarrier carrier,
       COUNT(*) canceled_flights,
       concat_ws(', ' , collect_set(a.city)) Cities
FROM flights f
    JOIN airports a ON (f.origin = a.iata)
WHERE f.cancelled = 1 AND f.cancellationcode = 'A'
GROUP BY f.uniquecarrier
HAVING canceled_flights > 1
SORT BY canceled_flights DESC;

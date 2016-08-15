-- driver_info_ORC
-- vehicles_ORC

SELECT v.vendor, sum(v.active_vehicle) sum
FROM vehicles_ORC v
GROUP BY v.vendor
ORDER BY sum
LIMIT 1;


SELECT v.vendor, sum(v.active_vehicles) v_sum,
    FROM driver_info_ORC d JOIN vehicles_ORC v
    ON (d.vendor = v.vendor and v.service_type = "School Age" AND d.vehicle_type = "Mini-Wagon")
WHERE v.job_type LIKE "Driver"
GROUP BY v.vendor
ORDER BY v_sum DESC
LIMIT 1;








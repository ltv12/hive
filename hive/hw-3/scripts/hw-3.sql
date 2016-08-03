-- Use data from you UDF and find most popular device, browser, OS for each city.
CREATE TEMPORARY FUNCTION userAgent AS 'com.ki.hive.CustomHiveFunction'
USING JAR 'hdfs:///hw/hive/udf-hive-1.0-SNAPSHOT-jar-with-dependencies.jar';


-- MOST POPULAR device
SELECT nvl(c.name, r.city) city,
       r.device,
       r.device_cnt
       FROM( SELECT cd.city,
                    cd.device,
                    cd.device_cnt,
                    ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.device_cnt DESC) row_number
               FROM (SELECT  ci.city city,
                             userAgent("device", ci.user_agent) device,
                             COUNT(1) device_cnt
                    FROM click_info ci
                    GROUP BY ci.city, userAgent("device", ci.user_agent)
               ) cd) r
    LEFT JOIN cities c ON (r.city = c.id)
WHERE  r.row_number = 1
ORDER BY r.device_cnt DESC;

-- MOST POPULAR browser
SELECT nvl(c.name, r.city) city,
       r.browser,
       r.browser_cnt
       FROM( SELECT cd.city,
                    cd.browser,
                    cd.browser_cnt,
                    ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.browser_cnt DESC) row_number
               FROM (SELECT  ci.city city,
                             userAgent("browser", ci.user_agent) browser,
                             COUNT(1) browser_cnt
                    FROM click_info ci
                    GROUP BY ci.city, userAgent("browser", ci.user_agent)
               ) cd) r
    LEFT JOIN cities c ON (r.city = c.id)
WHERE  r.row_number = 1
ORDER BY r.browser_cnt DESC;


-- MOST POPULAR os
SELECT nvl(c.name, r.city) city,
       r.os,
       r.os_cnt
       FROM( SELECT cd.city,
                    cd.os,
                    cd.os_cnt,
                    ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.os_cnt DESC) row_number
               FROM (SELECT  ci.city city,
                             userAgent("os", ci.user_agent) os,
                             COUNT(1) os_cnt
                    FROM click_info ci
                    GROUP BY ci.city, userAgent("os", ci.user_agent)
               ) cd) r
    LEFT JOIN cities c ON (r.city = c.id)
WHERE  r.row_number = 1
ORDER BY r.os_cnt DESC;


SELECT nvl(c.name, d.city) city,
       d.device,
       d.device_cnt,
       b.browser,
       b.browser_cnt,
       o.os,
       o.os_cnt
  FROM (SELECT  cd.city,
               cd.device,
               cd.device_cnt,
               ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.device_cnt DESC) row_number
          FROM (SELECT  ci.city city,
                        userAgent("device", ci.user_agent) device,
                        COUNT(1) device_cnt
               FROM click_info ci
               GROUP BY ci.city, userAgent("device", ci.user_agent)
          ) cd) d
  JOIN (SELECT cd.city,
               cd.browser,
               cd.browser_cnt,
               ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.browser_cnt DESC) row_number
          FROM (SELECT  ci.city city,
                        userAgent("browser", ci.user_agent) browser,
                        COUNT(1) browser_cnt
               FROM click_info ci
               GROUP BY ci.city, userAgent("browser", ci.user_agent)
          ) cd) b ON (d.city = b.city AND d.row_number = 1 AND b.row_number = 1)
  JOIN (SELECT cd.city,
              cd.os,
              cd.os_cnt,
              ROW_NUMBER() OVER(PARTITION BY cd.city ORDER BY cd.os_cnt DESC) row_number
         FROM (SELECT  ci.city city,
                       userAgent("os", ci.user_agent) os,
                       COUNT(1) os_cnt
              FROM click_info ci
              GROUP BY ci.city, userAgent("os", ci.user_agent)
         ) cd) o ON (b.city = o.city AND o.row_number = 1)
  LEFT JOIN cities c ON (d.city = c.id)
  ORDER BY d.device_cnt DESC, b.browser_cnt DESC, o.os_cnt DESC;





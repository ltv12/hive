USE hive_hw;

DROP TABLE cities;

CREATE EXTERNAL TABLE cities
(
    id INT,
    name STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ‘,’
LINES TERMINATED BY '\n';
LOAD DATA inpath '/hw/hw-4/city.en.txt' overwrite INTO TABLE cities;

SELECT * FROM cities;
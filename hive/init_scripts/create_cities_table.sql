USE hive_hw;

DROP TABLE cities;

CREATE EXTERNAL TABLE cities
(
id int,
name String
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ‘,’
map keys terminated by '\t' BY '"' LINES TERMINATED BY '\n';
LOAD DATA inpath '/hw/hw-4/city.en.txt' overwrite INTO TABLE cities;

SELECT * FROM cities;
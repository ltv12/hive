USE hive_hw;

CREATE TABLE IF NOT EXISTS airports
(
iata String,
airport String,
city String,
state String,
country String,
lat String,	long String

)
ROW FORMAT DELIMITED FIELDS
TERMINATED BY ',' STORED AS TEXTFILE
TBLPROPERTIES('skip.header.line.count'='1');

LOAD DATA inpath '/hw/hive/2007.csv' overwrite INTO TABLE airports;



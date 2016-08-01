USE hive_hw;

DROP TABLE carriers;

CREATE TABLE IF NOT EXISTS carriers
(
Code String,
Description String
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");

LOAD DATA inpath '/hw/hive/carriers.csv' overwrite INTO TABLE carriers;

SELECT * FROM carriers;


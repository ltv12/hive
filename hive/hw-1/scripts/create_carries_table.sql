USE HW_4;

DROP TABLE carriers;

CREATE TABLE IF NOT EXISTS carriers
  (
     code        STRING,
     description STRING
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


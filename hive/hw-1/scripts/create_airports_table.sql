USE HW_4;

CREATE TABLE IF NOT EXISTS airports
  (
     iata    STRING,
     airport STRING,
     city    STRING,
     state   STRING,
     country STRING,
     lat     STRING,
     long    STRING
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");

LOAD DATA inpath '/hw/hive/airports.csv' overwrite INTO TABLE airports;



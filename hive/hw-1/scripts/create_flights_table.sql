USE hive_hw;

DROP TABLE flights;

CREATE TABLE flights
(
Year int, 
Month int, 
DayofMonth int,
DayOfWeek int,
DepTime int,
CRSDepTime	int, 
ArrTime int,
CRSArrTime int,
UniqueCarrier String,
FlightNum int,
TailNum String,
ActualElapsedTime int,
CRSElapsedTime int,
AirTime int,
ArrDelay int,
DepDelay int,
Origin String,
Dest String,
Distance int,
TaxiIn int,
TaxiOut int, 
Cancelled int,
CancellationCode String,
Diverted int,
CarrierDelay int,
WeatherDelay int,
NASDelay int,
SecurityDelay int,
LateAircraftDelay int 
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
TBLPROPERTIES('skip.header.line.count'='1');

LOAD DATA inpath '/hw/hive/2007.csv' overwrite INTO TABLE flights;

SELECT * FROM flights;


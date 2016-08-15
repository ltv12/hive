USE hw_4;

CREATE TABLE IF NOT EXISTS  flights_orc_compressed
(
 year              SMALLINT,
 month             SMALLINT,
 dayofmonth        SMALLINT,
 dayofweek         SMALLINT,
 deptime           STRING,
 crsdeptime        STRING,
 arrtime           STRING,
 crsarrtime        STRING,
 uniquecarrier     STRING,
 flightnum         STRING,
 tailnum           STRING,
 actualelapsedtime STRING,
 crselapsedtime    STRING,
 airtime           STRING,
 arrdelay          STRING,
 depdelay          STRING,
 origin            STRING,
 dest              STRING,
 distance          STRING,
 taxiin            STRING,
 taxiout           STRING,
 cancelled         SMALLINT,
 cancellationcode  STRING,
 diverted          STRING,
 carrierdelay      STRING,
 weatherdelay      STRING,
 nasdelay          STRING,
 securitydelay     STRING,
 lateaircraftdelay STRING
)
STORED AS ORCFile  
tblproperties ("orc.compress"="SNAPPY");
INSERT OVERWRITE TABLE flights_orc_compressed SELECT * FROM flights;

CREATE TABLE IF NOT EXISTS airports_ORC_compressed
  (
     iata    STRING,
     airport STRING,
     city    STRING,
     state   STRING,
     country STRING,
     lat     STRING,
     long    STRING
  )
STORED AS ORCFILE
tblproperties ("orc.compress"="SNAPPY");
;

INSERT OVERWRITE TABLE airports_ORC_compressed SELECT * FROM airports;

CREATE TABLE IF NOT EXISTS carriers_ORC_compressed
  (
     code        STRING,
     description STRING
  )
STORED AS ORCFILE
tblproperties ("orc.compress"="SNAPPY");
;
INSERT OVERWRITE TABLE carriers_ORC_compressed SELECT * FROM carriers;




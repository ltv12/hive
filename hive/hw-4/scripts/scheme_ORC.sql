USE hw_4;

CREATE TABLE IF NOT EXISTS  flights_orc
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
STORED AS ORCFile;
INSERT OVERWRITE TABLE flights_orc SELECT * FROM flights;

CREATE TABLE IF NOT EXISTS airports_ORC
  (
     iata    STRING,
     airport STRING,
     city    STRING,
     state   STRING,
     country STRING,
     lat     STRING,
     long    STRING
  )
STORED AS ORCFILE;

INSERT OVERWRITE TABLE airports_ORC SELECT * FROM airports;

CREATE TABLE IF NOT EXISTS carriers_ORC
  (
     code        STRING,
     description STRING
  )
STORED AS ORCFILE;
INSERT OVERWRITE TABLE carriers_ORC SELECT * FROM carriers;




USE hw_4;

DROP TABLE flights_b_s1;
CREATE TABLE flights_b_s1
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
CLUSTERED BY (uniquecarrier)
SORTED BY (uniquecarrier)INTO 6 BUCKETS
STORED AS TEXTFILE;
INSERT OVERWRITE TABLE flights_b_s1 SELECT * FROM flights;



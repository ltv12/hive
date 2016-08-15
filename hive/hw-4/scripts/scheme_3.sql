USE HW_4;

--SCHEME 3
DROP TABLE flights_pb_s3;
CREATE TABLE flights_pb_s3
(
 year              SMALLINT,
 --month             SMALLINT,
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
PARTITIONED BY (month             SMALLINT)
CLUSTERED BY (origin, dest) SORTED BY (origin, dest) INTO 16 BUCKETS;

FROM  flights t
INSERT OVERWRITE TABLE flights_pb_s3 PARTITION(month)
SELECT t.year,
       t.dayofmonth,
       t.dayofweek,
       t.deptime,
       t.crsdeptime,
       t.arrtime,
       t.crsarrtime,
       t.uniquecarrier,
       t.flightnum,
       t.tailnum,
       t.actualelapsedtime,
       t.crselapsedtime,
       t.airtime,
       t.arrdelay,
       t.depdelay,
       t.origin,
       t.dest,
       t.distance,
       t.taxiin,
       t.taxiout,
       t.cancelled,
       t.cancellationcode,
       t.diverted,
       t.carrierdelay,
       t.weatherdelay,
       t.nasdelay,
       t.securitydelay,
       t.lateaircraftdelay,
       t.month;


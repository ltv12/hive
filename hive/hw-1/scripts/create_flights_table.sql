USE HW_4;

CREATE TABLE flights
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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
TBLPROPERTIES('skip.header.line.count'='1');

LOAD DATA inpath '/hw/hive/2007.csv' overwrite INTO TABLE flights;

SELECT * FROM flights;


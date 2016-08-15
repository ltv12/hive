USE screening;

CREATE TABLE IF NOT EXISTS driver_info_txt
(
school_year VARCHAR(9),
vendor VARCHAR(100),
service_type VARCHAR(20),
active_empl INT,
job_type VARCHAR(20)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA inpath '/hw/screening/Drivers_and_Attendants.csv' overwrite INTO TABLE driver_info_txt;

CREATE TABLE driver_info_ORC
STORED AS ORCFile AS SELECT * FROM driver_info_txt;


USE screening;
DROP TABLE vehicles_txt;
DROP TABLE vehicles_ORC;

CREATE TABLE IF NOT EXISTS vehicles_txt
(
school_year VARCHAR(9),
vendor VARCHAR(100),
vehicle_type VARCHAR(200),
active_vehicle INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA inpath '/hw/screening/Vehicles.csv' overwrite INTO TABLE vehicles_txt;

CREATE TABLE vehicles_ORC
STORED AS ORCFile AS SELECT * FROM vehicles_txt;





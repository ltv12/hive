USE hive_hw;

DROP TABLE click_info;

CREATE TABLE click_info
(
    bidId	STRING,
    timeValue STRING,
    logType INT,
    iPinyouId STRING,
    user_agent 	STRING,
    ip STRING,
    region INT,
    city 	INT,
    adExchange 	INT,
    domain STRING,
    url STRING,
    anonymousUrlId 	STRING,
    adSlotId	STRING,
    adSlotWidth 	STRING,
    adSlotWeight 	STRING,
    adSlotVisibility 	STRING,
    adSlotFormat 	STRING,
    adSlotFloorPrice INT,
    creativeId 	STRING,
    biddingPrice INT,
    payingPrice INT,
    keyPageUrl 	STRING,
    advertiserId	INT,
    userTags 	STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
ESCAPED BY '"' LINES TERMINATED BY '\n'
STORED AS RCFile;
-- to create external :
-- add external before CREATE operator and next
-- LOCATION 'location_file_directory';

LOAD DATA inpath '/hw/hw-4/test_data/*' overwrite INTO TABLE click_info;

SELECT * FROM click_info;
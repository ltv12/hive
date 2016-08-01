USE hive_hw;

DROP TABLE click_info;

CREATE EXTERNAL TABLE click_info
(
bidId	String,
timeValue String,
logType int,
iPinyouId String,
user_agent 	String,
ip String,
region int,
city 	int,
adExchange 	int,
domain String,
url String,
anonymousUrlId 	String,
adSlotId	String,
adSlotWidth 	String,
adSlotWeight 	String,
adSlotVisibility 	String,
adSlotFormat 	String,
adSlotFloorPrice int,
creativeId 	String,
biddingPrice int,
payingPrice int,
keyPageUrl 	String,
advertiserId	int,
userTags 	String
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY  '\t' ESCAPED BY '"' LINES TERMINATED BY '\n';
LOAD DATA inpath '/hw/hw-4/test_data/*' overwrite INTO TABLE click_info;

SELECT * FROM click_info;
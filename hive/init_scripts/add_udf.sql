
CREATE TEMPORARY FUNCTION userAgent AS 'com.ki.hive.CustomHiveFunction'
USING JAR 'hdfs:///hw/hive/udf-hive-1.0-SNAPSHOT-jar-with-dependencies.jar';

-- init indices
SET hive.optimize.index.filter=true;
SET hive.optimize.index.autoupdate=true;
SET hive.optimize.index.filter.compact.minsize=0


-- Flights indices
CREATE TABLE IF NOT EXISTS flights_indexed LIKE flights;
INSERT OVERWRITE TABLE flights_indexed SELECT * FROM flights;

DROP INDEX composite_index ON flights_indexed;
CREATE INDEX composite_index ON TABLE flights_indexed(uniquecarrier)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH DEFERRED REBUILD;
ALTER INDEX composite_index ON flights_indexed REBUILD;





-- Airports indices
CREATE TABLE IF NOT EXISTS airports_indexed LIKE airports;
INSERT OVERWRITE TABLE airports_indexed SELECT * FROM airports;

CREATE INDEX composite_index ON TABLE airports_indexed(iata)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH DEFERRED REBUILD;
ALTER INDEX composite_index ON airports_indexed REBUILD;

-- carriers indices
CREATE TABLE IF NOT EXISTS carriers_indexed LIKE airports;
INSERT OVERWRITE TABLE carriers_indexed SELECT * FROM carriers;

CREATE INDEX composite_index ON TABLE carriers_indexed(name)
AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler'
WITH DEFERRED REBUILD;
ALTER INDEX composite_index ON airports_indexed REBUILD;










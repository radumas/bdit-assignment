--Creating the table of the locations of the monitoring stations, for mapping

DROP TABLE IF EXISTS monitoring_stations;

SELECT * 
INTO monitoring_stations
FROM (VALUES 
('A','Gardiner','Wickham Rd.',ST_SETSRID(ST_POINT(-79.5315937928,43.616495496),4326)),
('B','Gardiner','Grand Ave.',ST_SETSRID(ST_POINT(-79.4933090701,43.62442964),4326)),
('C','Gardiner','Dufferin St.',ST_SETSRID(ST_POINT(-79.4225135558,43.6344479412),4326)),
('D','Gardiner','Spadina Ave.',ST_SETSRID(ST_POINT(-79.3890959864,43.6393803932),4326)),
('E','Gardiner','Parliament St.',ST_SETSRID(ST_POINT(-79.359379443,43.6482715106),4326)),
('F','DVP','Dundas St. E',ST_SETSRID(ST_POINT(-79.354847201,43.6620791589),4326)),
('G','DVP','Bayview Ramp',ST_SETSRID(ST_POINT(-79.3617154418,43.682881621),4326)),
('H','DVP','Don Mills Rd.',ST_SETSRID(ST_POINT(-79.3335738151,43.7025234462),4326)),
('I','DVP','Wynford Dr.',ST_SETSRID(ST_POINT(-79.3301542712,43.7270739189),4326)),
('J','DVP','Lawrence St. E',ST_SETSRID(ST_POINT(-79.3318510787,43.7399006536),4326)),
('K','DVP','York Mills Rd.',ST_SETSRID(ST_POINT(-79.3351555411,43.7579628216),4326))

) AS stations (ID,Road,xstreet,the_geom)    
--Lookup table for the direction of the segment

SELECT DISTINCT 
startpointname, 
endpointname, 
CASE WHEN startpointname > endpointname THEN 1 ELSE 0 END as inbound --If direction is towards city center then inbound = 1 else 0 for 0utbound
into to_stations_dir
FROM to_data   v
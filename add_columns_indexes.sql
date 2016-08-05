--Adding some extra columns in order to build indexes on them

﻿ALTER TABLE to_data 
ADD COLUMN timeofday TIME;

--Day of week (1-7)

ALTER TABLE to_data 
ADD COLUMN isodow int;

CREATE INDEX stretch ON to_data (startpointname, endpointname);

UPDATE to_data
SET timeofday = rx_time::time, isodow = to_char(rx_time, 'ID')::int;

CREATE INDEX ON to_data(timeofday);

CREATE INDEX ON to_data(isodow);

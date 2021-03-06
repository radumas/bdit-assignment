--Creating a table of the time periods from visual inspection of the graphs
DROP TABLE IF EXISTS timeperiods ;
SELECT period_name, timeperiod
INTO timeperiods
FROM (VALUES
('Night', timerange('21:00'::TIME,'24:00'::TIME, '[)' )), 
('Late Night', timerange('0:00'::TIME,'6:00'::TIME, '[)' )),
('Sunrise', timerange('6:00'::TIME,'7:00'::TIME, '[)' )),
('AM Peak', timerange('7:00'::TIME,'10:00'::TIME, '[)' )),
('Late morning', timerange('10:00'::TIME,'12:00'::TIME, '[)' )),
('Afternoon', timerange('12:00'::TIME,'15:00'::TIME, '[)' )),
('PM Peak', timerange('15:00'::TIME,'19:00'::TIME, '[)' )),
('Evening', timerange('19:00'::TIME,'21:00'::TIME, '[)' ))) AS t (period_name, timeperiod)
 ,t
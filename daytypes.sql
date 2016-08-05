--Lookup table matching day types to days of the week

﻿SELECT daytype, isodow
INTO daytypes
FROM (VALUES 
('Monday',1),
('Midweek',2),
('Midweek',3),
('Midweek',4),
('Friday',5),
('Saturday',6),
('Sunday',7)) AS daytypes (daytype, isodow)


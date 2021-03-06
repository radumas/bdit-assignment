--Median travel time by time of day, segment, and daytype for graphing 

WITH exc AS(SELECT holidate, holiday, to_char(holidate, 'Day') as dow
  FROM public.holidays

UNION

SELECT holidate - 3, 'Friday Before '||holiday, to_char(holidate -3, 'Day')
FROM public.holidays
WHERE to_char(holidate, 'ID') = '1'
)

SELECT daytype, startpointname||'-'||endpointname AS segment,timeofday, percentile_cont(  0.5) WITHIN GROUP (ORDER BY medianmeasuredtime ) as medianmeasuredtime 
FROM to_data 
INNER JOIN daytypes USING (isodow)
WHERE rx_time NOT IN (SELECT holidate from exc) 
GROUP BY daytype, startpointname, endpointname,timeofday
 ad
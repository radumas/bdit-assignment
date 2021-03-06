--Building a table median and 75th percentile travel times by timeperiod and date

SELECT rx_time::date, period_name, startpointname, endpointname, percentile_cont(0.5) WITHIN GROUP (ORDeR BY medianmeasuredtime) AS median, percentile_cont(0.75) WITHIN GROUP (ORDeR BY medianmeasuredtime) AS pct_75
INTO pk_tt
FROM to_data
INNER JOIN daytypes using (isodow)
INNER JOIN timeperiods ON timeperiod @> timeofday 

WHERE (period_name LIKE '%Peak' OR period_name LIKE 'Morning') AND daytype = 'Midweek'
GROUP BY rx_time::date, period_name, startpointname, endpointname;

--Counting days that had particularly slow periods in the AM or PM peak

SELECT mon AS "Month", 
	SUM(CASE WHEN period_name = 'AM Peak' AND median/ 240 >= 7 THEN 1 ELSE 0 END) AS "AM Slow Days",
	SUM(CASE WHEN period_name = 'PM Peak' AND median/ 240 >= 4 THEN 1 ELSE 0 END) AS "PM Slow Days",
	COUNT(DISTINCT rx_time) as "Midweek Days"
FROM (SELECT EXTRACT( 'Month' FROM rx_time) AS mm, rx_time, period_name, to_char(rx_time, 'Month') as mon, median FROM pk_tt WHERE startpointname = 'B' AND endpointname = 'C') bc
GROUP BY mon, mm
ORDER BY mm

SELECT rx_time, CASE WHEN ams.median/ 240 >= 7 THEN 1 ELSE 0 END AS "AM Slow Day",
	CASE WHEN pms.median/ 240 >= 4 THEN 1 ELSE 0 END AS "PM Slow Day",
	ams.median as "AM Median",
	pms.median AS "PM Median"
FROM (SELECT rx_time, period_name, median FROM pk_tt WHERE period_name = 'AM Peak' AND startpointname = 'B' AND endpointname = 'C') ams
INNER JOIn (SELECT rx_time, period_name, median FROM pk_tt WHERE period_name = 'PM Peak' AND startpointname = 'B' AND endpointname = 'C') pms USING (rx_time)
WHERE to_char(rx_time, 'MM')='08'
ORDER BY rx_time   
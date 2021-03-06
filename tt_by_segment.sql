--Overall median travel times and samplecounts by segment to see which segments have overall longer travel times

SELECT inbound, startpointname, endpointname, percentile_cont(0.5) WITHIN GROUP (ORDER BY medianmeasuredtime), avg(avgmeasuredtime), percentile_cont(0.5) WITHIN GROUP (ORDER BY samplecount)

  FROM public.to_data
INNER JOIN to_stations_dir USING (startpointname, endpointname)
GROUP BY inbound, startpointname, endpointname
ORDER BY inbound, startpointname, endpointname
;
   
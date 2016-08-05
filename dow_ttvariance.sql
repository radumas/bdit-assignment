--Travel time variance excluding holidays.
WITH exc AS(SELECT holidate, holiday, to_char(holidate, 'Day')
  FROM public.holidays

UNION

SELECT holidate - 3, 'Friday Before '||holiday, to_char(holidate -3, 'Day')
FROM public.holidays
WHERE to_char(holidate, 'ID') = '1'
)
SELECT isodow, var_pop(medianmeasuredtime)
FROM to_data 
WHERE rx_time NOT IN (SELECT holidate from exc) 
group by isodow
ORDER BY isodow;


--Travel time variance on holidays.
WITH exc AS(SELECT holidate, holiday, to_char(holidate, 'Day') as dow
  FROM public.holidays

UNION

SELECT holidate - 3, 'Friday Before '||holiday, to_char(holidate -3, 'Day')
FROM public.holidays
WHERE to_char(holidate, 'ID') = '1'
)
SELECT holidate, holiday, dow,  var_pop(medianmeasuredtime)
FROM to_data 
INNER JOIN exc ON rx_time::date = holidate 
group by holidate, holiday, dow 
ORDER BY dow , holidate
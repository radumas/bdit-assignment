--Building a combintation of holidays and the Fridays preceding them to exclude from "regular days"

SELECT holidate, holiday, to_char(holidate, 'Day')
  FROM public.holidays

UNION

SELECT holidate - 3, 'Friday Before '||holiday, to_char(holidate -3, 'Day')
FROM public.holidays
WHERE to_char(holidate, 'ID') = '1'
 me
UPDATE public.toronto_bb_weather_ec_hourly
SET weather_time = weather_time + '1 hour'
WHERE weather_time between '2015-03-08 02:00:00' and '2015-11-01 02:00:00'

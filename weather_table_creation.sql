-- Table: public.toronto_weather

-- DROP TABLE public.toronto_weather;

CREATE TABLE public.toronto_weather_ec_daily
(
  id serial primary key,
  weather_date date,
  maxtemp numeric,
  meantemp numeric,
  mintemp numeric,
  totalprecip numeric,
  totalsnow numeric,
  totalrain numeric,  
  snowonground numeric
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.toronto_weather_ec_daily
  OWNER TO rad;
GRANT ALL ON TABLE public.toronto_weather_ec_daily TO rad;
GRANT SELECT, INSERT ON TABLE public.toronto_weather_ec_daily TO python;

CREATE TABLE public.toronto_weather_ec_hourly
(
  id serial primary key,
  weather_time timestamp,
  temperature numeric,
  wind_dir int,
  wind_spd int,
  weather text[]
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.toronto_weather_ec_hourly
  OWNER TO rad;
GRANT ALL ON TABLE public.toronto_weather_ec_hourly TO rad;
GRANT SELECT, INSERT ON TABLE public.toronto_weather_ec_hourly TO python;


CREATE TABLE holidays(
	holidate date,
	holiday text )
;
GRANT ALL ON holidays to python;
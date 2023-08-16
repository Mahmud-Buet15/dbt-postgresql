select
	*,
	date_part('year',dates) as year,
	'Qtr '||date_part('quarter',dates) as quarter,
	date_part('month',dates) as months,
	to_char(dates,'Mon') as month_name,
	date_trunc('month',dates)::date as start_of_month,
	date_part('week',dates+1) as weekday, --considering sunday as first day of week
	to_char(dates,'Dy') as weekday_name,
	dates- date_part('week',dates+1)::int +1 as start_of_week
from
(
select generate_series('2017-01-01'::date,'2018-09-30'::date,'1 Day')::date as dates
) tbl1
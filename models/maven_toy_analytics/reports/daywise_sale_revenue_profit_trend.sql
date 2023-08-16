select
	tbl1.start_of_month ,
	count(1) as total_sale,
	sum(tbl3."Product_Price ($)" * tbl2."Units" ) as total_revenue,
	sum(tbl3."Profit per unit ($)" * tbl2."Units" ) as total_profit
from {{ref('maven_toy_calendar')}} tbl1
inner join {{ref('stg_maven_toys_sales')}} tbl2 on tbl1.dates =tbl2."Date"::date
inner join {{ref('maven_toys_products_update')}} tbl3 on tbl2."Product_ID" =tbl3."Product_ID"
group by 1
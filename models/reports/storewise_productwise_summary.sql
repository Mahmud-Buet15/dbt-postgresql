select
	*,
	round(units_sold/selling_dates,0) as units_sold_per_day,
	"Product_Name" ='{{var("cards")}}' as is_card_game
from
    (
    select
        tbl3."Store_Name",
        tbl5."Product_Name" ,
        sum(tbl4."Units") as units_sold,
        count(distinct tbl4."Date") as selling_dates
    from {{ref('stg_maven_toys_stores')}} tbl3
    inner join {{ref('stg_maven_toys_sales')}} tbl4 on tbl3."Store_ID" =tbl4."Store_ID"
    inner join {{ref('maven_toys_products_update')}} tbl5 on tbl4."Product_ID" =tbl5."Product_ID"
    group by 1,2
    ) tbl6
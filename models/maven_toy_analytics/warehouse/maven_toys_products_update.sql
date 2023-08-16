select
	*,
	"Product_Price ($)"-"Product_Cost ($)" as "Profit per unit ($)"
from
(
select
	*,
	right("Product_Cost", length("Product_Cost")-1)::numeric as "Product_Cost ($)" ,
	right("Product_Price", length("Product_Price")-1)::numeric as "Product_Price ($)"
from  {{ref('stg_maven_toys_products')}}
) tbl1
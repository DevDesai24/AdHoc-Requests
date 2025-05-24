with cte as(
SELECT 
	division,
    product_code,
    product,
    sum(sold_quantity) as total_sold_quantity,
    rank() over(partition by division order by sum(sold_quantity) desc) as rank_order
FROM fact_sales_monthly
join dim_product
using(product_code)
where fiscal_year=2021
group by product_code
)
select 
	* 
from cte 
where rank_order in (1,2,3)


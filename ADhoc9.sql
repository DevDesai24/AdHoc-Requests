with cte as (
select 
	channel,
	round(sum(gross_price*sold_quantity/1000000),2) as gross_sales_mln
from dim_customer 
join fact_sales_monthly s
using (customer_code)
join fact_gross_price
using (product_code)
where s.fiscal_year=2021
group by channel
order by gross_sales_mln desc
)
select 
	*,
	round((gross_sales_mln/sum(gross_sales_mln) over())*100,2) as percentage
from cte

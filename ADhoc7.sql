select 
	concat(monthname(date),year(date)) as month,
	s.fiscal_year,
    round(sum(sold_quantity*gross_price),2) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g
using(product_code)
join dim_customer c
using(customer_code)
where customer="Atliq Exclusive"
group by month,s.fiscal_year

    
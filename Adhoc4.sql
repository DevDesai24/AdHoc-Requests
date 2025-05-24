with cte_2020 as (
SELECT 
	p.segment as A,
    count(distinct p.product_code) as product_count_2020
FROM dim_product p
join fact_sales_monthly s
on  p.product_code=s.product_code
where fiscal_year=2020
group by p.segment
order by product_count_2020 desc
),
cte_2021 as (
SELECT 
	p.segment as B, 
    p.product_code,
    count(distinct p.product_code) as product_count_2021
FROM dim_product p
join fact_sales_monthly s
on  p.product_code=s.product_code
where fiscal_year=2021
group by p.segment 
order by product_count_2021 desc
)

select 
	cte_2020.A,
	product_count_2020,
    product_count_2021,
    abs(product_count_2021-product_count_2020) as difference
from cte_2020 ,cte_2021 
where cte_2020.A=cte_2021.B
order by difference desc


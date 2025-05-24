with fy_2020 as (
SELECT 
	count(distinct product_code) unique_product_2020 
FROM gdb023.fact_sales_monthly 
where fiscal_year=2020
),

fy_2021 as (
SELECT 
	count(distinct product_code) unique_product_2021 
FROM gdb023.fact_sales_monthly 
where fiscal_year=2021
)

select 
	*,
	round((unique_product_2021-unique_product_2020)*100/unique_product_2020,2) as pct_chg 
from fy_2020,fy_2021
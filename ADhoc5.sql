select 
	product, 
    p.product_code, 
    manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
on p.product_code=m.product_code
where manufacturing_cost=(select max(manufacturing_cost) from fact_manufacturing_cost)
union all
select 
	product, 
    p.product_code, 
    manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
on p.product_code=m.product_code
where manufacturing_cost=(select min(manufacturing_cost) from fact_manufacturing_cost);

SELECT 
	product, 
    p.product_code, 
    manufacturing_cost 
from dim_product p
join fact_manufacturing_cost m
on p.product_code=m.product_code
WHERE manufacturing_cost IN 
((select max(manufacturing_cost) from fact_manufacturing_cost), 
(select min(manufacturing_cost) from fact_manufacturing_cost))
order by manufacturing_cost desc;
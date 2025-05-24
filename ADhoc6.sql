SELECT 
	customer_code,
    customer,
    round(avg(pre_invoice_discount_pct),4) as avg_pre_invoice_discount_pct
FROM fact_pre_invoice_deductions
JOIN dim_customer
using (customer_code)
where fiscal_year=2021 and market="India"
group by customer
order by avg_pre_invoice_discount_pct desc
limit 5

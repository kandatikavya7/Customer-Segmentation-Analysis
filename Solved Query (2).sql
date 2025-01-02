# 1--How is the shopping distribution according to gender?

select 	
	  gender,
      count(*) as total_customer,
      sum(quantity) as Quantity_Number,
      sum(price) as Amount_spent
from	
	Customer
group by gender;

##  2.	Which gender did we sell more products to?
# Ans- We sell more products to male which is 120053 and more than female.
select
	   gender,
       sum(quantity) as products
from 
	customer
group by 
		gender;

# 3.Which gender generated more revenue?
#Ans-Female gender has generated more than more 
# Female-40931802 and male-27619564
select	
	  gender,
      round(sum(price),0) as revenue
from 
	customer
group by
		gender
order by revenue desc;

# 4.Distribution of purchase categories relative to other columns?
select
	  category,
      sum(quantity) as Purchase_quantity,
      round(sum(price),0) as revenue
from
	customer
group by 
		category
order by 
		revenue desc;

# 5.How is the shopping distribution according to age?
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(price) AS Revenue
FROM 
    customer
GROUP BY 
    age_group
ORDER BY 
    MIN(age);

# 6.Which age category did we sell more products to?
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    SUM(quantity) as Total_product
from
	customer
group by 
		age_group
order by 
		Total_product desc;

# 7.Which age cat generated more revenue?
#Ans- Age group has generated more revenue 15831279.
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    ROUND(SUM(price),0) as Revenue
from 
	customer
group by 
		age_group
order by 
		revenue desc;

#8.Distribution of purchase categories relative to other columns?
select
		category,
        SUM(quantity) AS Purchase_quantity,
        SUM(price) AS Revenue
from 
	customer
group by 
		category
order by revenue desc;

#9.Does the payment method have a relation with other columns?
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    payment_method,
    COUNT(*) AS total_transactions,
    ROUND(AVG(price),0) AS avg_amount_spent
FROM 
    customer
GROUP BY 
    payment_method, age_group
ORDER BY 
    payment_method, age_group DESC;
    

## 10-How is the distribution of the payment method?
SELECT 
    payment_method,
    COUNT(*) AS total_payments,
    ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM 
    customer
GROUP BY 
    payment_method;


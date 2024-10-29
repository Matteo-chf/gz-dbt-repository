SELECT
orders_id,
date_date,
ROUND(SUM(revenue),2) AS sum_revenue,
ROUND(SUM(quantity),2) AS sum_quantity,
ROUND(SUM(purchase_cost),2) AS purchase_cost,
ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }} AS sales
GROUP BY 
 date_date,
 orders_id
ORDER BY orders_id DESC

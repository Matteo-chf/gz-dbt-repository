SELECT
sales_margin.orders_id,
date_date,
ROUND((margin + shipping_fee - logcost - ship_cost),2) AS operational_margin,
ROUND((revenue),2) AS sum_revenue,
ROUND((quantity),2) AS sum_quantity,
ROUND((purchase_cost),2) AS purchase_cost,
ROUND((margin),2) AS margin
FROM {{ ref('int_sales_margin') }} AS sales_margin
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship 
ON sales_margin.orders_id = ship.orders_id
ORDER BY sales_margin.orders_id DESC
GROUP BY sales_margin.orders_id
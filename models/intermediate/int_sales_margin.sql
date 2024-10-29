SELECT
orders_id,
date_date,
pdt_id,
quantity,
revenue,
quantity * purchase_price AS purchase_cost,
ROUND(sales.revenue - (sales.quantity * product.purchase_price),2) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product
ON sales.pdt_id = product.products_id
ORDER BY orders_id
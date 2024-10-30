  WITH sub AS (
  SELECT
    sales.date_date,
    sales.orders_id,
    sales.pdt_id,
    sales.quantity,
    sales.revenue,
    product.purchase_price,
    ROUND(purchase_price*sales.quantity,2) AS purchase_cost
    FROM {{ ref('stg_raw__sales') }} AS sales
    LEFT JOIN {{ ref('stg_raw__product') }} AS product
  ON sales.pdt_id = product.products_id
  )
 SELECT *,
    {{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent
 FROM 
    sub
USE ecommerce;

SELECT 
  YEAR(o.order_purchase_timestamp) AS year,
  MONTH(o.order_purchase_timestamp) AS month,
  ROUND(SUM(p.payment_value), 2) AS total_revenue,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p 
ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp)
ORDER BY year, month;
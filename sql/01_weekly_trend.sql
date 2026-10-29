-- 按周销售趋势
-- 说明：W13 与 W26 为不完整周（仅 2 天 / 3 天），分析时应排除或单独标注
USE ecommerce;

SELECT
  DATE_FORMAT(order_date, '%x-W%v')      AS year_week,
  MIN(order_date)                        AS week_start,
  COUNT(*)                               AS orders,
  SUM(status <> 'Cancelled')             AS valid_orders,
  ROUND(SUM(CASE WHEN status <> 'Cancelled' THEN amount END), 2) AS gmv
FROM orders
GROUP BY year_week
ORDER BY week_start;

-- 客单价分层与退货率
-- 注意：WHERE amount IS NOT NULL 会排除约 7,795 条取消单，
--       因此结果口径为“已成交订单中”的分层退货率
USE ecommerce;

SELECT
  CASE
    WHEN amount < 500  THEN '1. below 500'
    WHEN amount < 1000 THEN '2. 500-1000'
    WHEN amount < 2000 THEN '3. 1000-2000'
    ELSE                    '4. above 2000'
  END                                        AS price_band,
  COUNT(*)                                   AS orders,
  ROUND(AVG(amount), 2)                      AS avg_amount,
  ROUND(100.0 * SUM(status IN ('Shipped - Returned to Seller',
                               'Shipped - Returning to Seller',
                               'Shipped - Rejected by Buyer'))
        / COUNT(*), 2)                       AS return_pct
FROM orders
WHERE amount IS NOT NULL
GROUP BY price_band
ORDER BY price_band;

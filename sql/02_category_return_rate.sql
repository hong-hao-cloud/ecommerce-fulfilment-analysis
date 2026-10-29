-- 各品类退货率
-- HAVING COUNT(*) > 100：过滤小样本，避免 3 单退 1 单造成的高退货率假象
USE ecommerce;

SELECT
  COALESCE(NULLIF(category, ''), '未分类') AS category,
  COUNT(*)                                  AS orders,
  SUM(status IN ('Shipped - Returned to Seller',
                 'Shipped - Returning to Seller',
                 'Shipped - Rejected by Buyer')) AS returned,
  ROUND(100.0 * SUM(status IN ('Shipped - Returned to Seller',
                               'Shipped - Returning to Seller',
                               'Shipped - Rejected by Buyer'))
        / COUNT(*), 2)                      AS return_rate_pct
FROM orders
GROUP BY category
HAVING COUNT(*) > 100
ORDER BY return_rate_pct DESC;

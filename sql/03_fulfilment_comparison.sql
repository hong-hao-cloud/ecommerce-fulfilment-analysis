-- 履约方式对比（核心查询）
-- 口径说明：
--   取消率   = 取消单 / 全部订单
--   退货率   = 退货类订单 / 已发货订单（分母剔除取消单，更严谨）
-- 结论：Amazon 退货率为 0.00%，经 06 号脚本验证为口径缺失，不可跨履约方式比较
USE ecommerce;

SELECT
  fulfilment,
  COUNT(*)                                        AS total_orders,
  SUM(status <> 'Cancelled')                      AS shipped_orders,
  SUM(status = 'Cancelled')                       AS cancelled_orders,
  ROUND(100.0 * SUM(status = 'Cancelled') / COUNT(*), 2) AS cancel_rate_pct,
  ROUND(100.0 * SUM(status IN ('Shipped - Returned to Seller',
                               'Shipped - Returning to Seller',
                               'Shipped - Rejected by Buyer'))
        / SUM(status <> 'Cancelled'), 2)          AS return_rate_of_shipped_pct
FROM orders
GROUP BY fulfilment;

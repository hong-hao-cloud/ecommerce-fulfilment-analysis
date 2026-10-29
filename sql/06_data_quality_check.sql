-- 退货口径验证
-- 目的：确认 Amazon 履约退货率 0.00% 是真实业务表现，还是数据缺失
-- 结果：2,115 条退货类记录全部归属 Merchant，Amazon 为 0
-- 结论：Shipped - Returned to Seller 仅统计退回卖家的退货，
--       Amazon 渠道退货回流至平台仓，不进入该字段 → 退货率不可比
USE ecommerce;

SELECT fulfilment, status, COUNT(*) AS cnt
FROM orders
WHERE status IN ('Shipped - Returned to Seller',
                 'Shipped - Returning to Seller',
                 'Shipped - Rejected by Buyer',
                 'Shipped - Damaged',
                 'Shipped - Lost in Transit')
GROUP BY fulfilment, status
ORDER BY fulfilment, cnt DESC;

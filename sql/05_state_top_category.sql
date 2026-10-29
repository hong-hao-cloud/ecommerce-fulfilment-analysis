-- 每个州 GMV 排名前 3 的品类（窗口函数练习）
USE ecommerce;

WITH t AS (
  SELECT ship_state,
         COALESCE(NULLIF(category, ''), '未分类') AS category,
         SUM(amount) AS gmv
  FROM orders
  WHERE status <> 'Cancelled'
  GROUP BY ship_state, category
),
r AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY ship_state ORDER BY gmv DESC) AS rn
  FROM t
)
SELECT * FROM r WHERE rn <= 3
ORDER BY ship_state, rn;

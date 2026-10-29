# 数据来源说明

- 数据集：E-Commerce Sales Dataset（Amazon Sale Report）
- 平台：Kaggle
- 链接：https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data
- 文件：Amazon Sale Report.csv（68.9 MB，128,975 行）
- 时间范围：2022-03-31 至 2022-06-29
- 币种：INR（印度卢比）

## 为什么只保留样本

原始文件约 69 MB，超出 GitHub 建议的单文件体积，因此仓库仅保留 1,000 行样本
（`sample_1000.csv`），完整数据请从上方链接自行下载。

## 字段说明

| 字段 | 含义 |
|---|---|
| order_id | 订单号 |
| order_date | 下单日期（原始格式 MM-DD-YY） |
| status | 订单状态（发货、已送达、已取消、退货等） |
| fulfilment | 履约方式：Amazon 代履约 / Merchant 自发货 |
| category | 商品品类（服装类） |
| qty | 数量 |
| amount | 金额（INR），取消单常为空 |
| ship_state | 收货州 |
| courier_status | 物流状态 |
| b2b | 是否企业订单 |

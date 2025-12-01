CREATE TABLE `rakamin-kf-analytics-479117.kimia_farma.kf_tabel_analisa` AS

WITH MAIN AS (
  SELECT
    ft.transaction_id,
    ft.date,
    ft.branch_id,
    cb.branch_name,
    cb.kota,
    cb.provinsi,
    cb.rating AS rating_cabang,
    ft.customer_name,
    pd.product_id,
    pd.product_name,
    ft.price AS actual_price,
    ft.discount_percentage,

    -- Persentase Gross Laba
    CASE 
      WHEN ft.price <= 50000 THEN 0.10
      WHEN ft.price <= 100000 THEN 0.15
      WHEN ft.price <= 300000 THEN 0.20
      WHEN ft.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,

    -- Nett Sales
    ft.price * (1 - ft.discount_percentage) AS nett_sales,

    -- Net Profit
    (ft.price * (1 - ft.discount_percentage)) * 
    CASE 
      WHEN ft.price <= 50000 THEN 0.10
      WHEN ft.price <= 100000 THEN 0.15
      WHEN ft.price <= 300000 THEN 0.20
      WHEN ft.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS nett_profit,

    ft.rating AS rating_transaksi

  FROM `rakamin-kf-analytics-479117.kimia_farma.kf_final_transaction` AS ft
  LEFT JOIN `rakamin-kf-analytics-479117.kimia_farma.kf_kantor_cabang` AS cb
    ON ft.branch_id = cb.branch_id
  LEFT JOIN `rakamin-kf-analytics-479117.kimia_farma.kf_product` AS pd
    ON ft.product_id = pd.product_id
)

SELECT * FROM MAIN;
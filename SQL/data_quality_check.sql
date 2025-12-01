-- Check Duplicate 
-- 1. kf_final_transaction

SELECT 
  transaction_id, product_id, branch_id, customer_name,
  date, price, discount_percentage, rating,
  COUNT(*) AS CNT
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_final_transaction`
GROUP BY 
  transaction_id, product_id, branch_id, customer_name,
  date, price, discount_percentage, rating
HAVING COUNT(*) > 1;

-- 2. kf_product

SELECT
  product_id, product_name, product_category, price,
  COUNT(*) AS CNT
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_product`
GROUP BY
  product_id, product_name, product_category, price
HAVING COUNT(*) > 1;

-- 3. kf_inventory
SELECT
  Inventory_ID, branch_id, product_id, product_name, opname_stock,
  COUNT(*) AS CNT
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_inventory`
GROUP BY
  Inventory_ID, branch_id, product_id, product_name, opname_stock
HAVING COUNT(*) > 1;

-- 4. kf_cantor_cabang
SELECT
  branch_id, branch_category, branch_name,
  kota, provinsi, rating,
  COUNT(*) AS CNT
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_kantor_cabang` 
GROUP BY 
  branch_id, branch_category, branch_name,
  kota, provinsi, rating
HAVING COUNT(*) > 1;

-- Result: No Duplicate Datas


-- Check Missing Values
-- 1. kf_final_transaction

SELECT *
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_final_transaction` AS src
WHERE TO_JSON_STRING(src) LIKE '%null%';

-- 2. kf_product
SELECT *
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_product` AS src
WHERE TO_JSON_STRING(src) LIKE '%null%';

-- 3. kf_inventory
SELECT *
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_inventory` AS src
WHERE TO_JSON_STRING(src) LIKE '%null%';

-- 4. kf_kantor cabang
SELECT *
FROM `rakamin-kf-analytics-479117.kimia_farma.kf_kantor_cabang` AS src
WHERE TO_JSON_STRING(src) LIKE '%null%';

-- Result: No Duplicate Datas

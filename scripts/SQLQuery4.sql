-- Expectation : No results
SELECT cst_key
FROM bronze.crm_cust_info
WHERE cst_key != TRIM(cst_key)

-- Data Standardization & consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info
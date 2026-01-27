cst_id
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--check for unwanted spaces
-- expectation: no results
SELECT cst_firstname
FROM  silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

-- Data standardization & consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info
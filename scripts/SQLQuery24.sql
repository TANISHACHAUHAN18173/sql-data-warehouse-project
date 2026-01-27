INSERT INTO silver.erp_loc_a101
(cid , cntry)
SELECT 
REPLACE(cid, '-' , '') cid,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
     WHEN TRIM(cntry) IN ('US' , 'USA') THEN 'United States'
     WHEN TRIM(cntry) = ' ' OR cntry IS NULL THEN 'n/a'
     END as cntry -- normalization and handling missing and blank country
FROM bronze.erp_loc_a101


-- data standarization & consistency
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry
SELECT * FROM silver.erp_loc_a101


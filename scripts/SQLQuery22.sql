SELECT 
cid,
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
  ELSE  cid
  END  AS cid,
  CASE WHEN bdate > GETDATE() THEN NULL
  ELSE bdate END AS badate,
bdate,
gen
FROM bronze.erp_cust_az12
WHERE CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
ELSE cid 
END NOT IN(SELECT DISTINCT cst_key FROM silver.crm_cust_info )
SELECT * FROM [silver].[crm_cust_info];

-- identify out-of range dates
SELECT DISTINCT 
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE ()

-- data standarization & consistency
SELECT DISTINCT 
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F' , 'FEMALE') THEN 'Female'
WHEN UPPER(TRIM(gen)) IN ('M' , 'MALE') THEN 'Male'
ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12
SELECT * FROM silver.erp_cust_az12

IF OBJECT_ID ('silver.crm_prd_info', 'U') IS NOT NULL
DROP TABLE silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
prd_id INT,
cat_id NVARCHAR(50),
prd_key  NVARCHAR(50),
prd_nm   NVARCHAR(50),
prd_cost INT,
prd_line  NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt  DATE,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

SELECT 
prd_id,
prd_key,
REPLACE(SUBSTRING(prd_key,1 ,5),'-' , '_') as cat_id,
SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
prd_nm,
ISNULL(prd_cost, 0) AS prd_cost,
prd_line,
CASE WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
     WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
     WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'other Sale'
     WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
     ELSE 'n/a'
END AS prd_line,
CAST (prd_start_dt AS DATE) as prd_start_dt,
CAST(LEAD (prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) -1 AS DATE) AS prd_end_dt
FROM bronze.crm_prd_info
WHERE SUBSTRING(prd_key, 7 , LEN(prd_key)) IN (
SELECT sls_prd_key FROM bronze.crm_sales_details )
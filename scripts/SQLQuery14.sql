SELECT 
*
FROM (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as Flag_last
FROM bronze.crm_cust_info
WHERE cst_id IS NOT NULL
)T WHERE flag_last = 1 
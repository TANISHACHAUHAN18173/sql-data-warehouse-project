-- Create Database 'DataWarehouse'
USE master;
CREATE DATABASE DataWarehouse;
USE DataWarehouse; 

-- Create Schema  
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

CREATE TABLE bronze.crm_cust_info (
	cst_id	INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

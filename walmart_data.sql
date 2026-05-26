CREATE DATABASE walmart_sales;
use walmart_sales;


CREATE TABLE walmart_data (
    Store INT,
    Date VARCHAR(20),
    Weekly_Sales DECIMAL(15,2),
    Holiday_Flag INT,
    Temperature DECIMAL(10,2),
    Fuel_Price DECIMAL(10,2),
    CPI DECIMAL(10,2),
    Unemployment DECIMAL(10,2)
);


SELECT * FROM walmart_data;
DROP TABLE walmart_data;


-- =========================================
-- Walmart Retail Analytics SQL Queries
-- =========================================

-- 1. View First 10 Rows
SELECT *
FROM walmart_data
LIMIT 10;


-- =========================================
-- 2. Total Sales by Store
-- =========================================
SELECT
    Store,
    SUM(Weekly_Sales) AS TotalSales
FROM walmart_data
GROUP BY Store
ORDER BY TotalSales DESC;


-- =========================================
-- 3. Holiday vs Non-Holiday Average Sales
-- =========================================
SELECT
    Holiday_Flag,
    AVG(Weekly_Sales) AS AvgSales
FROM walmart_data
GROUP BY Holiday_Flag;


-- =========================================
-- 4. Year-wise Sales Trend
-- =========================================
SELECT
    YEAR(Date) AS Year,
    SUM(Weekly_Sales) AS Revenue
FROM walmart_data
GROUP BY YEAR(Date)
ORDER BY Year;


-- =========================================
-- 5. Monthly Sales Trend
-- =========================================
SELECT
    MONTH(Date) AS Month,
    SUM(Weekly_Sales) AS MonthlySales
FROM walmart_data
GROUP BY MONTH(Date)
ORDER BY Month;


-- =========================================
-- 6. Top 10 Performing Stores
-- =========================================
SELECT
    Store,
    SUM(Weekly_Sales) AS TotalSales
FROM walmart_data
GROUP BY Store
ORDER BY TotalSales DESC
LIMIT 10;


-- =========================================
-- 7. Economic Indicators Analysis
-- =========================================
SELECT
    AVG(CPI) AS Avg_CPI,
    AVG(Fuel_Price) AS Avg_FuelPrice,
    AVG(Unemployment) AS Avg_Unemployment
FROM walmart_data;


-- =========================================
-- 8. Average Temperature During Holidays
-- =========================================
SELECT
    Holiday_Flag,
    AVG(Temperature) AS AvgTemperature
FROM walmart_data
GROUP BY Holiday_Flag;


-- =========================================
-- 9. Weekly Sales by Holiday Type
-- =========================================
SELECT
    Holiday_Flag,
    SUM(Weekly_Sales) AS TotalHolidaySales
FROM walmart_data
GROUP BY Holiday_Flag;


-- =========================================
-- 10. Store Count
-- =========================================
SELECT
    COUNT(DISTINCT Store) AS TotalStores
FROM walmart_data;


-- =========================================
-- 11. Maximum Weekly Sales
-- =========================================
SELECT
    MAX(Weekly_Sales) AS HighestWeeklySales
FROM walmart_data;


-- =========================================
-- 12. Minimum Weekly Sales
-- =========================================
SELECT
    MIN(Weekly_Sales) AS LowestWeeklySales
FROM walmart_data;
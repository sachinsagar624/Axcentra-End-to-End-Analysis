
CREATE DATABASE axcentra_project;
USE axcentra_project;
SHOW TABLES;
RENAME TABLE `sample data (1).xlsx - sheet1` TO excent_data;
SHOW TABLES;
SELECT * FROM `excent_data` LIMIT 5;
DESCRIBE excent_data;
SELECT
    COUNT(*) AS Total_Rows,
    SUM(`Sales`) AS Total_Sales,
    SUM(`Profit`) AS Total_Profit,
    SUM(`Units Sold`) AS Total_Units_Sold
FROM excent_data;
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(`Units Sold`) AS Total_Units_Sold
FROM excent_data
GROUP BY Product
ORDER BY Total_Sales DESC;
##Country-wise Sales Analysis
SELECT
    Country,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(`Units Sold`) AS Total_Units_Sold
FROM excent_data
GROUP BY Country
ORDER BY Total_Sales DESC;
##Segment-wise Sales Analysis
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(`Units Sold`) AS Total_Units_Sold
FROM excent_data
GROUP BY Segment
ORDER BY Total_Sales DESC;
##Year-wise aur Monthly Sales Trend
SELECT
    `Year`,
    `Month Number`,
    `Month Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM excent_data
GROUP BY `Year`, `Month Number`, `Month Name`
ORDER BY `Year`, `Month Number`;
##Discount Band Analysis
SELECT
    `Discount Band`,
    SUM(Sales) AS Total_Sales,
    SUM(Discounts) AS Total_Discounts,
    SUM(Profit) AS Total_Profit
FROM excent_data
GROUP BY `Discount Band`
ORDER BY Total_Sales DESC;
##Loss-making segments identify karo
SELECT
    Segment,
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM excent_data
GROUP BY Segment, Product
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;
##Overall Profit Margin
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Percent
FROM excent_data;
##Top 3 products by profit.
SELECT
    Product,
    SUM(Profit) AS Total_Profit
FROM excent_data
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 3;

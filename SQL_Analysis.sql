create database DataWarehouse;
use DataWarehouse;
select database();
USE DataWarehouse;
CREATE TABLE Fact_Sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(255),
    Segment VARCHAR(100),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(100),
    Sub_Category VARCHAR(100),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(10,2),
    Profit DECIMAL(10,2)
);
show tables;
DESCRIBE Fact_Sales;
select*from Fact_Sales;
USE DataWarehouse;

SELECT COUNT(*) AS Total_Records
FROM Fact_Sales;

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM Fact_Sales;

SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM Fact_Sales;

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Fact_Sales;

SELECT Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Fact_Sales
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT Product_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Fact_Sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Fact_Sales
GROUP BY Category;

SELECT YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Fact_Sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;



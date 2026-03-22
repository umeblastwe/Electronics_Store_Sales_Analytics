-- 1. Revenue & Sales Trends
--Monthly Performance
Select  CONVERT(nvarchar(7), Order_date, 120) AS year_month,
    Sum(sales) as Revenue
From [Sales Data]
Group by CONVERT(nvarchar(7), Order_date, 120)
Order by CONVERT(nvarchar(7), Order_date, 120)

-- Sales Change Month By Month 
WITH t2 AS
(
    SELECT 
        CONVERT(nvarchar(7), Order_date, 120) AS year_month, 
        SUM(sales) AS current_month_sales,
        LAG(SUM(sales)) OVER (
            ORDER BY CONVERT(nvarchar(7), Order_date, 120) ASC
        ) AS previous_month_sales
    FROM [Sales Data]
    GROUP BY CONVERT(nvarchar(7), Order_date, 120)
)
SELECT 
    year_month,
    convert(decimal(10,2),(1.0 * (current_month_sales - previous_month_sales) 
    / (previous_month_sales) * 100)) AS monthly_percentage_change
FROM t2
ORDER BY year_month ASC;

-- Total Revenue
Select Sum(Sales) as Total_Revenue
From [Sales Data]

--2. Product Performance
-- Top Sellers
Select Product, Sum(Quantity_Ordered) as Products_sold, Sum(Sales) as Total_Revenue_By_Products
From [Sales Data]
Group By Product
Order By Sum(Sales) Desc

-- Product Popularity By City (Top5)
WITH RankedProducts AS (
    SELECT 
        City,
        Product,
        SUM(Quantity_Ordered) AS Total_Quantity,
        DENSE_RANK() OVER (
            PARTITION BY City 
            ORDER BY SUM(Quantity_Ordered) DESC
        ) AS rank_in_city
    FROM [Sales Data]
    GROUP BY City, Product
)

SELECT *
FROM RankedProducts
WHERE rank_in_city <= 5
ORDER BY City, rank_in_city;

-- low quantity sales but premium revenue
Select Product, Sum(Quantity_Ordered) as Products_Sold, Sum(Sales) as Total_Revenue
From [Sales Data]
Group by Product
Having Sum(Quantity_Ordered) < 3000 
And Sum(Sales) > 50000
Order By Sum(sales) Desc

--3. Geographic & Location Analysis

-- City Contribution In Sales

Select City, Sum(Sales) as Revenue_By_city, AVG(Sales) as Average_Sales_Per_city
From [Sales Data]
Group By City
Order By Sum(Sales) Desc

-- Address Patterns In Sales
SELECT 
    City,
    LEFT([Purchase_Address], CHARINDEX(',', [Purchase_Address]) - 1) AS Street_Name,
    COUNT([Order_ID]) AS Total_Orders
FROM [Sales Data]
GROUP BY City, LEFT([Purchase_Address], CHARINDEX(',', [Purchase_Address]) - 1)
ORDER BY Total_Orders DESC;

--4. Time Analysis
--Hourly Revenue
Select Hour, Sum(sales) as Total_Revenue_By_Hours
From [Sales Data]
Group by Hour
Order by Hour desc

--5. Basket Analysis (Frequently Bought Together" analysis)
--Average Amount Spend Per Order ID
Select
    Sum(Sales) / Count(Order_Id) as Average_Amount_Spend_Per_Order
    From [Sales Data]
    


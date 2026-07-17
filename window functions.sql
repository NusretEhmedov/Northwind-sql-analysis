SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    Freight,
    ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNum,
    RANK() OVER (PARTITION BY CustomerID ORDER BY Freight DESC) AS CustomerFreightRank,
    ROUND(SUM(Freight) OVER (ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS RunningTotalFreight
FROM Orders
LIMIT 20;
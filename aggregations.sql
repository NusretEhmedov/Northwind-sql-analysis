-- Correctly calculating Customer Revenue using line-item calculations to avoid Fan-out
SELECT 
    o.CustomerID,
    COUNT(DISTINCT o.OrderID) AS TotalUniqueOrders,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY TotalRevenue DESC
LIMIT 5;
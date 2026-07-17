WITH MonthlySalesCTE AS (
    SELECT 
        strftime('%Y-%m', o.OrderDate) AS SalesMonth,
        ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS MonthlyRevenue
    FROM Orders o
    INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY strftime('%Y-%m', o.OrderDate)
)
SELECT SalesMonth, MonthlyRevenue
FROM MonthlySalesCTE
WHERE MonthlyRevenue > 50000
ORDER BY SalesMonth ASC;
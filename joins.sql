SELECT 
    o.OrderID, 
    o.OrderDate, 
    c.CompanyName AS CustomerName, 
    p.ProductName, 
    od.UnitPrice, 
    od.Quantity
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
LIMIT 10;
-- BEFORE (Slow Correlated Subquery): 
-- The database engine has to run the inner query for EVERY single row in the outer query.
SELECT p.ProductID, p.ProductName, p.SupplierID,
       (SELECT s.CompanyName FROM Suppliers s WHERE s.SupplierID = p.SupplierID) AS SupplierName
FROM Products p;

-- AFTER (Optimized with an INNER JOIN):
-- The database matches the sets instantly in a single scan.
SELECT p.ProductID, p.ProductName, p.SupplierID, s.CompanyName AS SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
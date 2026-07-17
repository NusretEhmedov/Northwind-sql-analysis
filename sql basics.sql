-- Question 1: Find all products with a unit price strictly greater than $50
SELECT ProductID, ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice > 50 
ORDER BY UnitPrice DESC;

-- Question 2: Find the top 5 most expensive orders by freight cost
SELECT OrderID, CustomerID, Freight 
FROM Orders 
ORDER BY Freight DESC 
LIMIT 5;

-- Question 3: Find discontinued products that still have units in stock
SELECT ProductID, ProductName, UnitsInStock 
FROM Products 
WHERE Discontinued = 1 AND UnitsInStock > 0;

-- Question 4: Find employees hired after 1993 located in London
SELECT EmployeeID, FirstName, LastName, HireDate, City 
FROM Employees 
WHERE HireDate > '1993-12-31' AND City = 'London';

-- Question 5 (The NULL/Calculation Trick): Find items where the Region is missing (NULL)
SELECT CustomerID, CompanyName, Country, Region 
FROM Customers 
WHERE Region IS NULL 
LIMIT 5;
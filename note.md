# Technical Notes & Assignment Reflections (Week 1)

## 📌 Checkpoint Deep Dives & Explanations

### 1. Handling NULL Values (Checkpoint 1)
During extraction, we isolated clients lacking regional identifiers via `WHERE Region IS NULL`. In data analysis, evaluating `NULL` values requires specific operators (`IS NULL` / `IS NOT NULL`) because standard mathematical operators (like `= NULL`) evaluate as unknown. Furthermore, understanding that functions like `AVG()` systematically ignore missing values prevents skewed metric averages during large dataset calculations.

### 2. Defeating the "Fan-Out Trick" (Checkpoint 3)
*   **The Trap:** If you join a one-to-many relationship (such as joining the `Orders` table to the `Order Details` table) and carelessly apply a blanket `SUM(o.Freight)` without a distinct grouping constraint, the relational database engine inflates the totals. The shipping cost of a single order will get added up repeatedly for every separate item line in that order.
*   **The Fix:** In this project, financials were aggregated using localized line-item values (`od.UnitPrice * od.Quantity`) rather than parent metadata fields, ensuring our "Top 5 Customers by Revenue" dataset matched reality perfectly.

### 3. Window Functions vs. GROUP BY (Checkpoint 5)
While standard aggregations collapse our rows into single summary points, window functions via the `OVER()` clause allowed us to calculate running data sums synchronously alongside individual transactional lines. This project calculates a live financial running log using:
`SUM(Freight) OVER (ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`

### 4. Query Optimization & Indexing (Checkpoint 6)

#### Correlated Subquery vs. INNER JOIN
*   **Problem:** Correlated subqueries pass parameters dynamically from the outer table down into an inner select statement. This means the engine must re-execute the inner lookup loop sequentially for every single row parsed.
*   **Solution:** By transforming this query into a flat `INNER JOIN`, the SQL engine evaluates both tables as parallel sets, matching IDs all at once in memory and drastically lowering computation time.

#### The Role of Database Indices
Creating an optimization index (e.g., `CREATE INDEX idx_customers_city ON Customers(City);`) constructs a structured, sorted pointer tree behind the scenes. Instead of forcing a slow "Full Table Scan" where the computer checks every customer row one by one, the index lets the application look up specific string values instantly, lowering query execution times from linear scales down to logarithmic steps.

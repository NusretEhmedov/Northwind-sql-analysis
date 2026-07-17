# Northwind Relational Database Analytics — Week 1 Portfolio

This repository contains my portfolio submission for the Week 1 Data Analytics assignment: **From SQL Basics to Advanced**. The queries are written in ANSI SQL, structured, and tested using DB Browser for SQLite on the classic enterprise `Northwind` sample database schema.

## 📁 Repository Directory Structure
*   `queries.sql` - Comprehensive SQL script containing all database code organized by checkpoints.
*   `northwind_analysis.xlsx` - Excel workbook containing exported data extractions and formatted outputs.
*   `note.md` - Technical commentary, checkpoint reflections, and analytical challenge write-ups.

---

## 🚀 Submission Checkpoints Summary

### Checkpoint 1: Basic SELECT / WHERE / ORDER BY / LIMIT
*   **Objective:** Filter, sort, and isolate granular datasets.
*   **Key Insight:** Handled specific data questions including a missing data pattern scan where `Region IS NULL`, demonstrating the structural rule that arithmetic and aggregations require explicit syntax shifts when encountering missing attributes.

### Checkpoint 2: Multi-Table Joins (3+ Tables)
*   **Objective:** Flatten normalized transactional tables into meaningful business data.
*   **Key Insight:** Combined `Orders`, `Customers`, and `[Order Details]` alongside `Products` to create a continuous view tracking individual order item lines back to localized customer entities.

### Checkpoint 3: Aggregation with GROUP BY / HAVING (Mitigating Fan-out)
*   **Objective:** Identify top metrics without duplicating operational metrics.
*   **Key Insight:** Successfully bypassed the **"Fan-out trick"**. Instead of prematurely aggregating table-level fields (like summing `Freight` across high-cardinality item rows), line-item math (`UnitPrice * Quantity * (1 - Discount)`) was calculated explicitly inside a single grouped context to guarantee perfectly accurate revenue tracking.

### Checkpoint 4: Subqueries and Common Table Expressions (CTEs)
*   **Objective:** Isolate multi-step staging calculations.
*   **Key Insight:** Used a `WITH` block statement (`MonthlySalesCTE`) to pre-aggregate sales by calendar months before evaluating performance parameters globally.

### Checkpoint 5: Advanced Window Functions
*   **Objective:** Perform analytical calculations while maintaining row granularity.
*   **Key Insight:** Leveraged `ROW_NUMBER()`, partitioned item categorization via `RANK()`, and calculated a dynamic running warehouse total using `SUM(Freight) OVER (ORDER BY OrderDate)`.

### Checkpoint 6: Query Optimization & Refactoring
*   **Objective:** Convert costly table scans to indexed and set-based architectures.
*   **Key Insight:** Refactored a heavy, row-by-row Correlated Subquery into a high-speed relational `INNER JOIN` step. 

---

## 🛠️ Tech Stack & Implementation Details
*   **Database Engine:** SQLite (DB Browser Engine)
*   **Spreadsheet Processor:** Microsoft Excel (`.xlsx`)
*   **Syntax Standard:** ANSI SQL (PostgreSQL/MySQL ready)

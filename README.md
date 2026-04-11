
# 📘 PostgreSQL Learning Notes

This repository contains my learning journey in **PostgreSQL**, organized into structured sections.
Each section is stored as a separate file in VS Code with queries and notes.

---

## 📂 Sections Overview

### 🟢 Section 1: Basics

* Creating databases
* Viewing databases
* Connecting using psql
* Basic psql commands

---

### 🔵 Section 2: CRUD Operations

* Creating tables
* Inserting data
* Reading data (SELECT)
* Updating records
* Deleting records

---

### 🟣 Section 3: Data Types & Constraints

* Numeric, String, Date, Boolean types
* PRIMARY KEY
* NOT NULL
* DEFAULT
* UNIQUE
* SERIAL (auto-increment)

---

### 🟠 Section 4: WHERE Clause & Filtering

* WHERE conditions
* AND / OR operators
* Comparison operators
* IN / NOT IN
* DISTINCT
* ORDER BY (sorting)
* LIMIT
* LIKE (pattern matching)

---

### 🟡 Section 5: Aggregate Functions

* COUNT(), SUM(), AVG()
* MIN(), MAX()
* GROUP BY

---

### 🟤 Section 6: String Functions

* CONCAT, CONCAT_WS
* SUBSTRING
* REPLACE
* LENGTH
* UPPER / LOWER
* TRIM
* LEFT / RIGHT
* POSITION

---

### ⚫ Section 7: Altering Tables & Constraints

* ALTER TABLE
* Add / Drop columns
* Rename table & columns
* Modify column properties
* CHECK constraints

---

### 🔴 Section 8: Relationships & Joins

* Types of relationships:

  * One-to-One
  * One-to-Many
  * Many-to-Many
* Concept of Foreign Key
* Database normalization basics
* Creating related tables (customers, orders)
* JOIN operations:

  * CROSS JOIN
  * INNER JOIN
  * LEFT JOIN
  * RIGHT JOIN
* Real-world examples:

  * Customer-Orders relationship
  * Student-Course enrollment system

---

### 🟣 Section 9: Advanced Relationships & Views

* Designing real-world schema:

  * Customers, Orders, Products, Order_Items
* One-to-Many and Many-to-Many combined
* Multi-table JOIN queries
* Calculating derived values (billing system)
* Creating and using VIEWS
* Benefits of views (query reuse, readability)

---

### 🟢 Section 10: Stored Routines, CTE & Window Functions

* Stored Procedures

  * Creating procedures
  * Parameters and execution (CALL)
* User Defined Functions (UDFs)

  * Returning values
  * Usage in SELECT
* Difference between Functions vs Procedures
* Window Functions:

  * OVER() clause
  * PARTITION BY
  * ORDER BY
  * ROW_NUMBER(), RANK(), DENSE_RANK()
  * LAG(), LEAD()
  * Running totals
* Common Table Expressions (CTE):

  * Basic CTE
  * Multiple CTEs
  * Recursive CTE
* Use cases:

  * Ranking
  * Analytics queries
  * Hierarchical data

---

## 🛠️ Tools Used

* PostgreSQL (psql)
* VS Code





# Library-Management-SQL-Project
# 📚 Library Management SQL Project

## 📌 Overview
This project is a **Library Management System** built entirely with SQL.  
It manages **books, members, employees, branches, and transactions**, and provides various queries, reports, and stored procedures for analysis and automation.

---

## 🎯 Features

### 1. Data Manipulation
- **Insert new books** into the system.
- **Update member details** (e.g., addresses).
- **Delete issued records**.
- **Update book availability status** upon return.

### 2. Queries & Reports
- Books issued by specific employees.
- Members who issued more than one book.
- Total rental income by category.
- Members registered in the last 180 days.
- Employees with branch and manager details.
- Overdue book detection (30+ days).
- Branch performance report (books issued, returned, revenue).

### 3. CTAS (Create Table As Select)
- `ISSUED_BOOKS_NO` → summary of total books issued by title.
- `BOOKS_UPOVE_7` → books with higher rental thresholds.
- `Active_Members` → members with at least one issue in the last 6 months.

### 4. Stored Procedure
- `issue_book` → Manages book issuance:
  - Marks a book as **unavailable** when issued.
  - Inserts issuance record.
  - Prevents issuing if the book is already unavailable.

---

## 📂 Tables Involved
- **books** → Stores book details and availability.
- **members** → Contains library members’ info.
- **employees** → Employee details including branch assignment.
- **branch** → Branch details and managers.
- **issued_status** → Tracks issued books.
- **return_status** → Tracks returned books.

---

## 🛠 SQL Features Covered
- **DDL** (CREATE, ALTER, DROP)
- **DML** (INSERT, UPDATE, DELETE)
- **JOINS** (INNER JOIN, LEFT JOIN)
- **AGGREGATIONS** (COUNT, SUM, GROUP BY, HAVING)
- **WINDOW FUNCTIONS** (ROW_NUMBER, PARTITION BY)
- **CTAS (Create Table As Select)**
- **Stored Procedures**
- **Conditional Logic**

---

## 🚀 How to Use
1. Create the database schema (tables).
2. Insert sample data for books, members, employees, branches.
3. Run the SQL scripts task by task:
   - Tasks 1–5 → CRUD operations.
   - Tasks 6–12 → Analysis queries and CTAS.
   - Tasks 13–17 → Advanced reporting and performance.
   - Task 19 → Stored procedure for issuing books.
4. Query results to generate **library performance reports**.

---

## 📊 Example Reports
- **Top 3 Employees** by number of books processed.
- **Branch Revenue Report** including books issued/returned.
- **Overdue Members** with days overdue.
- **Active Members** within last 6 months.

---

## 👨‍💻 Author
Developed by **Omar Yaser** as part of SQL practice for **data management & analysis**.


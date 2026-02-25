# Project Structure - CSV Files & Solution Files

---

## 📊 CSV FILES STRUCTURE

### 1. **books.csv** (37 rows)
**Columns**: 7  
**Primary Key**: isbn

```
Header: isbn | book_title | category | rental_price | status | author | publisher
```

| Column | Type | Example |
|--------|------|---------|
| isbn | VARCHAR | "978-0-553-29698-2" |
| book_title | VARCHAR | "The Catcher in the Rye" |
| category | VARCHAR | "Classic", "Fantasy", "History", "Dystopian" |
| rental_price | DECIMAL | "7.00", "5.50", "2.50" |
| status | VARCHAR | "yes" / "no" |
| author | VARCHAR | "J.D. Salinger", "George Orwell" |
| publisher | VARCHAR | "Penguin Books", "Doubleday" |

**Sample Data** (first 3 rows):
```csv
978-0-553-29698-2,The Catcher in the Rye,Classic,7.00,yes,J.D. Salinger,Little, Brown and Company
978-0-330-25864-8,Animal Farm,Classic,5.50,yes,George Orwell,Penguin Books
978-0-14-118776-1,One Hundred Years of Solitude,Literary Fiction,6.50,yes,Gabriel Garcia Marquez,Penguin Books
```

---

### 2. **branch.csv** (5 rows)
**Columns**: 4  
**Primary Key**: branch_id

```
Header: branch_id | manager_id | branch_address | contact_no
```

| Column | Type | Example |
|--------|------|---------|
| branch_id | VARCHAR | "B001", "B002", "B003", "B004", "B005" |
| manager_id | VARCHAR | "E109", "E110" |
| branch_address | VARCHAR | "123 Main St", "456 Elm St" |
| contact_no | VARCHAR | "+919099988676" |

**Complete Data**:
```csv
B001,E109,123 Main St,+919099988676
B002,E109,456 Elm St,+919099988677
B003,E109,789 Oak St,+919099988678
B004,E110,567 Pine St,+919099988679
B005,E110,890 Maple St,+919099988680
```

---

### 3. **employees.csv** (11 rows)
**Columns**: 5  
**Primary Key**: emp_id

```
Header: emp_id | emp_name | position | salary | branch_id
```

| Column | Type | Example |
|--------|------|---------|
| emp_id | VARCHAR | "E101", "E102", ..., "E111" |
| emp_name | VARCHAR | "John Doe", "Jane Smith" |
| position | VARCHAR | "Clerk", "Manager", "Librarian", "Assistant" |
| salary | DECIMAL | "60000.00", "45000.00" |
| branch_id | VARCHAR | "B001", "B002", "B003", "B004", "B005" |

**Sample Data** (first 3 rows):
```csv
E101,John Doe,Clerk,60000.00,B001
E102,Jane Smith,Clerk,45000.00,B002
E103,Mike Johnson,Librarian,55000.00,B001
```

---

### 4. **members.csv** (12 rows)
**Columns**: 4  
**Primary Key**: member_id

```
Header: member_id | member_name | member_address | reg_date
```

| Column | Type | Example |
|--------|------|---------|
| member_id | VARCHAR | "C101", "C102", ..., "C119" |
| member_name | VARCHAR | "Alice Johnson", "Bob Smith" |
| member_address | VARCHAR | "123 Main St", "456 Elm St" |
| reg_date | DATE | "2021-05-15", "2024-06-01" |

**Sample Data** (first 3 rows):
```csv
C101,Alice Johnson,123 Main St,2021-05-15
C102,Bob Smith,456 Elm St,2021-06-20
C103,Carol Davis,789 Oak St,2021-07-10
```

---

### 5. **issued_status.csv** (37+ rows)
**Columns**: 6  
**Primary Key**: issued_id

```
Header: issued_id | issued_member_id | issued_book_name | issued_date | issued_book_isbn | issued_emp_id
```

| Column | Type | Example |
|--------|------|---------|
| issued_id | VARCHAR | "IS106", "IS107", ..., "IS140" |
| issued_member_id | VARCHAR | "C106", "C107" |
| issued_book_name | VARCHAR | "Animal Farm", "The Great Gatsby" |
| issued_date | DATE | "2024-03-10", "2024-03-11" |
| issued_book_isbn | VARCHAR | "978-0-330-25864-8" |
| issued_emp_id | VARCHAR | "E104", "E105", "E106" |

**Sample Data** (first 3 rows):
```csv
IS106,C106,Animal Farm,2024-03-10,978-0-330-25864-8,E104
IS107,C107,One Hundred Years of Solitude,2024-03-11,978-0-14-118776-1,E104
IS108,C108,The Great Gatsby,2024-03-12,978-0-525-47535-5,E104
```

---

### 6. **return_status.csv** (20 rows)
**Columns**: 5  
**Primary Key**: return_id

```
Header: return_id | issued_id | return_book_name | return_date | return_book_isbn
```

| Column | Type | Example |
|--------|------|---------|
| return_id | VARCHAR | "RS101", "RS102", ..., "RS118" |
| issued_id | VARCHAR | "IS101", "IS105" |
| return_book_name | VARCHAR | NULL (empty in many records) |
| return_date | DATE | "2023-06-06", "2024-05-01" |
| return_book_isbn | VARCHAR | NULL (empty in many records) |

**Sample Data** (first 3 rows):
```csv
RS101,IS101,NULL,2023-06-06,NULL
RS102,IS105,NULL,2023-06-07,NULL
RS103,IS103,NULL,2023-08-07,NULL
```

---

## 📄 SOLUTION SQL FILES STRUCTURE

### 1. **solution day 1.sql** (~155 lines)

**Tasks Covered**: 1-12

```
SECTION 1: View All Tables
├─ SELECT * FROM books
├─ SELECT * FROM branch
├─ SELECT * FROM employees
├─ SELECT * FROM issued_status
├─ SELECT * FROM return_status
└─ SELECT * FROM members

SECTION 2: Project Tasks (1-12)
├─ Task 1: INSERT new book
├─ Task 2: UPDATE member address
├─ Task 3: DELETE from issued_status
├─ Task 4: SELECT books by employee
├─ Task 5: GROUP BY members with multiple issues
├─ Task 6: CTAS - Create book_cnts table
├─ Task 7: SELECT books by category
├─ Task 8: Aggregate rental income by category
├─ Task 9: SELECT members from last 180 days
├─ Task 10: Employee-Manager relationship JOIN
├─ Task 11: CREATE books_price_greater_than_seven table
└─ Task 12: SELECT unreturned books (LEFT JOIN)
```

**Key Queries**:
- CRUD operations (INSERT, UPDATE, DELETE, SELECT)
- JOIN operations
- GROUP BY with HAVING
- CTAS (CREATE TABLE AS SELECT)
- LEFT JOIN for unreturned books

**Special Features**:
- Uses PostgreSQL syntax (CURRENT_DATE - INTERVAL)
- Creates 2 working tables (book_cnts, books_price_greater_than_seven)
- Adds new members (C118, C119) with INSERT

---

### 2. **lms_project_advanced_solution_2.sql** (~295 lines)

**Tasks Covered**: 13-20

```
SECTION 1: View All Tables (initial SELECT *)

SECTION 2: Advanced Tasks (13-20)
├─ Task 13: Identify Members with Overdue Books
│           └─ Multi-join query (4 tables)
│           └─ Date calculation: CURRENT_DATE - issued_date > 30
│
├─ Task 14: Update Book Status on Return
│           └─ UPDATE query with WHERE clause
│           └─ INSERT new return record
│
├─ Task 15: Branch Performance Report
│           └─ CTAS: CREATE TABLE branch_reports
│           └─ Complex aggregation with GROUP BY
│           └─ Counts and SUM operations
│
├─ Task 16: CTAS - Create Active Members Table
│           └─ Filters: last 2 months (INTERVAL)
│           └─ Uses subquery with IN clause
│
├─ Task 17: Top 3 Employees by Book Issues
│           └─ Multi-join (3 tables: employees, branch, issued_status)
│           └─ COUNT aggregation with GROUP BY
│
└─ Tasks 19-20: STORED PROCEDURES
            ├─ Procedure 1: add_return_records
            │   └─ Takes: return_id, issued_id, book_quality
            │   └─ Updates: book status to 'yes'
            │   └─ Called with CALL statement
            │
            └─ Procedure 2: issue_book
                ├─ Takes: issued_id, member_id, isbn, emp_id
                ├─ Checks: IF book status = 'yes'
                ├─ If available: INSERT into issued_status, UPDATE status to 'no'
                └─ If unavailable: RAISE NOTICE error message
```

**Key Queries**:
- Date calculations (CURRENT_DATE, INTERVAL)
- Multi-table joins (4+ tables)
- Stored procedures with PL/pgSQL
- IF/ELSE conditional logic
- RAISE NOTICE for error handling
- CTAS for creating summary tables
- COUNT and SUM aggregations

**Special Features**:
- Creates 2 new tables (branch_reports, active_members)
- Implements 2 stored procedures for automation
- Uses PL/pgSQL procedural SQL
- Demonstrates error handling
- Tests procedures with CALL statements
- Shows DECLARE variables and INTO assignments

---

## 📋 Summary Statistics

| Item | Count |
|------|-------|
| CSV Files | 6 |
| Total CSV Records | 112+ |
| SQL Solution Files | 2 |
| Total Tasks | 20 (Tasks 1-12 + Tasks 13-20) |
| Tables Created | 6 core + 5 working/summary |
| Stored Procedures | 2 |
| SELECT Statements | 40+ queries |

---

## 🔗 Relationships

```
BOOKS ←──────┐
             ├─→ ISSUED_STATUS ←──────┐
MEMBERS ────→┤                        ├─→ RETURN_STATUS
             ├─→ EMPLOYEES ←──→ BRANCH
             └────────────────────────┘
```

**Key Links**:
- books.isbn ← issued_status.issued_book_isbn
- members.member_id ← issued_status.issued_member_id
- employees.emp_id ← issued_status.issued_emp_id
- issued_status.issued_id → return_status.issued_id
- employees.branch_id → branch.branch_id
- branch.manager_id → employees.emp_id


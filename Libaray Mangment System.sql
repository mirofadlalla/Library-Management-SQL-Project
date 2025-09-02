Select * from branch

Select * from employees

select * from employees as e Inner join branch as b
On e.emp_id = b.manager_id

select * from members

select * from issued_status

select * from return_status


Alter table issued_status
drop constraint FK_issued_status_books



-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

SELECT * FROM books

INSERT INTO books
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 1, 'Harper Lee', 'J.B. Lippincott & Co.')

-- Task 2: Update an Existing Member's Address

SELECT * FROM members

UPDATE members
SET member_address = 'BESHLA METGAMR , DAKAHLIYA'
WHERE member_id = 'C101'

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

SELECT * FROM issued_status

DELETE FROM issued_status
WHERE issued_id = 'IS104'

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM employees
SELECT * FROM issued_status
SELECT * FROM books

SELECT book_title  , issued_emp_id ,issued_book_name 
FROM issued_status as i , books as b
where issued_emp_id = '101' 
And i.issued_book_isbn = b.isbn



-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT * FROM issued_status
select * from employees

SELECT COUNT(issued_id) as 'Issued More Than One Book' , emp_name
FROM issued_status AS I INNER JOIN employees AS E
ON I.issued_emp_id = E.emp_id
group by issued_emp_id  , emp_name
having COUNT(issued_id) > 1


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

SELECT * FROM BOOKS
SELECT * FROM issued_status

CREATE TABLE ISSUED_BOOKS_NO AS
	SELECT COUNT(issued_id) AS TOTAL_PURSHED , issued_book_name 
	FROM issued_status 
	GROUP BY issued_book_name

-- QUERY UPOVE THGERE WON'T WOTK IN SQL HERE WE SHOULD CRAETE THE TABLE FIRST THE INSTER DATA INTO IT USING SELECT

CREATE TABLE ISSUED_BOOKS_NO(
	issued_book_name VARCHAR(500) ,
	TOTAL_PURSHED INT
)

--DROP TABLE ISSUED_BOOKS_NO

INSERT INTO ISSUED_BOOKS_NO(issued_book_name,TOTAL_PURSHED)
	SELECT issued_book_name , COUNT(issued_id) AS TOTAL_PURSHED
	FROM issued_status 
	GROUP BY issued_book_name


	

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

	SELECT * FROM books 
	WHERE category = 'CLASSIC'


-- Task 8: Find Total Rental Income by Category:
	SELECT CAST(SUM(rental_price) AS decimal(10,2)) AS TOTAL_INCOME , category  
	FROM books
	GROUP BY category
	ORDER  BY SUM(rental_price) DESC

-- Task 9. **List Members Who Registered in the Last 180 Days**:

	SELECT * FROM members
	SELECT 
		member_id ,
		DATEDIFF(DAY, reg_date, (SELECT MAX(reg_date) FROM members)) AS days_from_latest
	FROM members
	WHERE DATEDIFF(DAY, reg_date, (SELECT MAX(reg_date) FROM members)) <= 180

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

	SELECT TOP 5 * FROM employees
	SELECT TOP 5 * FROM branch 

	SELECT e.emp_id,
    e.emp_name,
    e.position,
    e.salary,
    e.branch_id,
    b.branch_address,
    b.contact_no,
    m.emp_name AS manager_name
	FROM employees e
	INNER JOIN branch b
	ON b.branch_id = e.branch_id
	INNER JOIN employees m 
	ON b.manager_id = m.emp_id
	where e.position != 'Manager'




-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
	SELECT * FROM BOOKS
	CREATE TABLE BOOKS_UPOVE_7(
		isbn VARCHAR(500) , 
		BOOK_TITLE VARCHAR(500) ,
		BOOK_NAME VARCHAR(500)
)

--DROP TABLE BOOKS_UPOVE_7

INSERT INTO BOOKS_UPOVE_7 
SELECT B.isbn , B.book_title ,I.issued_book_name FROM BOOKS AS B
INNER JOIN issued_status AS  I
ON B.isbn = I.issued_book_isbn

SELECT * FROM BOOKS_UPOVE_7

-- Task 12: Retrieve the List of Books Not Yet Returned
SELECT * FROM return_status

SELECT * FROM issued_status

SELECT I.issued_id , I.issued_book_name 
FROM issued_status AS I 
LEFT JOIN return_status AS R
ON I.issued_id = R.issued_id
WHERE return_id IS NULL


-- Advanced SQL Operations
/*
Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period).
Display the member's name, book title, issue date, and days overdue.
*/

SELECT TOP 2 * FROM return_status
SELECT TOP 2 * FROM issued_status
SELECT TOP 2 * FROM members

SELECT M.member_id , M.member_name ,
I.issued_id , I.issued_book_name , I.issued_date ,
R.return_id , R.return_date , 
DATEDIFF(DAY, I.issued_date, R.return_date) AS overdue_books
FROM members AS M 
INNER JOIN issued_status AS I
ON M.member_id = I.issued_member_id
INNER JOIN  return_status AS R 
ON I.issued_id = R.issued_id
WHERE DATEDIFF(DAY, I.issued_date, R.return_date) > 30




/*
Task 14: Update Book Status on Return
Write a query to update the status of books in the books table 
to "available" when they are returned (based on entries in the return_status table).
*/

SELECT TOP 2 * FROM return_status
SELECT TOP 2 * FROM issued_status
SELECT TOP 2 * FROM books

UPDATE books
SET books.status = '1'
FROM books AS b 
INNER JOIN issued_status AS I
ON b.isbn = I.issued_book_isbn
INNER JOIN  return_status AS R 
ON I.issued_id = R.issued_id 


/*

Task 15: Branch Performance Report
Create a query that generates a performance report for each branch,
showing the number of books issued, the number of books returned,
and the total revenue generated from book rentals.
*/

SELECT TOP 2 * FROM branch
SELECT TOP 2 *  FROM employees
SELECT TOP 2 *  FROM issued_status
SELECT TOP 2 *  FROM return_status
SELECT TOP 2 * FROM books

SELECT B.branch_id , COUNT(I.issued_id) AS number_of_books_issued  , 
COUNT(R.return_id) AS number_of_books_returned , 
CAST(SUM(BOK.rental_price) AS DECIMAL(10,2) )AS total_revenue
FROM branch AS B
INNER JOIN employees AS E
ON B.branch_id = E.branch_id
INNER JOIN issued_status AS I
ON E.emp_id = I.issued_emp_id
LEFT JOIN return_status AS R
ON I.issued_id = R.issued_id
INNER JOIN books AS BOK
ON I.issued_book_isbn = BOK.isbn
GROUP BY B.branch_id


/*
Task 16: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members 
containing members who have issued at least one book in the last 6 months.
*/

CREATE TABLE Active_Members(
	
	member_name varchar(500) ,
	TIME_SICE_LAST_BOOK_ISUUED int
)

SELECT * FROM issued_status

SELECT TOP 2 * FROM members
SELECT MAX(issued_date) FROM issued_status

INSERT INTO Active_Members(member_name , TIME_SICE_LAST_BOOK_ISUUED)
SELECT M.member_name ,
DATEDIFF(MONTH, I.issued_date, (SELECT MAX(issued_date) FROM issued_status)) AS TIME_SICE_LAST_BOOK_ISUUED
FROM members AS M
INNER JOIN issued_status AS I
ON M.member_id = I.issued_member_id
WHERE DATEDIFF(MONTH, I.issued_date, (SELECT MAX(issued_date) FROM issued_status)) <= 6


/*
Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. 
Display the employee name, number of books processed, and their branch.
*/


SELECT TOP 2 * FROM branch
SELECT TOP 2 * FROM employees
SELECT TOP 2 * FROM issued_status

SELECT TOP 3
E.emp_name , E.branch_id , COUNT(I.issued_member_id) AS number_of_books_processed
FROM employees AS E
INNER JOIN issued_status AS I
ON E.emp_id = I.issued_emp_id
GROUP BY I.issued_emp_id ,E.emp_name , E.branch_id
ORDER BY COUNT(I.issued_member_id) DESC

WITH RankedEmployees AS (
    SELECT 
        E.emp_name,
        E.branch_id,
        COUNT(I.issued_member_id) AS number_of_books_processed,
        ROW_NUMBER() OVER (ORDER BY COUNT(I.issued_member_id) DESC) AS rn
    FROM employees AS E
    INNER JOIN issued_status AS I ON E.emp_id = I.issued_emp_id
    GROUP BY I.issued_emp_id, E.emp_name, E.branch_id
)
SELECT *
FROM RankedEmployees
WHERE rn <= 3;


SELECT DISTINCT
    E.emp_name,
    E.branch_id,
    COUNT(I.issued_member_id) OVER(PARTITION BY I.issued_emp_id) AS number_of_books_processed
FROM employees AS E
INNER JOIN issued_status AS I ON E.emp_id = I.issued_emp_id;


/*
Task 19: Stored Procedure
Objective: Create a stored procedure to manage the status of books in a library system.
    Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    If a book is issued, the status should change to 'no'.
    If a book is returned, the status should change to 'yes'.
*/

CREATE PROCEDURE issue_book
    @p_issued_id VARCHAR(10),
    @p_issued_member_id VARCHAR(30),
    @p_issued_book_isbn VARCHAR(30),
    @p_issued_emp_id VARCHAR(10)
AS
BEGIN
    DECLARE @v_status VARCHAR(10);


    SELECT @v_status = status
    FROM books
    WHERE isbn = @p_issued_book_isbn;

    IF @v_status = 'yes'
    BEGIN
     
        INSERT INTO issued_status (issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
        VALUES (@p_issued_id, @p_issued_member_id, GETDATE(), @p_issued_book_isbn, @p_issued_emp_id);


        UPDATE books
        SET status = 'no'
        WHERE isbn = @p_issued_book_isbn;

        PRINT 'Book records added successfully for book isbn: ' + @p_issued_book_isbn;
    END
    ELSE
    BEGIN
        PRINT 'Sorry to inform you the book you have requested is unavailable. Book ISBN: ' + @p_issued_book_isbn;
    END
END;

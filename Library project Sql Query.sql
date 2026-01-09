select * from books;
select * from branch;
select * from members;
select * from issued_status;
select * from return_status;
select * from employes;
-- project task--
-- Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address**
update members
set member_address = '125 Main st'
where member_id = 'C101';
select * from members; 

-- Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
delete  from issued_status
where issued_id = 'IS121'

-- Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
select issued_book_name
from issued_status
where issued_emp_id ='E101';

-- Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.
select
issued_emp_id,
count(issued_id) as total_book_issued
from issued_status
Group by issued_emp_id
having count(issued_id)>1
-- CTAS ---
-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
create table book_issue_summary as
Select
   issued_book_name,
   COUNT(*) as total_book_issued_cnt
from issued_status
group by issued_book_name;
select* from book_issue_summary

-- Task 7. **Retrieve All Books in a Specific Category**:
select* from books
where category ='classic';

 -- Task 8: Find Total Rental Income by Category**:
 select 
 category,
 sum(rental_price)as total_rental_income
 from books
 group by category;





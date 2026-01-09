-- create database library_project
-- Library management system project --
-- use library_project
-- Creating branch table --
create table branch (
branch_id varchar(10) primary key ,
manager_id varchar(10) ,
branch_address varChar(55),
contact_no varchar(10)
); 
alter table branch
modify contact_no  varchar(20);

-- Creating employes table --
create table employes(
emp_id	varchar(10) primary key,
emp_name varchar(25),
position varchar(15),	
salary int,
branch_id varchar(25)
);
-- Creating book table --
create table books(
isbn	 varchar(20) primary key,
book_title	 varchar(75),
category	 varchar(10),
rental_price float,
status	 varchar(10),
author	 varchar(35),
publisher  varchar(55)
);
alter table books
modify category varchar(20)
-- creating member table --

create table members(
member_id varchar(20) primary key,	
member_name	varchar(25),
member_address	varchar(75),
reg_date date
);
-- creating issued_status table --
create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(10),	
issued_book_name varchar(75),	
issued_date	date,
issued_book_isbn varchar(25),	
issued_emp_id varchar(10)
);
-- creating return table --
create table return_status(
    return_id varchar(10) primary key,
	issued_id varchar(10),
	return_book_name varchar(75),
	return_date	date,
    return_book_isbn varchar(20)
);
alter table issued_status
Add constraint fk_members
foreign key(issued_member_id)
references members(member_id);

alter table issued_status
Add constraint fk_books
foreign key(issued_book_isbn)
references books(isbn);

alter table issued_status
Add constraint fk_employes
foreign key(issued_emp_id)
references employes(emp_id);

alter table employes
Add constraint fk_branch
foreign key(branch_id)
references branch(branch_id);

alter table return_status
Add constraint fk_issued_status
foreign key(issued_id)
references issued_status(issued_id);



 
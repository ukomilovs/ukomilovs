lesson 2 homework
--Basic-Level Tasks

--creating table Employees
create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2))

--inserting 3 records using single/multiple row INSERT
insert into Employees values (01, 'akmal', 780.20)
insert into Employees values 
(02, 'abror', 230.80),
(03, 'feruz', 970.50)

--updating Salary of EmpId=1 to 7000
update Employees
set Salary = 7000
where EmpID=1

--deleting a record
delete from Employees 
where EmpID=2

/*
DELETE --> deletes a single row in table
TRUNCATE --> deletes the entire row but keeps the structure of table
DROP --> deletes the entire table 
*/

--changing datatype to varchar(100)
alter table Employees
alter Column Name Varchar(100)

--adding new column Department
alter table Employees
add Department varchar(50)

--changing datatype of Salary to float
alter table Employees
alter column Salary float

--creating another table Departments
create table Departments (DepartmentID int primary key, DepartmentName varchar(50))

--removing table without its structure
truncate table Employees

--Intermediate-Level Tasks

--inserting 5 records using INSERT INTO SELECT
insert into Departments
select 1, 'sales'
union all
select 2, 'HR'
union all
select 3, 'Accounting'
union all
select 4, 'SMM'
union all
select 5, 'Security'

--updating
update Employees
set Department = 'Management'
where Salary>5000

--a query that removes all employees but keeps the table structure intact
truncate table Employees 

--removing column department
alter table Employees
drop column department

--renaming 
exec sys.sp_rename 'Employees', 'StaffMembers'

--completely removing Departments table
drop table Departments

select * from Departments
select * from StaffMembers

--Advanced-Level Tasks

--creating table Products
create table Products (
ProductID int primary key, 
ProductName varchar(30), 
Category varchar(30), 
Price decimal(10,2)
)

--adding the constraint CHECK 
ALTER TABLE Products
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);
  
--adding StockQuantity column with default value
alter table Products
add StockQuantity int default 50

--renaming Category to ProductCategory
exec sys.sp_rename 'Products.Category', 'ProductCategory', 'column'

--inserting 5 records
insert into Products (ProductID, ProductName, ProductCategory, Price) values 
(1, 'jacobs', 'coffee', 5700),
(2, 'jumbo', 'chocolate', 3200),
(3, 'flash', 'energetic', 6800),
(4, 'trash', 'energetic', 3800),
(5, 'mars', 'chocolate', 7800);

--creating a backup table using SELECT INTO
select * into Products_Backup
from Products

--renaming Products table to Inventory
exec sys.sp_rename 'Products', 'Inventory' 



--finding constraint
SELECT 
OBJECT_NAME(parent_object_id) AS TableName,
name AS ConstraintName,
definition
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('Inventory');

--removing contraint
alter table Inventory
drop constraint CK__Products__Price__47DBAE45

--altering data type to float
alter table Inventory
alter column Price float

--adding identity column with increments
alter table Inventory
add ProductCode int identity(1000,5);

--adding constraint
alter table Inventory
add constraint chk_price check (Price>0)

select * from Inventory

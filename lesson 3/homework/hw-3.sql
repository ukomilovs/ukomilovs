Lesson 3 homework
 
--Easy-Level Tasks


1. Define and explain the purpose of BULK INSERT in SQL Server.
/*
BULK INSERT is a command in SQL Server used to import large volumes of data from a text file (e.g., CSV or TXT) directly into a SQL Server table.
THE synthax is below

BULK INSERT TableName
FROM 'C:\Path\To\File.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
*/ 
2.List four file formats that can be imported into SQL Server. 
  Here are four file formats that can be imported into SQL Server:
--CSV (Comma-Separated Values)
Most common format for data import/export.
Each line represents a row, and values are separated by commas.
Supported by tools like BULK INSERT, bcp, and SQL Server Import Wizard.

-- TXT (Plain Text Files)
Data is usually delimited by tabs or custom characters.
Also supported by BULK INSERT, bcp, and SSIS.
Flexible for structured flat-file data.

--Excel Files (.xls, .xlsx)
Used for importing structured data from Excel spreadsheets.
Requires using OPENROWSET, Linked Servers, or the Import Wizard.
May need installation of Microsoft Access Database Engine OLE DB provider.

-- XML Files
Hierarchical data format, often used in web services or data exchange.
Can be imported using OPENXML, XML data type, or SSIS.
SQL Server can parse XML directly using XPath/XQuery.


3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
  
create table Products (
ProductID int primary key, 
ProductName varchar(50),
Price decimal(10,2)
)

4. Insert three records into the Products table using INSERT INTO.
insert into Products values 
(101, 'flash', 8000),
(102, 'flush', 7000),
(103, 'trash', 6500)

5. Explain the difference between NULL and NOT NULL.
/*
difference between NULL and NOT NULL
NULL--> means no value, column can be empty, it does not require any value when inserting which we can skip that column.
NOL NULL--> is opposite of the previous, we must enter a value to it, column can not be left empty, like ID we cannot skip it.
*/

6. Add a UNIQUE constraint to the ProductName column in the Products table.
alter table Products
add constraint uq_productname unique (ProductName)

7. Write a comment in a SQL query explaining its purpose.
Comment Types in SQL:
a) Single-line comment — uses --
 for example  
-- This query retrieves all products with a price greater than 100
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 100;

b) Multi-line comment — uses /* ... */
/* 
   This query selects all products
   that are priced above 100 
   from the Products table.
*/
  
8. Add CategoryID column to the Products table.
ALTER TABLE Products
ADD CategoryID INT NOT NULL;

9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

Create table Categories (CategoryID int primary key, CategoryName varchar(50) unique );

10.Explain the purpose of the IDENTITY column in SQL Server.
/*
The IDENTITY column in SQL Server is used to create an auto-incrementing numeric value, typically for primary key columns.
Key Purposes:
Automatically Generates Unique Values
Each time a new row is inserted, SQL Server automatically assigns a new number to the IDENTITY column — no need for manual input.
Ensures Uniqueness for Primary Keys
Commonly used to uniquely identify rows in a table (e.g., CustomerID, OrderID).
Improves Insert Simplicity
Developers don’t have to worry about tracking or generating unique IDs.

Syntax:
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);
 Breakdown of IDENTITY(1,1):
1: Starting value
1: Increment step (adds 1 each time)
For example, inserted rows will get CustomerID values: 1, 2, 3, ....
*/

  --Medium-Level Tasks

11. Use BULK INSERT to import data from a text file into the Products table.
To use BULK INSERT to import data from a text file into the Products table in SQL Server, we can use the following syntax:

BULK INSERT Products
FROM 'C:\docs\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

12. Create a FOREIGN KEY in the Products table that references the Categories table.
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

select * from Products p join
Categories c on p.CategoryID = c.CategoryID

13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
/*
the difference between PRIMARY KEY and UNIQUE KEY
PRIMARY KEY --> unique and not null, which means each data we insert must be different from the other and we cant left the column empty.
UNIQUE KEY --> we can leave the coulmn empty and none of the data can be the same.
*/

14. Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

15. Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

16. Use the ISNULL function to replace NULL values in Price column with a 0.
SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price
FROM Products;

17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

/*
The purpose of a foreign key is to create a relationship between two tables. 
The parent table contains a primary key, and the child table contains a foreign key that references the primary key of the parent table. 
This ensures that the data in the child table corresponds to valid data in the parent table, 
maintaining referential integrity. 
We cannot delete a record from the parent table if related records exist in the child table, 
unless we use options like ON DELETE CASCADE or ON UPDATE CASCADE.
*/

--Hard-Level Tasks

18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

create table Customers (
CustomerName varchar(50),
Age int check(Age>=18)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Age INT,
    CONSTRAINT CHK_Customer_Age CHECK (Age >= 18)
);

19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
create table Partners (
PartnerID int identity(100,5),
PartnerName varchar(50)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(100, 10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

create table OrderDetails (
OrderID int,
OrderName varchar(50),
ProductID int,
primary key (OrderID, ProductID));

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID));



21. Explain the use of COALESCE and ISNULL functions for handling NULL values.
/*
we use COALESCE when we need to check multiple columns or expressions for the first non-null value, or just to get the first non-null value. 
we use ISNULL to get null values as specifiec value (0) to console and also when we need a quick, simple null replacement with two values.
*/

22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
create table Employees (
EmpID int primary key,
Email varchar(50) unique);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE
);

23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
a) create table Orders (
OrderID int,
OrderName varchar(50),
ProductID int,
	constraint fk_product
	foreign key (ProductID)
	references Products (ProductID)
	on delete cascade
	on update cascade
);

select * from Orders
select * from Categories

b)
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
ON DELETE CASCADE
ON UPDATE CASCADE;



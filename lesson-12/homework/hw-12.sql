lesson 12 homework


--1. Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a ON p.personID = a.personID;

--2. Write a solution to find the employees who earn more than their managers.
Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)


select emp.name as empname from Employee emp
  join Employee man
 on emp.managerId = man.Id
 where emp.salary > man.salary

--3. Write a solution to report all the duplicate emails. Note that it''s guaranteed that the email field is not NULL.

Create table  Person_ (id int, email varchar(255)) 

insert into Person_ (id, email) values ('1', 'a@b.com') 
insert into Person_ (id, email) values ('2', 'c@d.com') 
insert into Person_ (id, email) values ('3', 'a@b.com')

SELECT email
FROM Person_
GROUP BY email
HAVING COUNT(*) > 1;

--4.Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.


DELETE FROM Person_
WHERE id NOT IN (
        SELECT MIN(id)
        FROM Person_
        GROUP BY email
    );

select b from Person_ a
join Person_ b on a.email = b.email and a.id<b.id

--5. Find those parents who has only girls.

CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

select * from girls
select * from boys 

Select g.parentname from girls g
left join boys b on g.ParentName = b.ParentName
where b.ParentName is null

--6.Total over 50 and least
select * from [TSQL2012].Sales.orders
select * from [TSQL2012].Sales.orderdetails

Select o.custid, 
sum (case when freight>50 then qty*unitprice else 0 end) totalsales,
min (o.freight) minweight 
FROM [TSQL2012].Sales.orders O
join [TSQL2012].Sales.OrderDetails ORD on O.ORDERID = ORD.orderid 
group by o.custid

--7. We have the tables below, and we have to write a query to get the expected output

DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

select * from Cart1
select * from Cart2

select isnull (cart1.Item, '') cart1_item,
       isnull (cart2.item, '') cart2_item
from cart1
full join cart2 on cart1.item = cart2.item
order by 1 desc

--8. Write a solution to find all customers who never order anything.

Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')


select * from Customers
select * from Orders

Select name from customers c
left join orders o on c.id = o.customerid 
where o.id is null;

--9. Write a solution to find the number of times each student attended each exam.
	drop table if exists students
	drop table if exists subjects
	drop table if exists examinations


	Create table Students (student_id int, student_name varchar(20))
	Create table Subjects (subject_name varchar(20))
	Create table Examinations (student_id int, subject_name varchar(20))
	Truncate table Students
	insert into Students (student_id, student_name) values ('1', 'Alice')
	insert into Students (student_id, student_name) values ('2', 'Bob')
	insert into Students (student_id, student_name) values ('13', 'John')
	insert into Students (student_id, student_name) values ('6', 'Alex')
	Truncate table Subjects
	insert into Subjects (subject_name) values ('Math')
	insert into Subjects (subject_name) values ('Physics')
	insert into Subjects (subject_name) values ('Programming')
	Truncate table Examinations
	insert into Examinations (student_id, subject_name) values ('1', 'Math')
	insert into Examinations (student_id, subject_name) values ('1', 'Physics')
	insert into Examinations (student_id, subject_name) values ('1', 'Programming')
	insert into Examinations (student_id, subject_name) values ('2', 'Programming')
	insert into Examinations (student_id, subject_name) values ('1', 'Physics')
	insert into Examinations (student_id, subject_name) values ('1', 'Math')
	insert into Examinations (student_id, subject_name) values ('13', 'Math')
	insert into Examinations (student_id, subject_name) values ('13', 'Programming')
	insert into Examinations (student_id, subject_name) values ('13', 'Physics')
	insert into Examinations (student_id, subject_name) values ('2', 'Math')
	insert into Examinations (student_id, subject_name) values ('1', 'Math')

select * from students
select * from Subjects
select * from Examinations

select s.student_id, s.student_name, sub.subject_name, count (e.subject_name) as attended_exams 
from Students s 
cross join Subjects sub 
left join Examinations e on s.student_id = e.student_id and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name 
order by s.student_id, sub.subject_name;

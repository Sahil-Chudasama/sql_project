 create database Employee_management;
 use Employee_management;


CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);


-- Q1 --
select lastname 
from Employees;

-- Q2 --
select distinct lastname
from employees;

-- Q3 --
select *
from employees
where lastname = "Smith";

-- Q4 --
select * 
from employees
where LastName in ('Doe', 'Smith');

-- Q5 --
select *
from employees
where Department = 14;

-- Q6 --
select *
from employees
where Department in (37, 77);

-- Q7--
select * 
from employees
where LastName like 's%';

-- Q8 --
select 
sum(budget) as total
from departments;

-- Q9 --
select department, count(name) as count
from employees
group by Department;

-- Q10 --
select *
from employees e
join departments d
on e.Department = d.Code;

-- Q11 --
select e.name, lastname, d.name, budget
from employees e
join departments d
on e.Department = d.Code;

-- Q12 --
select e.name, lastname, Budget
from employees e
join departments d
on e.Department = d.Code
where Budget > 60000;

-- Q13 --
select * 
from departments 
where Budget > (
	(select 
	round(avg(budget),2) as avg
	from departments));


-- Q14 --
select d.Name, count(*) as count
from employees e
join departments d
on e.Department = d.Code
group by d.name;

-- Q15 --
select name, lastname from employees e where Department = (
(select code
from departments
order by Budget limit 1 offset 1));

-- Q16 --
insert into departments
value
(11, 'Quality Assurance', 40000);

-- Q16 --
insert into employees
value
(847219811,'Mary', 'Moore', 11);

-- Q17 --
select name, budget,
round((budget - (budget * 0.1)),0) as final_budget
from departments;

-- Q18 --
update employees
set Department = 14
where Department = 77;

-- Q19 --
delete 
from employees 
where Department in (14);

-- Q20 --
delete from employees where Department = any (
(select code 
from departments
where Budget >= 60000));

-- Q21 --
delete from employees;









create database abc;
use abc;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);


-- Q1 --
select location
from warehouses;

-- Q2 --
select *
from boxes
where value > 150;

-- Q3 --
select distinct(Contents) 
from boxes;

-- Q4 --
select 
round(avg(value),2) as avg
from boxes;

-- Q5 --
select w.code, location,
round(avg(value),2) as avg
from boxes b
join warehouses w
on b.warehouse = w.code
group by location, w.code;

-- Q6 --
select w.code, location,
round(avg(value),2) as avg
from boxes b
join warehouses w
on b.warehouse = w.code
group by location, w.code
having avg > 150 ;

-- Q7 --
select b.code, location
from boxes b
join warehouses w
on b.warehouse = w.code;

-- Q8 --
select code, warehouse
from boxes
where warehouse = 0;

-- Q9 --
select contents, count(contents) as count
from boxes b
join warehouses w
on b.warehouse = w.code
group by contents;


-- Q10 --
select b.code, location
from boxes b
join warehouses w
on b.warehouse = w.code
where location = "chicago";

-- Q11 --
insert into warehouses
value
(6, 'New York', 3);

-- Q12 --
insert into boxes
value
('H5RT', 'Papers', 200, 2);

-- Q13 --
select *, 
(value -((value * 1.5)/10)) as total
from boxes;

-- Q14 --
delete from boxes
where value < 100;

SET SQL_SAFE_UPDATES = 0;












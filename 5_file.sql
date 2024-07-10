create database Pieces_and_providers;
use Pieces_and_providers;

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);


-- Q1 --
select 
name
from pieces_and_providers.pieces; 

-- Q2 --
select 
* 
from pieces_and_providers.providers;

-- Q3 --
select 
Piece, round(avg(price),2) as avg_price
from pieces_and_providers.provides
group by Piece;

-- Q4 --
SELECT p.Provider, ps.Name
FROM pieces_and_providers.provides p
join pieces_and_providers.providers ps
on p.Provider = ps.Code
where Piece = 1;


-- Q5 --
SELECT name
FROM pieces_and_providers.provides ps
join pieces_and_providers.pieces p
on ps.Piece = p.Code
where Provider = 'hal';


-- Q6 --
SELECT Piece, max(price) 
FROM pieces_and_providers.provides 
group by Piece;

-- Q7 --
update provides
set price = price + 1;

SET SQL_SAFE_UPDATES = 0;

-- Q8 --
delete from provides where provider = 'rbt' and piece = 4;

-- Q9 --
delete from provides where provider = 'rbt';








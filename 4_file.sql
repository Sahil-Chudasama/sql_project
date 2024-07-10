create database Movie_theatres;
use Movie_theatres;


CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 
 -- Q1 --
 select title from movie_theatres.movies;
 
 -- Q2 --
 select distinct(rating) from movie_theatres.movies;
 
 -- Q3 --
  select title, rating
  from movies
  where Rating is NULL;
  
  -- Q4 --
select name
from MovieTheaters
where movie is NULL;

-- Q5 --
select *
from Movies 
join MovieTheaters 
using(code);

-- Q6 --
select *
from Movies 
join MovieTheaters 
using(code)
where movie is not null;

-- Q7 -- 
select title
from Movies 
join MovieTheaters 
using(code)
where movie is null;
  
-- Q8 --
insert into movies
value
(9, "One, Two, Three", null);

-- Q9 --
update movies
set Rating = 'G'
where Rating is null;

-- Q10 --
delete from movies 
where Rating = "NC-17";


set SQL_SAFE_UPDATES = 0;



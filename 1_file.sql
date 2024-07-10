
-- Q1--
select name 
from products;

-- Q2 --
select name, price 
from products;

-- Q3--
select name, price 
from products
where price <= 200;

-- Q4--
select name, price
from products
where price between 60 and 120;

-- Q5 --
select name, price,
(price * 100) as cent
from products;

-- Q6 --
select 
round(avg(price), 2) as avg_price
from products;

-- Q7 --
select 
round(avg(price), 2) as avg
from products
where Manufacturer = 2;

-- Q8 --
select count(*) as count 
from products
where price >= 180;

-- Q9 --
select name, price
from products
where price >= 180
order by price desc;

-- Q9 --
select name, price
from products
where price >= 180
order by name asc;

-- Q10 --
select *
from products
join manufacturers
on products.Code = manufacturers.Code;

-- Q11 --
select
name, price, manufacturer
from products;

-- Q12 --
select 
round(avg(price), 2) as avg_price, manufacturer
from products
group by Manufacturer;

-- Q13 --
select name,
round(avg(price), 2) as avg_price
from products
group by name;

-- Q14 --
select name, 
round(avg(price), 2)  as avg
from products
group by name
having avg >= 150;

-- Q15 --
select name, price
from products
order by price limit 1;


-- Q16 --
select manufacturers.name, products.name, price
from products
join manufacturers
on products.Code = manufacturers.Code
order by price desc limit 1;


-- Q17 --
insert into products
(code, name, price, manufacturer)
value
(11, 'Loudspeakers', 70, 2);

-- Q18 --
update products
set name = "Laser Printer"
where code = 8;

-- Q19 --
select name, price,
(price * 0.1) as 10_pct_dis,
(price - (price * 0.1))as final_price
from products;

-- Q20 --
select name, price,
(price * 0.1) as 10_pct_dis,
(price - (price * 0.1))as final_price
from products
having final_price >= 120;

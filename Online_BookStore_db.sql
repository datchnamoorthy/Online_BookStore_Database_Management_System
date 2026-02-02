create database Online_BookStore_db;
use Online_BookStore_db;

select * from books;
select * from customers;
select * from orders;

alter table orders modify column Order_date date;

-- Basic Questions
-- Retreive all books from "Fiction" genre ?
select * from books 
where genre = "fiction";

-- Find books published after the year of 1950 ?
select * from books 
where published_year > 1950;

-- List all customers from canada ?
select * from customers
where country = "canada";

-- Show orders palced in november 2023 ?
select * from orders
where order_date between "2023-11-01" and "2023-11-30";

-- Retreive the total stock of books available ?
select sum(stock) as Total_Stock 
from books;

-- Find the details of the most expensive books ?
select * from books
order by price desc
limit 1;

-- Show all customers who ordered more than 1 quality of books ?
select * from orders 
where quantity > 1;

-- Retreive all orders where the total amount exceeds $20 ?
select * from orders
where total_amount > 20.0;

-- List all genres available in the books table ?
select distinct(genre) from books;

-- Find the book with the lowest stock ?
select * from books 
order by stock asc
limit 1;

-- Calculate total revenue generate from all orders ?
select sum(total_amount) as total_revenue 
from orders;
 
-- Advanced Questions
-- Retreive the total number of books sold from each genre ?
select sum(o.quantity) as Total_books_sold, b.genre 
from orders as o 
inner join books as b
on o.book_id = b.book_id
group by genre;

-- Find the average price of books in the "Fantasy" genre ?
select avg(price) as average_price , genre from 
books where genre = "fantasy";

-- List customers who have placed at least 2 orders ?
select o.customer_id, c.name, count(o.order_id) as order_count 
from orders as o inner join
customers as c on c.customer_id = o.customer_id
group by o.customer_id,c.name
having order_count >= 2;

-- Find the most frequently ordered books ?
select o.book_id, b.title, count(o.order_id) as order_count
from orders as o
inner join books as b 
on o.book_id = b.book_id
group by o.book_id,b.title
order by order_count desc limit 1;

-- Show the top 3 most expensive books of "Fantasy" genre ?
select * from books 
where genre = "fantasy"
order by price desc limit 3;

-- Retrieve the total quantity of books sold by each each author ?
select b.author,sum(o.quantity) as total_books_sold
from orders as o
inner join books b 
on o.book_id = b.book_id
group by b.author;

-- List the cities where customers who spent over $30 are located ?
select distinct(c.city), o.total_amount from orders as o 
inner join customers as c 
on o.customer_id = c.customer_id
where o.total_amount >= 30;

-- Find the customer who spent the most on orders ?
select c.customer_id, c.name, sum(o.total_amount)as Total_spent 
from orders as o 
inner join customers as c on o.customer_id = c.customer_id
group by c.customer_id, c.name
order by total_spent desc limit 1;

-- Calculate the stock remaining after fulfilling all orders ?
select b.book_id,b.title,b.stock,
coalesce(sum(quantity),0) as Order_quantity,
b.stock - coalesce(sum(o.quantity),0) as Remaining_quantity
from books as b
left join orders as o 
on b.book_id = o.book_id
group by b.book_id,b.title,b.stock;







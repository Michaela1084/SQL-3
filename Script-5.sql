-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name,district 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
where district = 'Texas';
--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer 
inner join payment 
on customer.customer_id =payment.customer_id
where amount>6.99;
--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
--4. List all customers that live in Nepal (use the city table)
select first_name, last_name
from customer
where address_id in(
	select address_id 
	from address 
	inner join city 
	on address.city_id=city.city_id 
	where country_id=67
);
--5. Which staff member had the most transactions?
select * from staff;
select count(staff_id),staff_id
from payment
group by staff_id; --Mike : 7292		--Jon 7304
--6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name,last_name
from customer
where customer_id in(
	select customer_id 
	from payment
	where amount>6.99
);
--8.How many free rentals did the store give away.
select count(amount) from payment
where amount = 0.00
group by amount; --24 free Rentals
-- Week 5 Wednesday Questions
-- Question 1
SELECT first_name, last_name, district
FROM customer                                  
FULL JOIN address							 					
ON customer.address_id = address.address_id
WHERE district = 'Texas'; 

-- Question 2
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--Question 3
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

--Question 4
SELECT first_name, last_name, country
FROM customer                                  
FULL JOIN address							 					
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'; 

--Question 5    jon stephens
SELECT staff.staff_id, first_name, last_name, COUNT(payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment_id) DESC;

-- Question 6
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Question 7
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(amount) > 1
);

-- Question 8   24
SELECT *
FROM payment
WHERE amount = 0;

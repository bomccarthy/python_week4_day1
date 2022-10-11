-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 3273
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Answer: Curtain Videotape, but my favorite is the description; A Boring Reflection
--     of a Dentist And a Mad Cow who must Chase a Secret Agent in A Shark Tank
SELECT film.title
FROM inventory
JOIN film ON inventory.film_id = film.film_id
GROUP BY inventory.film_id, film.title, film.description
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 4. How many customers have the last name ‘William’?
-- Answer: the first query returned 0 and the second confirmed
SELECT COUNT(*)
FROM customer
WHERE last_name = 'William';

SELECT last_name
FROM customer
ORDER BY last_name DESC;

-- 5. What store employee (get the id) sold the most rentals?
-- Answer: 1
SELECT staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 6. How many different district names are there?
-- Answer: 378
SELECT COUNT(DISTINCT district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: 508 which is Lambs Cincinatti
SELECT film.film_id
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
GROUP BY film.title, film.film_id
ORDER BY COUNT(film.title) DESC
LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 13
SELECT COUNT(*)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above
-- 250 for customers with ids between 380 and 430? (use group by & having> 250)
-- Answer: 3 different payment amounts
SELECT COUNT(cnt)
FROM (SELECT amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250) AS cnt;

-- 10. Within the film table, how many rating categories are there?
-- Answer: 5
SELECT COUNT(cnt)
FROM (SELECT COUNT(rating), rating
FROM film
GROUP BY rating) AS cnt;
-- And what rating has the most movies total?
-- Answer: PG-13
SELECT rating
FROM (SELECT COUNT(rating), rating
FROM film
GROUP BY rating
LIMIT 1) AS rtg;
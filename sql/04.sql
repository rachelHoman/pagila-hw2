/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT title
FROM film
JOIN inventory using (film_id)
JOIN rental using (inventory_id)
JOIN customer using (customer_id)
WHERE customer_id = 1
GROUP BY title
HAVING count(title) > 1;

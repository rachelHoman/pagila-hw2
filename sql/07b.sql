/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT(title)
FROM film
JOIN inventory USING (film_id)
LEFT JOIN (
    SELECT film_id
    FROM inventory
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country using (country_id)
    WHERE country ILIKE 'United States%'
) t using (film_id)
WHERE t.film_id IS NULL
ORDER BY title;

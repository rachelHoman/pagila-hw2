/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

SELECT
    special_feature,
    SUM(amount) AS profit
FROM (
    SELECT
        UNNEST(f.special_features) AS special_feature,
        p.amount
    FROM
        film f
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r USING (inventory_id)
        JOIN payment p USING (rental_id)
) AS subquery
GROUP BY special_feature
ORDER BY special_feature;


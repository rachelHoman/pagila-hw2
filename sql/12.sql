/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM (
    SELECT title, unnest(special_features) as sf
    FROM film
) t1
JOIN (
    SELECT title, unnest(special_features) as sf
    FROM film
) t2 USING (title)
WHERE t1.sf = 'Trailers' AND t2.sf = 'Behind the Scenes'
ORDER BY title;

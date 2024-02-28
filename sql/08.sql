/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM (
    SELECT title, unnest(special_features) as sf, rating
    FROM film
) t
WHERE sf = 'Trailers' AND rating = 'G'
ORDER BY title;

/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

SELECT sf as special_features, count(sf)
FROM (
    SELECT unnest(special_features) as sf
    FROM film
) t
GROUP BY sf
ORDER BY sf;

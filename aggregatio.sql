-- Query to return a list of films which meet following criteria (film rating is either PG or G). 
SELECT film_id, title, description, rating
FROM film 
WHERE rating IN ('PG','G')
ORDER BY rating, film_id 

-- Needed to find out this information from this list: 
-- Count of the movies: average rental rate, maximum rental duration, and minimum rental duration
SELECT rating, rental_rate, rental_duration, 
  COUNT(rating) AS count_of_movies, 
  AVG(rental_rate) AS avg_rental_rate, 
  MIN(rental_duration) AS min_rental_duration,
  MAX(rental_duration) AS max_rental_duration 
FROM film 
WHERE rating IN ('PG','G')
GROUP BY rating, rental_rate, rental_duration 
ORDER BY count_of_movies DESC 
-- Change column names with the these aliases: 
-- "count of movies", "average movie rental rate", "maximum rental duration", and "minimum rental duration". 

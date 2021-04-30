-- join the (customer, address, city and country) tables  
-- Find the top 10 countries with most customers
SELECT  D. country, 
        COUNT(customer_id)
FROM customer A 
INNER JOIN address B ON A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D ON C.country_id = D.country_id 
GROUP BY country 
ORDER BY COUNT DESC 
LIMIT 10; 

-- 109 countries. 
-- Top 10 with most customers are: India, China, United States, Japan, Mexico, Brazil, Russian Federation, Philippines, Turkey, and Indonesia.

-- Find the top 10 cities within the top 10 countries. 
-- We need to find the top 10 cities within this group of countries. A mutiple join is needed. 
-- We join (customer, address, city, country)
SELECT  C.city,
        D.country, 
        COUNT(customer_id_ AS nbr_of_customers
FROM customer A 
INNER JOIN address B ON A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D ON C.country_id = D.country_id 
WHERE country IN  ('India',
                  'China',
                  'United States',
                  'Japan',
                  'Mexico',
                  'Brazil',
                  'Russian Federation',
                  'Philippines',
                  'Turkey',
                  'Indonesia') 
GROUP BY country, city
ORDER BY nbr_of_customers DESC, country; 
-- There are 314 cities matched in those countries. 
-- Aurora, United States, is the top #1 city in the top 10 countries. Rest of cities only have one customer each.

--Find the top 5 customers in the top 10 cities who have paid the highest total amount by using a mutiple join.
SELECT  A.payment_id, 
        A.customer_id,
        A.amount, 
        B.first_name, 
        B.last_name, 
        D.city,
        E.country
FROM payment A 
INNER JOIN customer B ON A.customer_id = B.customer_id 
INNER JOIN address C ON B.address_id = C.address_id 
INNER JOIN city D ON C.city_id = D.city_id 
INNER JOIN country E ON D.country_id = E.country_id 
WHERE city IN   ('Aurora', 
                'Poos de Caldas', 
                'Belm',
                'Luzinia', 
                'Goinia', 
                'Blumeneau', 
                'guas Lindas de Gois', 
                'Aparacedia de Goinia', 
                'Maring', 
                'Vila Velha') 
GROUP BY amount, first_name, last_name, country, city, payment_id 
ORDER BY amount DESC
LIMIT 5; 
-- Results: Nicholas Barfield is the highest paying customer. 
-- He lives in Belm, Brazil and is mentioned twice in the list

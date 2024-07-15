USE sakila;
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title AS nombre_pelicula
    FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title AS nombre_pelicula
    FROM film
    WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title AS título_pelicula, description AS descripción_pelicula
    FROM film
    WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title AS titulo_pelicula
    FROM film
    WHERE length > 120;
    
-- 5. Recupera los nombres de todos los actores.
SELECT first_name AS nombre_actor
    FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name AS nombre_actor, last_name AS apellido_actor
    FROM actor
    WHERE last_name LIKE '%Gibson%';
-- Esta opción seria que el apelldio sea igual a, pero como el enunciado dice que contenga, la opción correcta seria la anterior.
SELECT first_name AS nombre_actor, last_name AS apellido_actor
    FROM actor
    WHERE last_name = 'Gibson';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
-- ambos incluidos
SELECT first_name AS nombre_actor
    FROM actor
    WHERE actor_id BETWEEN 10 AND 20;
-- sin incluirlos
SELECT first_name AS nombre_actor
    FROM actor
    WHERE actor_id BETWEEN 11 AND 19;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title AS título_pelicula, rating
    FROM film
    WHERE rating NOT IN ("R", "PG-13");

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT COUNT(film_id) AS cantidad_películas, rating AS clasificación
    FROM film
    GROUP BY rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT c.customer_id AS ID_cliente, first_name AS nombre, last_name AS apellido, COUNT(r.customer_id) AS cantidad_películas
    FROM rental AS r
    INNER JOIN customer AS c
    USING (customer_id)
    GROUP BY r.customer_id;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT COUNT(r.customer_id) AS cantidad_películas, c.name AS nombre_categoría
    FROM rental AS r
    INNER JOIN inventory AS i
    USING (inventory_id) 
    INNER JOIN film AS f
    USING (film_id)
    INNER JOIN film_category AS fc
    USING (film_id)
    INNER JOIN category AS c
    USING (category_id)
    GROUP BY c.category_id;

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT  rating AS clasificación, AVG (length) AS promedio_duración
    FROM film 
    GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT a.first_name AS nombre_actor, a.last_name AS apellido_actor
    FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    INNER JOIN film AS f
    USING (film_id)
    WHERE f.title = "Indian Love";
    
-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title AS títilo_película, description
    FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%';
    
-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT a.first_name AS nombre_actor_sin_pelicula
    FROM actor AS a    
    LEFT JOIN film_actor AS fa
    USING (actor_id )
    WHERE fa.actor_id IS NULL;

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title AS tÍtulo_pelÍcula
    FROM film AS f
    WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT title AS tÍtulo_pelÍcula
    FROM film AS f
    INNER JOIN film_category AS fc
    USING (film_id)
    INNER JOIN category AS c
    USING (category_id)
    WHERE c.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT first_name AS nombre_actor, last_name AS apellido_actor
    FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    GROUP BY fa.actor_id
    HAVING COUNT(fa.film_id) > 10;

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.


   
    




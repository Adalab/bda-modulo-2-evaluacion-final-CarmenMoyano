USE sakila;
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT f.title AS nombre_pelicula
    FROM film AS f;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT f.title AS nombre_pelicula
    FROM film AS f
    WHERE f.rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT f.title AS título_pelicula, f.description AS descripción_pelicula
    FROM film AS f
    WHERE f.description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT f.title AS titulo_pelicula
    FROM film AS f
    WHERE f.length > 120;
    
-- 5. Recupera los nombres de todos los actores.
SELECT a.first_name AS nombre_actor
    FROM actor AS a;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT a.first_name AS nombre_actor, a.last_name AS apellido_actor
    FROM actor AS a
    WHERE a.last_name LIKE '%Gibson%';
-- Esta opción seria que el apelldio sea igual a, pero como el enunciado dice que contenga, la opción correcta seria la anterior.
SELECT a.first_name AS nombre_actor, a.last_name AS apellido_actor
    FROM actor AS a
    WHERE a.last_name = 'Gibson';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
-- ambos incluidos
SELECT a.first_name AS nombre_actor
    FROM actor AS a
    WHERE a.actor_id BETWEEN 10 AND 20;
-- sin incluirlos
SELECT a.first_name AS nombre_actor
    FROM actor AS a
    WHERE a.actor_id BETWEEN 11 AND 19;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT f.title AS título_pelicula
    FROM film AS f
    WHERE f.rating NOT IN ("R", "PG-13");

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT COUNT(f.film_id) AS cantidad_películas, f.rating AS clasificación
    FROM film AS f
    GROUP BY f.rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT c.customer_id AS ID_cliente, c.first_name AS nombre_cliente, c.last_name AS apellido_cliente, COUNT(r.rental_id) AS cantidad_películas_alquiladas
    FROM rental AS r
    INNER JOIN customer AS c
    USING (customer_id)
    GROUP BY c.customer_id;

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
SELECT  f.rating AS clasificación, AVG(f.length) AS promedio_duración
    FROM film  AS f
    GROUP BY f.rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT a.first_name AS nombre_actor, a.last_name AS apellido_actor
    FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    INNER JOIN film AS f
    USING (film_id)
    WHERE f.title = 'Indian Love';
    
-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title AS títilo_película, description
    FROM film AS f
    WHERE description LIKE '%dog%' OR description LIKE '%cat%';
    
-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT a.first_name AS nombre_actor_sin_pelicula
    FROM actor AS a    
    LEFT JOIN film_actor AS fa
    USING (actor_id )
    WHERE fa.actor_id IS NULL;
-- comprobación:
SELECT COUNT(actor_id)
FROM actor;
SELECT COUNT(DISTINCT actor_id)
from film_actor;

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010
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
SELECT title AS titulo_pelicula
    FROM film AS f    
    WHERE f.rating = 'R' AND f.length > 120;

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT name AS categoría_película, AVG(length) AS promedio_duración
    FROM category AS c
    INNER JOIN film_category AS fc
    USING (category_id)
    INNER JOIN film AS f
    USING (film_id)
    GROUP BY c.name
    HAVING AVG(f.length) > 120;
    
-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
SELECT first_name AS nombre_actor, COUNT(fa.film_id) AS cantidad_peliculas
    FROM actor AS a
    INNER JOIN film_actor AS fa
    USING (actor_id)
    GROUP BY fa.actor_id
    HAVING COUNT(fa.film_id) >= 5;

-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
SELECT DISTINCT f.title AS titulo_pelicula
    FROM film AS f
    INNER JOIN inventory AS i
    USING (film_id)
    INNER JOIN rental AS r
    USING (inventory_id)
    WHERE r.rental_id IN (SELECT r.rental_id
                        FROM rental AS r
                        WHERE DATEDIFF(r.return_date, r.rental_date) > 5);
                               
-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
SELECT first_name AS nombre_actor, last_name AS apellido_actor
    FROM actor AS a
    WHERE a.actor_id NOT IN (SELECT DISTINCT actor_id
                            FROM actor AS a
                            INNER JOIN film_actor AS fa
                            USING (actor_id)
                            INNER JOIN film AS f
                            USING (film_id)
                            INNER JOIN film_category
                            USING (film_id)
                            INNER JOIN category AS c
                            USING (category_id)
                            WHERE c.name = 'Horror');

-- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
SELECT f.title AS titulo_película, c.name, f.length
    FROM film AS f
    INNER JOIN film_category AS fc
    USING (film_id)
    INNER JOIN category AS c
    USING (category_id)
    WHERE c.name = 'comedy' AND f.length > 180;

-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.
WITH actores_comparten_pelicula AS ( SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, COUNT(fa1.film_id) AS peliculas_en_comun
                                    FROM film_actor AS fa1
                                    INNER JOIN film_actor AS fa2 
                                    ON fa1.film_id = fa2.film_id
                                    AND fa1.actor_id < fa2.actor_id
                                    GROUP BY fa1.actor_id, fa2.actor_id
                                    HAVING COUNT(fa1.film_id) >= 1)
SELECT a1.first_name AS nombre_actor1, a1.last_name AS apellido_actor1, a2.first_name AS nombre_actor2, a2.last_name AS apellido_actor2, acp.peliculas_en_comun
FROM 
    actores_comparten_pelicula AS acp
    INNER JOIN actor AS a1 ON acp.actor1 = a1.actor_id
    INNER JOIN actor AS a2 ON acp.actor2 = a2.actor_id;



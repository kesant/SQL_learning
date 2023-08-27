-- consultas alia , limit offset
-- Mostrar el título de todas las series y usar alias para que el nombre del campo
-- este en español.
SELECT title  AS titulos FROM series;
-- Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con
-- fecha de lanzamiento entre el año ‘1988-01-01’ al ‘2009-12-31’. Ordenar los
-- resultados por rating descendentemente.
-- Traer el top 3 a partir del registro 10 de la consulta anterior.
SELECT title from movies 
WHERE rating >3 AND awards>1 AND release_date BETWEEN "1988-01-01" AND "2009-12-31"
ORDER BY rating DESC
LIMIT 3 OFFSET 10;
-- ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?
SELECT title,number FROM episodes
ORDER BY rating 
LIMIT 3;
-- Obtener el listado de todos los actores. Quitar las columnas de fechas y película
-- favorita, además traducir los nombres de las columnas.
SELECT first_name AS Nombre ,last_name AS Apellido,rating AS calificacion, favorite_movie_id AS id_Pelicula  FROM actors;

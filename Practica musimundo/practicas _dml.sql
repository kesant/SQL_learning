SELECT *
FROM canciones, generos
WHERE generos.id=canciones.id_genero
AND canciones.compositor="Willie Dixon";
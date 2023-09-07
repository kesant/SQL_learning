SELECT
  autores.apellido,
  autores.nombre,
  COUNT(*) AS cantidad_articulos
FROM
  articulos
INNER JOIN
  autores
ON
  articulos.autores_id = autores.id
GROUP BY
  autores.apellido,
  autores.nombre
HAVING
  COUNT(*) > 10;
-- 
SELECT
  CONCAT(autores.apellido, ' ', autores.nombre) AS 'Autor sin publicación'
FROM
  autores
LEFT JOIN
  articulos
ON
  articulos.autores_id = autores.id
WHERE
  articulos.id IS NULL;

-- 
SELECT
  autores.apellido,
  autores.nombre,
  articulos.titulo,
  articulos.fechapublicacion,
  ciudad.nombre AS 'ciudad',
  pais.nombre AS 'pais'
FROM
  articulos
INNER JOIN
  autores
ON
  articulos.autores_id = autores.id
INNER JOIN
  ciudad
ON
  autores.ciudad_id = ciudad.id
INNER JOIN
  pais
ON
  ciudad.pais_id = pais.id
WHERE
  pais.nombre = 'Chile';
-- 
SELECT
  autores.apellido,
  autores.nombre,
  articulos.titulo,
  articulos.estadoart
FROM
  articulos
INNER JOIN
  autores
ON
  articulos.autores_id = autores.id
WHERE
  articulos.estadoart = 0
AND
  SUBSTRING(autores.apellido, 2, 1) = 'a';
-- 
SELECT
  usuario.nombre,
  usuario.apellido,
  articulos.titulo,
  comentarios.Cometario,
  comentarios.Fecha
FROM
  comentarios
INNER JOIN
  usuario
ON
  comentarios.usuario_id = usuario.id
INNER JOIN
  articulos
ON
  comentarios.articulos_id = articulos.id
WHERE
  comentarios.cometario LIKE '%muy bueno%';
-- 
SELECT
  categorias.nombre_categoria AS 'categoria',
  COUNT(*) AS 'cantidad'
FROM
  categorias
INNER JOIN
  articulos
ON
  categorias.id = articulos.categoria_id
WHERE
  articulos.estado = 0
GROUP BY
  categorias.nombre;
-- 
SELECT
  autores.nombre,
  autores.apellido,
  COUNT(*) AS 'numero_articulos',
  CASE
    WHEN COUNT(*) = 1 THEN 'tiene solo un artículo publicado'
    WHEN COUNT(*) = 2 THEN 'tiene dos artículos publicados'
    WHEN COUNT(*) > 2 THEN 'tiene más de dos artículos publicados'
    ELSE 'no publicó ningún artículo'
  END AS 'mensaje'
FROM
  autores
INNER JOIN
  articulos
ON
  autores.id = articulos.autores_id
WHERE
  articulos.estadoart = 1
GROUP BY
  autores.id;
-- 
SELECT
  autores.usuario,
  autores.email,
  ciudad.nombre AS 'ciudad',
  pais.nombre AS 'pais',
  articulos.estadoart,
  COUNT(*) AS 'cantidad'
FROM
  autores
INNER JOIN
  ciudad
ON
  autores.ciudad_id = ciudad.id
INNER JOIN
  pais
ON
  ciudad.pais_id = pais.id
INNER JOIN
  articulos
ON
  autores.id = articulos.autores_id
WHERE
  articulos.estadoart = 0
GROUP BY
  autores.usuario,
  autores.email,
  ciudad.nombre,
  pais.nombre,
  articulos.estadoart;
-- 
SELECT
  usuario.apellido,
  usuario.nombre,
  YEAR(usuario.fecha_nacimiento),
CASE
    WHEN YEAR(usuario.fecha_nacimiento) >= 1988 THEN 'junior'
    WHEN YEAR(usuario.fecha_nacimiento)  BETWEEN 1983 AND 1987 THEN 'semi-senior'
    ELSE 'senior'
  END AS 'categoria'
FROM
  usuario
ORDER BY
  categoria DESC,
  YEAR(usuario.fecha_nacimiento) DESC;
--
SELECT
  usuario.nombre,
  usuario.apellido,
  ciudad.nombre AS 'ciudad',
  pais.nombre AS 'pais',
  comentarios.Cometario
FROM
  usuario
INNER JOIN
  ciudad
ON
  usuario.ciudad_id = ciudad.id
INNER JOIN
  pais
ON
  ciudad.pais_id = pais.id
INNER JOIN
  comentarios
ON
  usuario.id = comentarios.usuario_id
WHERE
  YEAR(usuario.fecha_nacimiento) BETWEEN 1983 AND 1987
ORDER BY
  comentarios.Fecha;
--
SELECT
  articulos.titulo,
  articulos.fechalta,
  recursos.ruta,
  subcategorias.nombre_subcat
FROM
  articulos
INNER JOIN recursos ON articulos.id = recursos.articulos_id
INNER JOIN subcategorias ON subcategorias.id = articulos.subcategorias_id
WHERE
  recursos.nombre_recurso LIKE 'audio%'
  AND MONTH(articulos.fechalta) = 10;

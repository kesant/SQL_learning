-- Consultando la base de datos de e-Market
-- Queremos tener un listado de todas las categorías.
SELECT * FROM categorias;
-- Cómo las categorías no tienen imágenes, solamente interesa obtener un
-- listado de CategoriaNombre y Descripcion.
SELECT CategoriaNombre,Descripcion FROM categorias;
-- Obtener un listado de los productos.
SELECT * FROM productos;
-- ¿Existen productos discontinuados? (Discontinuado = 1).
SELECT * FROM productos
WHERE Discontinuado=1;
-- Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
-- los que nos provee?
SELECT ProductoNombre FROM productos
WHERE ProveedorID=8;
-- Queremos conocer todos los productos cuyo precio unitario se encuentre
-- entre 10 y 22.
SELECT ProductoNombre FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;
-- Se define que un producto hay que solicitarlo al proveedor si sus unidades
-- en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT ProductoNombre FROM productos
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas=0;
-- -----------------------------------
-- CLIENTES
-- 1. Obtener un listado de todos los clientes con Contacto, Compania, Título,
-- País. Ordenar el listado por País.
SELECT Contacto,Compania,Titulo,Pais FROM clientes
ORDER BY Pais;
-- 2. Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT Contacto,Compania,Titulo,Pais FROM clientes
WHERE Titulo= "Owner";
-- 3. El operador telefónico que atendió a un cliente no recuerda su nombre.
-- Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
-- todos los contactos que inician con la letra “C”?
SELECT Contacto,Compania,Titulo,Pais FROM clientes
WHERE Contacto LIKE "C%";

-- FACTURAS
-- 1. Obtener un listado de todas las facturas, ordenado por fecha de factura
-- ascendente.
SELECT * FROM facturas
ORDER BY FechaFactura; 
-- 2. Ahora se requiere un listado de las facturas con el país de envío “USA” y
-- que su correo (EnvioVia) sea distinto de 3.
SELECT * FROM facturas
WHERE PaisEnvio="USA" AND EnvioVia!=3;
-- 3. ¿El cliente 'GOURL' realizó algún pedido?
SELECT * FROM facturas
WHERE ClienteID="GOURL";
-- 4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * FROM facturas
WHERE EmpleadoID IN ("2","3","5","8","9");

-- PRODUCTOS
-- 1. Obtener el listado de todos los productos ordenados
-- descendentemente por precio unitario.
SELECT ProductoNombre FROM productos
ORDER BY PrecioUnitario DESC;
-- 2. Obtener el listado de top 5 de productos cuyo precio unitario es
-- el más caro.
SELECT ProductoNombre FROM productos
ORDER BY PrecioUnitario DESC LIMIT 5;
-- 3. Obtener un top 10 de los productos con más unidades en stock.
SELECT * FROM productos
ORDER BY  UnidadesStock DESC LIMIT 10; 
-- FACTURADETALLE
-- 1. Obtener un listado de FacturaID, Producto, Cantidad.
SELECT FacturaID,ProductoID,Cantidad  FROM facturadetalle;

-- 2. Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID,ProductoID,Cantidad  FROM facturadetalle
ORDER BY Cantidad DESC;
-- 3. Filtrar el listado solo para aquellos productos donde la cantidad
-- se encuentre entre 50 y 100.
SELECT FacturaID,ProductoID,Cantidad  FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100
ORDER BY Cantidad DESC;
-- 4. En otro listado nuevo, obtener un listado con los siguientes
-- nombres de columnas: NroFactura (FacturaID), Producto
-- (ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID as NroFactura,ProductoID as Producto,Cantidad*PrecioUnitario as Total  FROM facturadetalle;

-- 
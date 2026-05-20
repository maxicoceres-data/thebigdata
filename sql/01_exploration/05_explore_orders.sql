-- Issue #5
-- Exploración inicial de tablas
-- Consultas a las tablas principales de la base de datos
-- Voy a inspeccionar orders.
-- objetivo: 
-- Cantidad de filas
-- Cantidad de columnas con valores nulos
-- rango temporal (max y min)
-- top 5 valores unicos de la columna categorica mas importante


use classicmodels;

-- Orderers
SELECT COUNT(*) FROM orders;

-- nulos Orderers
SELECT
SUM(CASE WHEN orderNumber IS NULL THEN 1 ELSE 0 END) AS nulls_orderNumber,
SUM(CASE WHEN orderDate IS NULL THEN 1 ELSE 0 END) AS nulls_orderDate,
SUM(CASE WHEN requiredDate IS NULL THEN 1 ELSE 0 END) AS nulls_requiredDate,
SUM(CASE WHEN shippedDate IS NULL THEN 1 ELSE 0 END) AS nulls_shippedDate,
SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS nulls_status,
SUM(CASE WHEN comments IS NULL THEN 1 ELSE 0 END) AS nulls_comments,
SUM(CASE WHEN customerNumber IS NULL THEN 1 ELSE 0 END) AS nulls_customerNumber
FROM orders;


-- MAX Y MIN Order date and required date
SELECT MAX(orderDate) AS max_orderDate, MIN(orderDate) AS min_orderDate
FROM orders;

SELECT MAX(requiredDate) AS max_requiredDate, MIN(requiredDate) AS min_requiredDate
FROM orders;



-- top 5 valores categoricos estados de envio del producto
SELECT status, COUNT(*) AS sta
FROM orders
GROUP BY status
ORDER BY sta DESC
LIMIT 10;


-- CONCLUSIONES
-- Hay 326 datos en el tabla orders.
-- La tabla orders presenta 2 columnas de nulos.
-- nulls_shippedDate, seran fechas que aun no tienen entregas
-- nulls_comments, podemos corroborar que la mayor parte de ordenes el cliente no comenta sobre la misma.
-- Podemos comprobar que tenemos una base de datos de 2 años, comenzando el 01-06-2003 y finalizando el 31-05-2005
-- El top 6 de valores categoricos son correspondiente al estado de la orden (Utilizamos top 6 y no top 5 por que son 6 categorias). La mayoria de pedidos fueron entregados (303). Hya pocas incidencias de pedidos. 


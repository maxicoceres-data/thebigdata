-- Issue #5
-- Exploración inicial de tablas
-- Consultas a las tablas principales de la base de datos
-- Voy a inspeccionar orderdetails.
-- objetivo: 
-- Cantidad de filas
-- Cantidad de columnas con valores nulos
-- rango temporal (max y min)
-- top 5 valores unicos de la columna categorica mas importante


use classicmodels;

-- Customers
SELECT COUNT(*) FROM orderdetails;

-- nulos customers
SELECT
SUM(CASE WHEN orderNumber IS NULL THEN 1 ELSE 0 END) AS nulls_orderNumber,
SUM(CASE WHEN productCode IS NULL THEN 1 ELSE 0 END) AS nulls_productCode,
SUM(CASE WHEN quantityOrdered IS NULL THEN 1 ELSE 0 END) AS nulls_quantityOrdered,
SUM(CASE WHEN priceEach IS NULL THEN 1 ELSE 0 END) AS nulls_priceEach,
SUM(CASE WHEN orderLineNumber IS NULL THEN 1 ELSE 0 END) AS nulls_orderLineNumber
FROM orderdetails;


-- MAX Y MIN
SELECT MAX(priceEach) AS max_priceEach, MIN(priceEach) AS min_priceEach
FROM orderdetails;


-- top 5 valores categoricos
SELECT quantityOrdered, COUNT(*) AS sta
FROM orderdetails
GROUP BY quantityOrdered
ORDER BY sta DESC
LIMIT 10;


-- CONCLUSIONES
-- Hay 326 datos en el tabla orders.
-- La tabla orders presenta 2 columnas de nulos.
-- nulls_shippedDate, seran fechas que aun no tienen entregas
-- nulls_comments, podemos corroborar que la mayor parte de ordenes el cliente no comenta sobre la misma.
-- Podemos comprobar que tenemos una base de datos de 2 años, comenzando el 01-06-2003 y finalizando el 31-05-2005
-- El top 6 de valores categoricos son correspondiente al estado de la orden (Utilizamos top 6 y no top 5 por que son 6 categorias). La mayoria de pedidos fueron entregados (303). Hya pocas incidencias de pedidos. 
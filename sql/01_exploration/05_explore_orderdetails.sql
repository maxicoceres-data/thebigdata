-- ============================================
-- Archivo: 05_explore_orderdetails.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-20
-- Issue:   #5
-- Objetivo: Exploración inicial de la tabla orderdetails
-- ============================================

use classicmodels;

-- Orderdetails
SELECT COUNT(*) FROM orderdetails;

-- nulos Orderdetails
SELECT
SUM(CASE WHEN orderNumber IS NULL THEN 1 ELSE 0 END) AS nulls_orderNumber,
SUM(CASE WHEN productCode IS NULL THEN 1 ELSE 0 END) AS nulls_productCode,
SUM(CASE WHEN quantityOrdered IS NULL THEN 1 ELSE 0 END) AS nulls_quantityOrdered,
SUM(CASE WHEN priceEach IS NULL THEN 1 ELSE 0 END) AS nulls_priceEach,
SUM(CASE WHEN orderLineNumber IS NULL THEN 1 ELSE 0 END) AS nulls_orderLineNumber
FROM orderdetails;


-- MAX Y MIN precio de cada orden 
SELECT MAX(priceEach) AS max_priceEach, MIN(priceEach) AS min_priceEach
FROM orderdetails;


-- top 5 valores categoricos frecuencia de cantidad de ordenes

SELECT quantityOrdered, COUNT(*) AS frecuency
FROM orderdetails
GROUP BY quantityOrdered
ORDER BY frecuency DESC
LIMIT 5;



-- CONCLUSIONES
-- Hay 2996 datos en el tabla ordersdetails.
-- La tabla ordersdetails no presenta columnas de nulos.
-- Tenemos minimos y maximos de precios razonables, no hay outliers que puedan modificar los valores. 
-- El top 5 de valores categoricos son correspondiente a la cantidad de productos que se piden por orden, y podemos ver por frecuencia de casos, que  la mayoria de los productos piden mas de 20 uds.
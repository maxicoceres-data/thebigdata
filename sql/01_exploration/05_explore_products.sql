-- Issue #5
-- Exploración inicial de tablas
-- Consultas a las tablas principales de la base de datos
-- Voy a inspeccionar products.
-- objetivo: 
-- Cantidad de filas
-- Cantidad de columnas con valores nulos
-- rango temporal (max y min)
-- top 5 valores unicos de la columna categorica mas importante


use classicmodels;

-- products
SELECT COUNT(*) FROM products;


SELECT * FROM products;

-- nulos products
SELECT
SUM(CASE WHEN productName IS NULL THEN 1 ELSE 0 END) AS nulls_productName,
SUM(CASE WHEN productCode IS NULL THEN 1 ELSE 0 END) AS nulls_productCode,
SUM(CASE WHEN productLine IS NULL THEN 1 ELSE 0 END) AS nulls_productLine,
SUM(CASE WHEN productScale IS NULL THEN 1 ELSE 0 END) AS nulls_productScale,
SUM(CASE WHEN productVendor IS NULL THEN 1 ELSE 0 END) AS nulls_productVendor,
SUM(CASE WHEN productDescription IS NULL THEN 1 ELSE 0 END) AS nulls_productDescription,
SUM(CASE WHEN quantityInStock IS NULL THEN 1 ELSE 0 END) AS nulls_quantityInStock,
SUM(CASE WHEN buyPrice IS NULL THEN 1 ELSE 0 END) AS nulls_buyPrice,
SUM(CASE WHEN MSRP IS NULL THEN 1 ELSE 0 END) AS nulls_MSRP
FROM products;


-- MAX Y MIN precio de compra, cantidad de stock
SELECT MAX(buyPrice) AS max_buyPrice, MIN(buyPrice) AS min_buyPrice
FROM products;

SELECT MAX(quantityInStock) AS max_quantityInStock, MIN(quantityInStock) AS min_quantityInStock
FROM products;

-- top 5 valores categoricos PRODUCTOS CON MAS STOCK

SELECT productName, quantityInStock
FROM products
GROUP BY productName, quantityInStock
ORDER BY quantityInStock DESC
LIMIT 5;

-- top 5 valores categoricos PRODUCTOS CON MENOS STOCK

SELECT productName, quantityInStock
FROM products
GROUP BY productName, quantityInStock
ORDER BY quantityInStock ASC
LIMIT 5;


-- CONCLUSIONES
-- Hay 110 datos en el tabla products.
-- La tabla products no presenta columnas de nulos.
-- Tenemos minimos y maximos de precios razonables, no hay outliers que puedan modificar los valores. 
-- La cantidad de stock tampoco tiene outliers, son datos razonables a la cantidad de stock que se maneja.
-- El top 5 de valores categoricos son correspondiente a la cantidad de productos en stock, hice un top 5 de los productos con mas cantidad y otro con los de menos cantidad.
-- Sirve para observar en que productos es necesario tener mas stock de lo estipulado y en cuales podemos reducir el gasto de comprar stock. 
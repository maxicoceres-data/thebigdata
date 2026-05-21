-- ============================================
-- Archivo: 07_top_products_by_revenue.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-21
-- Issue:   #7
-- Objetivo: Top 10 productos por facturación acumulada
-- ============================================

use classicmodels;


SELECT p.productCode AS codigo_producto,
p.productName AS nombre_producto,
p.productLine AS linea_producto,
ROUND(SUM(od.quantityOrdered * od.priceEach),2) AS total_revenue,
SUM(od.quantityOrdered)AS total_units_sold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY codigo_producto,
nombre_producto,
linea_producto
ORDER BY total_revenue DESC
LIMIT 10;

WITH top_products AS(
SELECT p.productCode AS codigo_producto,
p.productName AS nombre_producto,
p.productLine AS linea_producto,
ROUND(SUM(od.quantityOrdered * od.priceEach),2) AS total_revenue,
SUM(od.quantityOrdered)AS total_units_sold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY codigo_producto,
nombre_producto,
linea_producto
ORDER BY total_revenue DESC)
SELECT ROUND((MAX(total_revenue)/SUM(total_revenue))*100,2) AS porcentaje
FROM top_products;

WITH top_products AS(
SELECT p.productCode AS codigo_producto,
p.productName AS nombre_producto,
p.productLine AS linea_producto,
ROUND(SUM(od.quantityOrdered * od.priceEach),2) AS total_revenue,
SUM(od.quantityOrdered)AS total_units_sold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY codigo_producto,
nombre_producto,
linea_producto
ORDER BY total_revenue DESC
LIMIT 10)
SELECT ROUND((MAX(total_revenue)/SUM(total_revenue))*100,2) AS porcentaje
FROM top_products;


-- ============================================
-- CONCLUSIONES
-- La linea de producto mas vendida corresponde a Classic Cars
-- El '1992 Ferrari 360 Spider red' es el producto mas vendido con 1720 unidades y un valor total de '264132.78'
-- El '1992 Ferrari 360 Spider red' abarca el 3% de ventas totales. 
-- El '1992 Ferrari 360 Spider red' abarca el 16.28% de ventas totales DEL TOP 10.
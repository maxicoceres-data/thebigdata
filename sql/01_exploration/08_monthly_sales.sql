-- ============================================
-- Archivo: 08_monthly_sales.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-22
-- Issue:   #8
-- Objetivo: Serie temporal de ventas mensuales
-- ============================================

use classicmodels;

SELECT DATE_FORMAT(o.orderDate, '%Y-%m') AS año_mes,
SUM(od.quantityOrdered * od.priceEach) AS total_revenue,
SUM(od.quantityOrdered) AS total_orders,
ROUND((SUM(od.quantityOrdered * od.priceEach) / SUM(od.quantityOrdered) * 100),2) AS avg_order_value
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY año_mes
ORDER BY año_mes ASC;

SELECT DATE_FORMAT(o.orderDate, '%Y-%m') AS año_mes,
SUM(od.quantityOrdered * od.priceEach) AS total_revenue,
SUM(od.quantityOrdered) AS total_orders,
ROUND((SUM(od.quantityOrdered * od.priceEach) / SUM(od.quantityOrdered) * 100),2) AS avg_order_value
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY año_mes
ORDER BY total_orders DESC;


-- CONCLUSIONES
-- El mes pico de ventas es noviembre. En ambos años fue el mes con mayores ventas, el 2003 con 10574 y un promedio de 9126.74 y el 2004 con 10208 con un promedio de 9166.47
-- En noviembre se duplican las ventas. 
-- Encontre una subida muy importante en el mes de diciembre ya que en el 2003, se habian vendido 2961 ordenes y en el 2004, 4808 ordenes. 
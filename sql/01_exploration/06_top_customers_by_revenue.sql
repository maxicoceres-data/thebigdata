-- ============================================
-- Archivo: 06_top_customers_by_revenue.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-20
-- Issue:   #6
-- Objetivo: Top 10 clientes por facturación acumulada
-- ============================================

use classicmodels;


SELECT c.customerName AS Cliente, 
c.customerNumber AS numero_de_cliente, 
c.country AS Pais, 
COUNT(DISTINCT o.orderNumber) AS total_ordenes,
ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber),2) AS avg_order_value,
ROUND(SUM(od.quantityOrdered * od.priceEach),2) AS total_revenue
FROM customers c 
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY c.customerName, 
    c.customerNumber,
    c.country
ORDER BY total_revenue DESC
LIMIT 10;

WITH top_customers AS(
SELECT c.customerName AS Cliente, 
c.customerNumber AS numero_de_cliente, 
c.country AS Pais, 
COUNT(DISTINCT o.orderNumber) AS total_ordenes,
ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber),2) AS avg_order_value,
ROUND(SUM(od.quantityOrdered * od.priceEach),2) AS total_revenue
FROM customers c 
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY c.customerName, 
    c.customerNumber,
    c.country
ORDER BY total_revenue DESC
LIMIT 10)
SELECT ROUND((MAX(total_revenue)/SUM(total_revenue))*100,2) AS porcentaje
FROM top_customers;




-- ============================================
-- COMENTARIOS
-- El cliente con mayor cantidad de ordenes es EURO + Shopping Channel con 22 ordenes.
-- El ticket promedio mas alto es de AV Stores, Co. con solo 3 ordenes de 49470.03 euros.
-- Solo 2 empresas superan las 10 ordenes de compra.
-- EL resultado arroja que 'Euro+ Shopping Channel' es la empresa con mayor total de ingresos pero no con el mismo resultado, ya que al buscar los datos unicamente con valores Shipped, cambia la cantidad de ordenes. 
-- El Ingreso de EURO + Shopping Channel aporta el 27% del revenue total. 
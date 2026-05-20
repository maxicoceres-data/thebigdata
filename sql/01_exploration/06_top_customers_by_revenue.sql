-- ============================================
-- Archivo: 05_top_customers.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-20
-- Issue:   #5
-- Objetivo: Top 10 clientes por facturación acumulada
-- ============================================

SELECT c.customerName AS Cliente, 
c.customerNumber AS numero_de_cliente, 
c.country AS Pais, 
COUNT(DISTINCT o.orderNumber) AS total_ordenes,
ROUND(AVG(od.quantityOrdered * od.priceEach),2) AS avg_order_value,
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


-- ============================================
-- COMENTARIOS
-- El cliente con mayor cantidad de ordenes es EURO + Shopping Channel con 22 ordenes.
-- El ticket promedio mas alto es de Muscle Machine Inc con solo 4 ordenes de 3706.54 euros.
-- 
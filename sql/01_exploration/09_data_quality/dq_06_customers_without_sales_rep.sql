-- ============================================
-- Archivo: dq_06_customers_without_sales_rep.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Clientes sin vendedor. 
-- ============================================

use classicmodels;

SELECT 
COUNT(*) AS total_clientes,
SUM(CASE WHEN salesRepEmployeeNumber IS NULL THEN 1 ELSE 0 END) AS vendedor_nulos,
SUM(CASE WHEN salesRepEmployeeNumber = 0 THEN 1 ELSE 0 END) AS vendedor_sin_numero
FROM customers;

SELECT customerNumber
FROM customers
WHERE salesRepEmployeeNumber IS NULL OR salesRepEmployeeNumber = 0;

-- CONCLUSIONES
-- Encontramos 22 clientes que no tienen un vendedor asignado. 
-- Dejo una lista con los clientes sin vendedor a revisar. 



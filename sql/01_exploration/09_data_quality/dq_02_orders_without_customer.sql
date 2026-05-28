-- ============================================
-- Archivo: dq_02_orders_without_customer.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Ordenes sin un cliente asignado.
-- ============================================

use classicmodels;

SELECT 
COUNT(*) AS total_ordenes_clientes,
SUM(CASE WHEN c.customerNumber IS NULL THEN 1 ELSE 0 END) AS orderdes_clientes_nulos,
SUM(CASE WHEN c.customerNumber = "" THEN 1 ELSE 0 END) AS orderdes_clientes_vacios
FROM orders o
LEFT JOIN customers c ON o.customerNumber = c.customerNumber;


-- CONCLUSIONES
-- Todas las ordenes tienen clientes asociados. Integridad referencial OK. 
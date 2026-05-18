-- ============================================
-- Archivo: 01_validate_load.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-22
-- Issue:   #2
-- Objetivo: Validar que las 8 tablas se cargaron correctamente
-- ============================================

use classicmodels;

SELECT 'customers' as Tabla, COUNT(*) AS Cantidad_filas
FROM customers
UNION ALL 
SELECT 'employees' as Tabla, COUNT(*) 
FROM employees
UNION ALL
SELECT 'offices' as Tabla, COUNT(*) 
FROM offices
UNION ALL
SELECT 'orderdetails' as Tabla, COUNT(*) 
FROM orderdetails
UNION ALL
SELECT 'orders' as Tabla, COUNT(*) 
FROM orders
UNION ALL
SELECT 'payments' as Tabla, COUNT(*) 
FROM payments
UNION ALL
SELECT 'productlines' as Tabla, COUNT(*) 
FROM productlines
UNION ALL
SELECT 'products' as Tabla, COUNT(*) 
FROM products;
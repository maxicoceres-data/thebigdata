-- ============================================
-- Archivo: 10_duplicate_customers_analysis.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-28
-- Issue:   #10
-- Objetivo: Clientes duplicados y datos inconsistentes. 
-- ============================================

use classicmodels;


WITH duplicados AS(
SELECT customerName, country, city, COUNT(*) AS repetidos
FROM customers
GROUP BY customerName, country, city
HAVING COUNT(*) > 1)
SELECT c.*, d.repetidos
FROM customers c
INNER JOIN duplicados d 
  ON c.customerName = d.customerName 
  AND c.country = d.country 
  AND c.city = d.city
ORDER BY d.customerName, c.country, c.city;

-- CONCLUSIONES
-- No surgen datos repetidos con el mismo nombre pero diferente pais o ciudad.
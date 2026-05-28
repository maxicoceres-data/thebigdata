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


-- clientes con creditLimit = 0
CREATE VIEW  clientes_credit_0 AS
SELECT * FROM customers
WHERE creditLimit = 0;

SELECT customerName AS Nombre FROM clientes_credit_0;

SELECT COUNT(*)AS cantidad_cientes 
FROM clientes_credit_0;


-- Nombres genéricos o de prueba

SELECT customerName FROM customers
WHERE customerName LIKE '%Test%' AND '%Demo%' AND '%ACME%' AND '%acme%';

-- CONCLUSIONES
-- No surgen datos repetidos con el mismo nombre pero diferente pais o ciudad.
-- Se hayaron 24 clientes con creditLimit 0. 
-- No surgen datos con nombres genericos o de prueba (test, demo, acme, ACME)
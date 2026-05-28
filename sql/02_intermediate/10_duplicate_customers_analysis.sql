-- ============================================
-- Archivo: 10_duplicate_customers_analysis.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-28
-- Issue:   #10
-- Objetivo: Clientes duplicados y datos inconsistentes. 
-- ============================================

use classicmodels;

SELECT * FROM customers;

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


WITH duplicados_pais AS(
SELECT country, city, COUNT(*) AS repetidos
FROM customers
GROUP BY country, city
HAVING COUNT(*) > 1)
SELECT c.*, d.repetidos
FROM customers c
INNER JOIN duplicados_pais d 
  ON c.country = d.country 
  AND c.city = d.city
ORDER BY c.country, c.city;


-- clientes con creditLimit = 0
SELECT COUNT(*) AS cantidad_clientes_0 
FROM customers
WHERE creditLimit = 0;

SELECT customerName
FROM customers
WHERE creditLimit = 0;


-- Nombres genéricos o de prueba

SELECT customerName FROM customers
WHERE customerName LIKE '%Test%' 
OR customerName LIKE '%Demo%' 
OR customerName LIKE '%ACME%'
OR customerName LIKE '%acme%';

-- CONCLUSIONES
-- No surgen datos repetidos con el mismo nombre pero diferente pais o ciudad.
-- No surgen datos repetidos con el mismo pais y ciudad pero nombre similar. 
-- Se hayaron 24 clientes con creditLimit 0. A que se debe esto? Son clientes nuevos? Aun no se le registro un limite crediticio? Esta calculado? Priorizar investigación del cliente para asignarle un limite crediticio. 
-- No surgen datos con nombres genericos o de prueba (test, demo, acme, ACME)
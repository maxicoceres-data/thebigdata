-- ============================================
-- Archivo: dq_01_customers_without_country.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Clientes con NULL o vacio en columna País
-- ============================================

use classicmodels;

SELECT 
COUNT(*) AS clientes_sin_pais_o_vacio,
SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS nulos,
SUM(CASE WHEN country = "" THEN 1 ELSE 0 END) as vacios,
SUM(CASE WHEN country IS NULL OR country = "" THEN 1 ELSE 0 END) AS total
FROM customers;


-- No presentan datos nulos ni vacios en la columna country. 


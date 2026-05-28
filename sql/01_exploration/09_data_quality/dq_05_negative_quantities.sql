-- ============================================
-- Archivo: dq_05_negative_quantities.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Cantidad negativas de ordenes. 
-- ============================================

use classicmodels;

SELECT 
COUNT(*) AS cantidades_ordenes,
SUM(CASE WHEN quantityOrdered <= 0 THEN 1 ELSE 0 END) AS cantidad_negativa_ordenes
FROM orderdetails;

-- CONCLUSIONES
-- Como era de esperarse no hay ordenes con cantidades 0 o menos. 
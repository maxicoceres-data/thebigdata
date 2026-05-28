-- ============================================
-- Archivo: dq_03_products_with_zero_price.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Productos sin precios asignados.
-- ============================================

use classicmodels;

SELECT
COUNT(*) AS productos,
SUM(CASE WHEN buyPrice = 0 THEN 1 ELSE 0 END) AS producto_sin_precio,
SUM(CASE WHEN MSRP = 0 THEN 1 ELSE 0 END) AS producto_sin_msrp
FROM products;

-- CONCLUSIONES
-- Todos los productos tienen su precio y msrp correspondiente.
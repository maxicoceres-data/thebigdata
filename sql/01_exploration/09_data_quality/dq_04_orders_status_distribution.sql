-- ============================================
-- Archivo: dq_04_orders_status_distribution.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #9
-- Objetivo: Distribución de estado de pedidos.
-- ============================================

use classicmodels;

SELECT DISTINCT status 
FROM orders;

SELECT 
COUNT(*) AS pedidos,
ROUND(SUM(status = "Shipped") / COUNT(*) * 100 ,2) AS pedidos_entregados,
ROUND(SUM(status = "Resolved") / COUNT(*) * 100 ,2) AS pedidos_resueltos,
ROUND(SUM(status = "Cancelled") / COUNT(*) * 100 ,2) AS pedidos_cancelados,
ROUND(SUM(status = "On Hold") / COUNT(*) * 100 ,2) AS pedidos_retenidos,
ROUND(SUM(status = "Disputed") / COUNT(*) * 100 ,2) AS pedidos_disputados,
ROUND(SUM(status = "In Process") / COUNT(*) * 100 ,2) AS pedidos_en_proceso
FROM orders;

-- CONCLUSIONES
-- De 326 pedidos, el 93% de los predidos fueron entregados, teniendo un gran dato de efectividad de entrega.
-- pedidos resueltos y pedidos retenidos tienen una distribucion de 1.23%
-- pedidos cancelados y pedidos en procesos tienen una distribucion de 1.84%
-- pedidos en disputa es de 0.92%. 


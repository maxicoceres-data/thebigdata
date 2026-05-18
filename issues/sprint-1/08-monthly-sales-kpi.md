# [SQL] KPI — Serie temporal de ventas mensuales

**Labels:** `sprint-1` `sql` `kpi` `P1 - Alto`
**Milestone:** Sprint 1 — SQL Exploratorio
**Assignee:** @maxi
**Due date:** 10 de junio de 2026
**Estimación:** 4 horas
**Blocked by:** #2

---

## 📋 Contexto

El CFO quiere ver la **evolución mensual** de las ventas para identificar estacionalidad. Este KPI es la base de la mayoría de gráficos de líneas que vamos a hacer en Power BI.

## 🎯 Objetivo

Una query SQL que devuelva la facturación agrupada por año-mes.

## ✅ Criterios de aceptación

- [ ] Archivo: `sql/01_exploration/08_monthly_sales.sql`
- [ ] Header obligatorio.
- [ ] Columnas del resultado:
  - `year_month` (formato `YYYY-MM`)
  - `total_revenue` (2 decimales)
  - `total_orders`
  - `avg_order_value`
- [ ] Solo órdenes `Shipped`.
- [ ] Ordenado cronológicamente ascendente.
- [ ] Al final del archivo, un comentario respondiendo:
  1. ¿Cuál es el mes pico de ventas? ¿Hay patrón estacional?
  2. ¿Hay meses con caídas anómalas?
  3. ¿Qué rango temporal cubre el dataset?

## 🛠️ Hints

```sql
-- Agrupar por año-mes
SELECT DATE_FORMAT(o.orderDate, '%Y-%m') AS year_month, ...
GROUP BY DATE_FORMAT(o.orderDate, '%Y-%m')
```

## 🧪 Validación

- El dataset cubre del **2003** al **2005**.
- Debería haber **claros picos en Noviembre** de cada año (campaña navideña).

## 🚫 Out of scope

- Agrupación por país, vendedor o producto en la misma query (eso son KPIs separados).

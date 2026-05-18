# [SQL] KPI — Top 10 productos más vendidos

**Labels:** `sprint-1` `sql` `kpi` `P2 - Normal`
**Milestone:** Sprint 1 — SQL Exploratorio
**Assignee:** @maxi
**Due date:** 8 de junio de 2026
**Estimación:** 3 horas
**Blocked by:** #2

---

## 📋 Contexto

Segundo KPI del paquete ejecutivo. El CFO quiere identificar los productos que **más facturan** y los que **más unidades venden** (no siempre coinciden).

## 🎯 Objetivo

Dos queries SQL que devuelvan los top 10 productos por dos criterios diferentes.

## ✅ Criterios de aceptación

- [ ] Archivo 1: `sql/01_exploration/07_top_products_by_revenue.sql`
  - Columnas: `product_code`, `product_name`, `product_line`, `total_revenue`, `total_units_sold`.
  - Ordenado por `total_revenue` DESC.
- [ ] Archivo 2: `sql/01_exploration/07_top_products_by_units.sql`
  - Mismas columnas pero ordenado por `total_units_sold` DESC.
- [ ] En ambos: solo órdenes `Shipped`.
- [ ] Comentario final en cada archivo: **¿coinciden los top 10? ¿Qué nos dice la diferencia?**

## 🛠️ Hints

- 3 tablas: `products`, `orderdetails`, `orders`.
- Tené cuidado con el JOIN: si unís `products → orderdetails` y olvidás `orders`, vas a contar también las órdenes canceladas.

## 🧪 Validación

El producto top por revenue debería estar relacionado con la línea **"Classic Cars"** (es la categoría que más factura en este dataset).

## 🚫 Out of scope

- Análisis por categoría (esa es otra historia futura).

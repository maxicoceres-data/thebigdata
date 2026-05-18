# [SQL] KPI — Top 10 clientes por facturación

**Labels:** `sprint-1` `sql` `kpi` `P1 - Alto`
**Milestone:** Sprint 1 — SQL Exploratorio
**Assignee:** @maxi
**Due date:** 5 de junio de 2026
**Estimación:** 3 horas
**Blocked by:** #2

---

## 📋 Contexto

El CFO de MotorsCorp quiere saber **quiénes son sus mejores clientes**. Esto es el primer KPI "ejecutivo" que vamos a entregar. Más adelante esto será una visual del dashboard de Power BI.

## 🎯 Objetivo

Una query SQL que devuelva los 10 clientes con mayor facturación acumulada (considerando solo órdenes enviadas).

## ✅ Criterios de aceptación

- [ ] Archivo: `sql/01_exploration/06_top_customers_by_revenue.sql`
- [ ] Header obligatorio según `CONTRIBUTING.md`.
- [ ] La query devuelve exactamente 10 filas con estas columnas:
  - `customer_number`
  - `customer_name`
  - `country`
  - `total_revenue` (numérico, redondeado a 2 decimales)
  - `total_orders` (cantidad de órdenes)
  - `avg_order_value` (ticket promedio, 2 decimales)
- [ ] Solo se consideran órdenes con `status = 'Shipped'`.
- [ ] Resultado ordenado por `total_revenue` descendente.
- [ ] Al final del archivo, un comentario con los **top 3 hallazgos** (ej: "El cliente top representa el X% del revenue total").

## 🛠️ Hints

- Necesitás unir 3 tablas: `customers`, `orders`, `orderdetails`.
- La facturación de cada línea = `quantityOrdered * priceEach`.
- Usá `ROUND(x, 2)` para los decimales.
- Para el % del total que pide el comentario final, usá una subquery con el revenue total.

## 🧪 Validación esperada

El cliente #1 debería ser **Euro+ Shopping Channel** con un revenue alrededor de **820,689.54**.

Si no te da ese número, **revisá el JOIN** — probablemente estés contando filas duplicadas.

## 🚫 Out of scope

- Visualización (eso es Sprint 3+).
- Análisis por país (eso es otro KPI futuro).

## 📚 Referencias

- Documentación del schema: https://www.mysqltutorial.org/mysql-sample-database.aspx

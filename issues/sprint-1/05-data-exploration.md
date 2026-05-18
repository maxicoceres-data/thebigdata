# [SQL] Exploración inicial de tablas (perfil de datos)

**Labels:** `sprint-1` `sql` `P1 - Alto`
**Milestone:** Sprint 1 — SQL Exploratorio
**Assignee:** @maxi
**Due date:** 4 de junio de 2026
**Estimación:** 4 horas

---

## 📋 Contexto

Antes de calcular cualquier KPI, necesitamos **conocer los datos**. ¿Cuántas filas? ¿Hay nulls? ¿Qué rangos de fechas? ¿Cuántos valores únicos? Esto es lo primero que hace un analista al recibir una base de datos nueva.

## 🎯 Objetivo

Generar un **perfil exploratorio** de las 4 tablas principales: `customers`, `orders`, `orderdetails`, `products`.

## ✅ Criterios de aceptación

Para cada una de las 4 tablas, una query SQL que devuelva:

- [ ] Cantidad total de filas.
- [ ] Cantidad de columnas con valores nulos (al menos una por columna nullable).
- [ ] Rango temporal cubierto (mín y máx de la columna de fecha más relevante).
- [ ] Top 5 valores únicos de la columna categórica más importante.

### Archivos esperados

```
sql/01_exploration/
├── 05_explore_customers.sql
├── 05_explore_orders.sql
├── 05_explore_orderdetails.sql
└── 05_explore_products.sql
```

Cada archivo con:
- Header obligatorio (ver `CONTRIBUTING.md`).
- Las queries del punto anterior.
- Un **comentario final** con las conclusiones que sacaste (al menos 3 bullets por archivo).

### Ejemplo de qué tipo de conclusión espero

```sql
-- ============================================
-- CONCLUSIONES
-- ============================================
-- 1. La tabla customers tiene 122 filas y 22 nulls en la columna salesRepEmployeeNumber.
--    Esto indica que hay clientes sin vendedor asignado.
-- 2. El campo state está vacío en clientes fuera de USA (esperable).
-- 3. La columna creditLimit tiene un máximo de 227,600 y un mínimo de 0
--    (potencial issue: ¿clientes con límite 0 son válidos?).
```

## 🛠️ Hints de queries útiles

```sql
-- Conteo total
SELECT COUNT(*) FROM customers;

-- Nulls por columna
SELECT
  SUM(CASE WHEN addressLine2 IS NULL THEN 1 ELSE 0 END) AS nulls_addressLine2,
  SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS nulls_state
FROM customers;

-- Rango temporal
SELECT MIN(orderDate), MAX(orderDate) FROM orders;

-- Top 5 categóricos
SELECT country, COUNT(*) AS cnt
FROM customers
GROUP BY country
ORDER BY cnt DESC
LIMIT 5;
```

## 🚫 Out of scope

- KPIs de negocio (eso lo hacés en issues #6, #7, #8).
- Detección detallada de duplicados (eso es Issue #9).

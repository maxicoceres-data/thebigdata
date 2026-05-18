# [SQL] Reporte preliminar de calidad de datos

**Labels:** `sprint-1` `sql` `data-quality` `documentation` `P0 - Crítico`
**Milestone:** Sprint 1 — SQL Exploratorio
**Assignee:** @maxi
**Due date:** 12 de junio de 2026
**Estimación:** 5 horas

---

## 📋 Contexto

Antes de migrar los datos al ERP nuevo, el cliente nos pidió un **reporte de calidad**. Detectamos problemas ahora o explotan después en producción.

## 🎯 Objetivo

Un set de queries SQL que detecten anomalías de calidad de datos en las tablas críticas, **más** un documento markdown que resuma los hallazgos en lenguaje de negocio.

## ✅ Criterios de aceptación

- [ ] Carpeta: `sql/01_exploration/09_data_quality/`
- [ ] Al menos **6 queries**, una por cada chequeo (un archivo por chequeo):
  1. `dq_01_customers_without_country.sql` — clientes con `country IS NULL` o vacío.
  2. `dq_02_orders_without_customer.sql` — orphan orders (sin cliente que matchee — debería ser 0, validación de integridad).
  3. `dq_03_products_with_zero_price.sql` — productos con `buyPrice = 0` o `MSRP = 0`.
  4. `dq_04_orders_status_distribution.sql` — distribución de `status` (Shipped, Cancelled, Disputed, etc.) con %.
  5. `dq_05_negative_quantities.sql` — `quantityOrdered <= 0` (debería ser imposible).
  6. `dq_06_customers_without_sales_rep.sql` — clientes sin `salesRepEmployeeNumber`.
- [ ] Cada archivo con su header.
- [ ] Documento `docs/04-data-quality-report-v1.md` con la siguiente estructura:

```markdown
# Reporte de Calidad de Datos — v1
**Autor:** Maximiliano G. Coceres
**Fecha:** 2026-06-12
**Cliente:** MotorsCorp Distribuidora S.L.

## Resumen ejecutivo
<3 bullets de los hallazgos más importantes>

## Hallazgos detallados

### DQ-01 — Clientes sin país
**Severidad:** Media/Alta/Baja
**Filas afectadas:** N
**Impacto:** ...
**Acción recomendada:** ...

### DQ-02 — Órdenes sin cliente
...

## Conclusiones y siguientes pasos
```

- [ ] PR `[#9] Reporte de calidad de datos v1` abierto.

## 🛠️ Hints

- Para "orphan orders" usá `LEFT JOIN` y filtrá donde el lado derecho sea `NULL`.
- Para distribución con %, usá `COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()`.

## 🧪 Validación

Algunos hallazgos esperables (te doy spoilers para que sepas si vas bien encaminado):
- ✅ Hay clientes sin `salesRepEmployeeNumber`.
- ✅ Algunos pedidos están en status `Cancelled` o `Disputed` (no son problema, son datos correctos).
- ✅ No debería haber cantidades negativas ni orphan orders en este dataset (validá igualmente).

## 🚫 Out of scope

- Corregir los datos (no tenemos permiso para modificar el dataset).
- Detectar duplicados de clientes por similitud de nombre (eso es Sprint 2, ya con técnicas más avanzadas).

## 📈 Impacto

Este reporte se le presenta al cliente. **Cuidá la redacción y claridad** — no es solo SQL, es un entregable de negocio.

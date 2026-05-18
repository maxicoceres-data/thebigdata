# CONTRIBUTING — Convenciones de trabajo

Este documento define las **reglas del juego** que tenés que respetar al trabajar en este repo. En una empresa real, no respetar estas convenciones es motivo de devolución de un Pull Request.

---

## 1. Flujo de trabajo (Git Flow simplificado)

```
main         ←  rama protegida. Solo se mergea vía PR aprobado.
└── feature/<issue-id>-<descripcion-corta>
```

**Reglas:**

- **NUNCA** hacés commit directo a `main`.
- Cada issue se trabaja en su propia rama `feature/`.
- Una vez terminado, abrís un Pull Request hacia `main`.
- El PR debe estar aprobado por el Tech Lead (yo) antes de mergearse.

---

## 2. Naming de ramas

```
feature/<numero-issue>-<descripcion-en-kebab-case>
```

**Ejemplos válidos:**

- `feature/1-setup-environment`
- `feature/5-customer-kpis`
- `feature/12-power-bi-sales-dashboard`

---

## 3. Commits — Conventional Commits

Formato:

```
<tipo>(<scope>): <descripción corta en imperativo>

[cuerpo opcional, explica el "por qué"]

Refs #<issue-id>
```

**Tipos permitidos:**

| Tipo | Cuándo usarlo |
|---|---|
| `feat` | Nueva query, nuevo dashboard, nueva funcionalidad |
| `fix` | Corrección de un bug en una query o cálculo |
| `docs` | Cambios en documentación |
| `refactor` | Reescritura de query sin cambiar el resultado |
| `chore` | Tareas de mantenimiento (gitignore, estructura, etc.) |
| `data` | Carga, actualización o limpieza de datos |

**Ejemplos:**

```
feat(sql): add top 10 customers by revenue query

Implementa la query del Issue #5 que calcula los top 10
clientes por facturación acumulada.

Refs #5
```

```
fix(sql): correct join condition in orders-customers query

El JOIN estaba duplicando filas por usar LEFT en vez de INNER.

Refs #8
```

---

## 4. Pull Requests

**Título del PR:**
```
[#<issue-id>] <descripción corta>
```

Ejemplo: `[#5] Top 10 customers by revenue`

**Plantilla obligatoria del PR (pegá esto en la descripción):**

```markdown
## ¿Qué hace este PR?
<!-- Resumen de los cambios -->

## Issue relacionado
Closes #<issue-id>

## ¿Cómo probarlo?
1. ...
2. ...

## Capturas / Resultados
<!-- Screenshots de queries corriendo, dashboards, etc. -->

## Checklist
- [ ] El código sigue las convenciones de naming
- [ ] Agregué comentarios donde la query es compleja
- [ ] Validé manualmente que los resultados son correctos
- [ ] Actualicé documentación si era necesario
```

---

## 5. Convenciones SQL

- **Keywords en MAYÚSCULAS**: `SELECT`, `FROM`, `WHERE`, `JOIN`...
- **Identificadores en snake_case minúsculas**: `customer_id`, `order_date`.
- **Alias cortos pero claros**: `c` para `customers`, `o` para `orders`, `od` para `orderdetails`. No uses `t1`, `t2`.
- **Una columna por línea** en SELECTs con más de 3 columnas.
- **Comentarios** con `--` al inicio del archivo explicando: qué hace, autor, fecha, issue.

**Plantilla SQL:**

```sql
-- ============================================
-- Archivo: 05_top_customers.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-25
-- Issue:   #5
-- Objetivo: Top 10 clientes por facturación acumulada
-- ============================================

SELECT
    c.customerNumber,
    c.customerName,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
    ON o.orderNumber = od.orderNumber
WHERE o.status = 'Shipped'
GROUP BY c.customerNumber, c.customerName
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## 6. Convenciones Power BI

- Nombrá las medidas DAX en `PascalCase`: `TotalRevenue`, `AvgOrderValue`.
- Las columnas calculadas en `snake_case`: `revenue_per_order`.
- Cada dashboard `.pbix` debe tener una **portada** con: título, autor, fecha, fuente de datos.
- Usá la paleta corporativa de TheBigTech (definida en `docs/03-conventions.md`).

---

## 7. Comunicación

- Si te trabás más de **2 horas** en un punto, pediéndome ayuda **comentando el issue** (no me pidas en privado salvo cosas confidenciales).
- Cualquier decisión técnica que tomes (ej: "elegí INNER JOIN porque..."), dejala como comentario en el PR.
- Si descubrís algo que no estaba en el ticket, **NO** lo metas en el mismo PR. Abrí un issue nuevo.

---

Bienvenido al equipo 🚀 — *Claude, Tech Lead Data Analytics*

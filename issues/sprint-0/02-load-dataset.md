# [Data] Carga del dataset `classicmodels` en MySQL

**Labels:** `sprint-0` `setup` `data` `P0 - Crítico`
**Milestone:** Sprint 0 — Onboarding
**Assignee:** @maxi
**Due date:** 22 de mayo de 2026
**Estimación:** 2 horas
**Blocked by:** #1

---

## 📋 Contexto

`classicmodels` es la base de datos que vamos a usar durante toda la práctica. Reproduce el schema legacy del cliente MotorsCorp. La necesitamos cargada y validada antes de cualquier análisis.

## 🎯 Objetivo

Tener el schema `classicmodels` cargado en tu MySQL local con las 8 tablas y los datos completos.

## ✅ Criterios de aceptación

- [ ] Descargaste el script SQL oficial desde: https://www.mysqltutorial.org/mysql-sample-database.aspx
- [ ] Guardaste el archivo en `data/raw/mysqlsampledatabase.sql` (esta carpeta está en `.gitignore`, **no se sube**).
- [ ] Ejecutaste el script en MySQL Workbench sin errores.
- [ ] Validaste el conteo de filas con la query del apartado "Validación".
- [ ] Agregaste en `sql/00_setup/01_validate_load.sql` la query de validación con su comentario header.
- [ ] Hiciste un screenshot del resultado de la query de validación y lo subiste a `docs/img/dataset-load-evidence.png`.
- [ ] PR `[#2] Carga del dataset classicmodels` abierto y asignado para review.

## 🛠️ Pasos sugeridos

### 1. Descargar el dataset
```
https://www.mysqltutorial.org/mysql-sample-database.aspx
```
Hacé click en "Download MySQL Sample Database" y guardalo en `data/raw/`.

### 2. Ejecutar en Workbench
- Abrir MySQL Workbench → conectar a `localhost`.
- `File → Open SQL Script` → seleccionar `mysqlsampledatabase.sql`.
- Click en el ícono del rayo ⚡ ("Execute").
- Refrescar el panel de schemas (botón refresh). Debería aparecer `classicmodels`.

### 3. Query de validación

Creá `sql/00_setup/01_validate_load.sql`:

```sql
-- ============================================
-- Archivo: 01_validate_load.sql
-- Autor:   Maximiliano G. Coceres
-- Fecha:   2026-05-22
-- Issue:   #2
-- Objetivo: Validar que las 8 tablas se cargaron correctamente
-- ============================================

USE classicmodels;

SELECT 'customers'    AS tabla, COUNT(*) AS filas FROM customers
UNION ALL SELECT 'employees',    COUNT(*) FROM employees
UNION ALL SELECT 'offices',      COUNT(*) FROM offices
UNION ALL SELECT 'orders',       COUNT(*) FROM orders
UNION ALL SELECT 'orderdetails', COUNT(*) FROM orderdetails
UNION ALL SELECT 'payments',     COUNT(*) FROM payments
UNION ALL SELECT 'productlines', COUNT(*) FROM productlines
UNION ALL SELECT 'products',     COUNT(*) FROM products;
```

### 4. Resultado esperado

| tabla | filas |
|---|---|
| customers | 122 |
| employees | 23 |
| offices | 7 |
| orders | 326 |
| orderdetails | 2996 |
| payments | 273 |
| productlines | 7 |
| products | 110 |

Si los números no coinciden exactamente, **NO** sigas — comentá acá el resultado que te dio.

## 🚫 Out of scope

- Modificar datos.
- Crear índices o vistas (más adelante).

## 📚 Referencias

- Documentación del schema: https://www.mysqltutorial.org/mysql-sample-database.aspx
- Diagrama ER: https://www.mysqltutorial.org/wp-content/uploads/2009/12/MySQL-Sample-Database-Schema.png

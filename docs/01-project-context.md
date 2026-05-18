# 🎯 Contexto del proyecto — Cliente MotorsCorp

## ¿Quién es el cliente?

**MotorsCorp Distribuidora S.L.** es una empresa española dedicada a la **distribución mayorista de modelos a escala y coleccionables** (coches clásicos, motos, aviones, barcos, trenes). Vende a tiendas minoristas y coleccionistas en toda Europa, EE.UU. y parte de Asia.

- **Tamaño:** ~120 empleados
- **Antigüedad:** 18 años en el mercado
- **Sistema actual:** Software ERP legacy on-premise desarrollado a medida en 2008. Sin integración con su tienda online.
- **Sistema objetivo:** ERP Cloud de TheBigTech + plataforma B2B/B2C nueva.

## ¿Por qué nos contrataron?

El CFO de MotorsCorp tiene **dos problemas que vos vas a ayudar a resolver**:

1. **Visibilidad cero del negocio.** Cada vez que pide un reporte (top productos, ventas por país, clientes morosos), el equipo de IT tarda 3-4 días en armarlo en Excel. Quiere **dashboards self-service** en Power BI conectados al ERP.

2. **Calidad de datos sospechosa.** Sospechan que hay clientes duplicados, productos sin precio actualizado y órdenes huérfanas. Necesitan un **reporte de calidad de datos** antes de la migración.

## El dataset que vas a usar

Para no tocar datos reales del cliente durante el período de práctica, trabajás con una **réplica del schema** llamada `classicmodels`, que reproduce fielmente la estructura del legacy.

### Tablas (8)

| Tabla | Descripción | Filas aprox. |
|---|---|---|
| `customers` | Clientes mayoristas (tiendas) | 122 |
| `employees` | Vendedores y empleados | 23 |
| `offices` | Oficinas regionales | 7 |
| `orders` | Cabecera de pedidos | 326 |
| `orderdetails` | Líneas de pedido (productos por orden) | 2.996 |
| `payments` | Pagos recibidos | 273 |
| `productlines` | Categorías de producto | 7 |
| `products` | Catálogo de productos | 110 |

### Diagrama relacional simplificado

```
offices ──< employees ──< customers ──< orders ──< orderdetails >── products >── productlines
                                          │
                                          └─< payments
```

### Dónde conseguir el dataset

Te lo paso en el **Issue #2 — Carga del dataset**. Es un único archivo `.sql` que se ejecuta en MySQL Workbench.

---

## ¿Qué tenés que entregar al final de la práctica?

1. **Repositorio limpio** con todas las queries versionadas, comentadas y revisadas.
2. **Reporte de calidad de datos** (PDF / Markdown) detectando duplicados, nulls críticos, valores fuera de rango.
3. **Dashboard ejecutivo en Power BI** con al menos:
   - KPIs principales (ventas totales, ticket promedio, clientes activos)
   - Ventas por país y línea de producto
   - Top 10 clientes y productos
   - Análisis temporal (mensual/trimestral)
4. **Presentación de cierre** (5-10 slides) explicando los hallazgos al cliente ficticio.

---

## Lo que **NO** tenés que hacer

- ❌ Migrar datos reales (no tenemos acceso).
- ❌ Tocar el ERP del cliente.
- ❌ Hacer ML/predicciones (eso es Sprint avanzado, fuera del scope de la práctica inicial).
- ❌ Diseñar el modelo del nuevo ERP (eso lo hace el equipo de Arquitectura).

---

— *Briefing redactado por Claude, Tech Lead Data Analytics*

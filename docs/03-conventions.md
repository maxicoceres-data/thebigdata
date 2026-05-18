# 🎨 Convenciones técnicas

## Colores corporativos TheBigTech (para Power BI)

> Inspirados en la identidad visual de TheBigTech Experience.

| Uso | Color | HEX |
|---|---|---|
| Primario | Azul corporativo | `#0A2540` |
| Secundario | Cian acento | `#00B8D9` |
| Éxito / positivo | Verde | `#36B37E` |
| Alerta / atención | Ámbar | `#FFAB00` |
| Error / negativo | Rojo | `#DE350B` |
| Neutro fondo | Gris muy claro | `#F4F5F7` |
| Texto principal | Gris oscuro | `#172B4D` |

Usá esta paleta como base en todos los dashboards. No uses los colores por defecto de Power BI.

---

## Nomenclatura de archivos

### SQL

```
sql/<carpeta>/<NN>_<descripcion-en-snake-case>.sql
```

- `NN`: número de issue de 2 dígitos.
- Ej: `sql/01_exploration/06_top_customers_by_revenue.sql`

### Power BI

```
powerbi/<NN>_<descripcion>.pbix
```

- Ej: `powerbi/15_executive_dashboard.pbix`

### Python (si aplica)

```
scripts/<descripcion>.py
```

---

## Headers obligatorios

### SQL

```sql
-- ============================================
-- Archivo: 06_top_customers_by_revenue.sql
-- Autor:   <tu nombre>
-- Fecha:   YYYY-MM-DD
-- Issue:   #<numero>
-- Objetivo: <una línea>
-- ============================================
```

### Python

```python
"""
Archivo:  <nombre>.py
Autor:    <tu nombre>
Fecha:    YYYY-MM-DD
Issue:    #<numero>
Objetivo: <una línea>
"""
```

---

## Labels de GitHub que vas a ver

| Label | Significado |
|---|---|
| `sprint-0`, `sprint-1`, ... | Sprint al que pertenece el issue |
| `sql` | Tarea de SQL |
| `power-bi` | Tarea de Power BI |
| `python` | Tarea de Python |
| `documentation` | Tarea de documentación |
| `setup` | Configuración inicial |
| `bug` | Algo está mal y hay que arreglarlo |
| `question` | Necesita aclaración |
| `good-first-issue` | Ideal para empezar |
| `blocked` | Está trabado por otra cosa |

---

## Niveles de prioridad

| Prioridad | Significado | Tiempo de respuesta |
|---|---|---|
| `P0 - Crítico` | Bloquea todo el sprint | Hoy |
| `P1 - Alto` | Compromete el sprint si no se resuelve esta semana | 2 días |
| `P2 - Normal` | Default | Dentro del sprint |
| `P3 - Bajo` | Nice to have | Cuando haya tiempo |

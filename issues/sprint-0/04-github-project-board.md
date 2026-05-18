# [PM] Configuración del GitHub Project Board (kanban)

**Labels:** `sprint-0` `setup` `documentation` `P1 - Alto`
**Milestone:** Sprint 0 — Onboarding
**Assignee:** @maxi
**Due date:** 26 de mayo de 2026
**Estimación:** 1 hora

---

## 📋 Contexto

GitHub Projects es nuestro tablero kanban. Es donde voy a ver tu progreso real día a día. Sin esto bien configurado, no tengo visibilidad de lo que estás haciendo.

## 🎯 Objetivo

Tener un Project Board funcional con todos los issues del Sprint 0 y Sprint 1 organizados.

## ✅ Criterios de aceptación

- [ ] Creaste un **GitHub Project** (Beta / v2) llamado `TheBigTech Data Internship`.
- [ ] Lo asociaste al repo.
- [ ] Configuraste las columnas (vista Board):
  - `📋 Backlog`
  - `🎯 Sprint Actual`
  - `🚧 In Progress`
  - `👀 In Review`
  - `✅ Done`
- [ ] Configuraste estos **campos custom**:
  - `Sprint` (Single select: Sprint 0, Sprint 1, Sprint 2, Sprint 3, Sprint 4, Sprint 5)
  - `Estimate (h)` (Number)
  - `Priority` (Single select: P0, P1, P2, P3)
  - `Due Date` (Date)
- [ ] Agregaste **todos los issues del Sprint 0 y Sprint 1** al board.
- [ ] Cada issue tiene `Sprint`, `Estimate`, `Priority` y `Due Date` cargados.
- [ ] **Presentación:** comentaste en este issue un breve párrafo presentándote al equipo (qué te interesa de la data, qué esperás aprender en la práctica).
- [ ] **NO** requiere PR — este es un cambio puramente en GitHub.

## 🛠️ Pasos sugeridos

1. En tu repo → tab **Projects** → **New project** → **Board**.
2. Nombrelo `TheBigTech Data Internship`.
3. En **Settings** del project → agregá los campos custom mencionados.
4. **+ Add item** → buscá todos los issues abiertos y agregalos.
5. Hacé click en cada issue → completá los campos.

## 💡 Tip pro

En la columna superior derecha del project podés crear **vistas adicionales**:
- Vista "Por Sprint" (group by Sprint).
- Vista "Por Prioridad" (group by Priority).
- Vista "Calendario" (en lugar de board).

Te recomiendo configurar las 3.

## 🚫 Out of scope

- Automatizaciones (más adelante, una vez que arranquen los sprints).

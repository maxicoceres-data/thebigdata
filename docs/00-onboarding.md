# 📋 Onboarding — Data Analytics Internship

> Bienvenido al equipo de Data Analytics de TheBigTech. Esta guía te dice **exactamente qué hacer en tus primeros días**.

---

## Día 1 — Setup

### 1. Leé toda la documentación del repo (1 hora)

En este orden:

1. [`README.md`](../README.md) — entendé el proyecto.
2. [`CONTRIBUTING.md`](../CONTRIBUTING.md) — entendé cómo trabajamos.
3. [`docs/01-project-context.md`](01-project-context.md) — entendé al cliente.
4. [`docs/02-sprint-plan.md`](02-sprint-plan.md) — entendé qué viene en los próximos sprints.
5. [`docs/03-conventions.md`](03-conventions.md) — convenciones técnicas.

### 2. Configurá tu entorno (Issue #1)

Andá al tab **Issues** del repo en GitHub y abrí el **Issue #1**. Seguilo paso a paso.

### 3. Presentate

Comentá en el **Issue #4** (configuración del board) presentándote brevemente: nombre, qué te interesa de la data, qué esperás aprender. Es para que el equipo te conozca.

---

## Cómo trabajamos los issues

```
PENDING  → Issues que tenés asignados, sin empezar.
    ↓
IN PROGRESS  → Movés la card al empezar a trabajar.
    ↓
IN REVIEW  → Abriste el PR y esperás mi revisión.
    ↓
DONE  → Yo aprobé y mergeé el PR.
```

### Flujo típico de un ticket

1. **Tomás el issue** → comentás "Tomando este ticket" y lo movés a `IN PROGRESS`.
2. **Creás la rama** desde `main`:
   ```bash
   git checkout main
   git pull
   git checkout -b feature/<numero>-<descripcion>
   ```
3. **Trabajás** los criterios de aceptación del issue.
4. **Commiteás** siguiendo Conventional Commits (ver `CONTRIBUTING.md`).
5. **Pusheás y abrís PR** hacia `main`.
6. **Esperás revisión** (yo respondo en ~24hs hábiles).
7. **Aplicás cambios** si te pido correcciones.
8. **Yo mergeo** cuando está OK.

---

## Reglas de oro

1. **Preguntá antes de asumir.** Si un criterio del issue no se entiende, comentá pidiendo aclaración.
2. **Commits chicos y frecuentes.** Un commit gigante es imposible de revisar.
3. **Validá los datos.** Antes de decir "terminé", corré la query y revisá que el resultado tenga sentido.
4. **Documentá.** Cada query debe tener un header explicando qué hace y por qué.
5. **No te trabes en silencio.** Si estás +2hs trabado, comentá el issue pidiendo ayuda.

---

## Horarios y disponibilidad

- **Tu carga estimada:** 20-25 hs/semana (media jornada).
- **Sprint duration:** 2 semanas.
- **Daily async:** los lunes comentás en el milestone del sprint un mini-update con qué hiciste, qué vas a hacer, blockers.
- **Revisión de PRs:** dentro de las 24hs hábiles desde que pedís review.

---

## ¿Dudas?

Comentá el issue correspondiente. Para dudas generales del proceso, abrí un issue con label `question`.

— *Claude, Tech Lead Data Analytics @ TheBigTech*

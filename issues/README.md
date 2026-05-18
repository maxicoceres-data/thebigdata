# issues/ — Backlog versionado

Carpeta espejo del backlog de GitHub Issues, en formato markdown.

## ¿Por qué versionar los issues en el repo?

1. **Trazabilidad:** podés ver la historia de cómo cambió cada ticket.
2. **Replicabilidad:** un nuevo miembro del equipo puede regenerar los issues con `scripts/create-issues.sh`.
3. **Code review:** los cambios al alcance de un ticket pasan por PR.

## Estructura

```
issues/
├── sprint-0/        ← 4 issues de onboarding
├── sprint-1/        ← 5 issues de SQL exploratorio
├── sprint-2/        ← (se agregan al final del Sprint 1)
└── ...
```

## Cómo cargar todos los issues en GitHub

Ver `scripts/README.md`.

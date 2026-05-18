# Scripts de automatización

## `create-issues.sh` / `create-issues.ps1`

Crea automáticamente en tu repo de GitHub:
- 21 labels (sprints, prioridades, tipos de tarea, etc.)
- 6 milestones (uno por sprint, con due dates)
- 9 issues (Sprint 0 + Sprint 1) con sus labels, milestones y assignee

### Pre-requisitos

1. Tener **[GitHub CLI (`gh`)](https://cli.github.com/)** instalado.
2. Haber corrido `gh auth login` y estar autenticado.
3. Haber clonado el repo `maxicoceres-data/thebigdata` localmente.
4. Estar parado en la raíz del repo.

### Cómo ejecutar

**En Windows (PowerShell):**

```powershell
powershell -ExecutionPolicy Bypass -File scripts/create-issues.ps1
```

**En Mac/Linux (o WSL):**

```bash
bash scripts/create-issues.sh
```

### Qué pasa si lo corrés dos veces

- **Labels:** los que ya existen los saltea sin error.
- **Milestones:** lo mismo.
- **Issues:** **se duplican** (GitHub no chequea por nombre). Si necesitás re-correrlo, primero cerrá/borrá los duplicados.

### Resultado esperado

Después de correrlo, debería abrirse esta URL con los 9 issues nuevos:
https://github.com/maxicoceres-data/thebigdata/issues

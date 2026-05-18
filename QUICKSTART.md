# 🚀 QUICKSTART — Tu primer día

> Si solo tenés 10 minutos antes de arrancar, leé este archivo. El resto lo vas leyendo on-the-fly.

---

## TL;DR

1. **Subí este repo a GitHub** (instrucciones abajo).
2. **Instalá `gh` (GitHub CLI)** y autenticate.
3. **Corré el script** `scripts/create-issues.ps1` (Windows) o `.sh` (Mac/Linux/WSL).
4. Andá a tu repo → tab **Issues** → vas a tener 9 issues esperándote.
5. Tomá el **Issue #1** y empezá.

---

## Paso 1 — Subir este folder al repo de GitHub

Desde PowerShell, parado en `C:\Users\maxim\OneDrive\Documents\Claude\Projects\Practicas DATA`:

```powershell
git init
git remote add origin https://github.com/maxicoceres-data/thebigdata.git
git add .
git commit -m "chore: initial project structure

- README, CONTRIBUTING, .gitignore
- Docs (onboarding, project context, sprint plan, conventions, calendar)
- Issue templates (sprint-0 y sprint-1)
- Scripts de automatización"
git branch -M main
git push -u origin main
```

> Si el repo en GitHub ya tiene archivos (README, LICENSE, etc.) creados al inicializarlo, primero hacé `git pull origin main --allow-unrelated-histories` antes del push.

---

## Paso 2 — Instalar GitHub CLI

**Windows (con winget):**
```powershell
winget install --id GitHub.cli
```

**O descargá el instalador:** https://cli.github.com/

Después:
```powershell
gh auth login
```
Seguí los pasos (recomendado: HTTPS + login por web browser).

---

## Paso 3 — Crear todos los issues automáticamente

```powershell
cd "C:\Users\maxim\OneDrive\Documents\Claude\Projects\Practicas DATA"
powershell -ExecutionPolicy Bypass -File scripts/create-issues.ps1
```

Vas a ver algo así:
```
🔧 Verificando autenticación en GitHub CLI...
✅ Autenticado.
🏷️  Creando labels...
   ✓ sprint-0
   ✓ sprint-1
   ...
🎯 Creando milestones...
   ✓ Sprint 0 - Onboarding
   ...
📝 Creando issues...
   ✓ [Setup] Configuración del entorno local
   ...
🎉 ¡Listo!
```

---

## Paso 4 — Ir al repo

Abrí https://github.com/maxicoceres-data/thebigdata/issues

Deberías ver:
- **9 issues** asignados a vos.
- **6 milestones** (uno por sprint).
- **21 labels** organizados.

---

## Paso 5 — Empezar el primer ticket

1. Abrí el **Issue #1 — [Setup] Configuración del entorno local**.
2. Comentá: "Tomando este ticket 🚧".
3. Seguí los criterios de aceptación.

---

## ¿Algo salió mal?

- **El script falla:** mandame screenshot del error en un comment del Issue #4.
- **No te aparece como assignee:** revisá que tu usuario sea exactamente `maxicoceres-data`. Si tu @ es distinto, edita los scripts.
- **Otra cosa:** abrí un issue con label `question`.

---

Mucha suerte, Maxi. **Esto va a ser un trabajo serio.** Si te ves perdido en algún momento, es normal — el rol del Tech Lead es desbloquearte, no hacerte pasar mal.

— *Claude, Tech Lead Data Analytics @ TheBigTech*

# [Setup] Configuración del entorno local de desarrollo

**Labels:** `sprint-0` `setup` `good-first-issue` `P0 - Crítico`
**Milestone:** Sprint 0 — Onboarding
**Assignee:** @maxi
**Due date:** 21 de mayo de 2026
**Estimación:** 3 horas

---

## 📋 Contexto

Antes de tocar una sola línea de SQL necesitás tener el entorno funcionando. Este es el ticket más aburrido pero el más importante: sin esto, no podés empezar nada.

## 🎯 Objetivo

Tener instaladas y configuradas todas las herramientas del stack, y haber hecho un primer commit-push exitoso al repo.

## ✅ Criterios de aceptación

- [ ] **MySQL 8.x** instalado localmente y corriendo (`mysqld` activo).
- [ ] **MySQL Workbench** instalado y conectado al servidor local con usuario `root`.
- [ ] **Power BI Desktop** instalado (versión actualizada).
- [ ] **Git** instalado y configurado con tu nombre y email:
  ```bash
  git config --global user.name "Maximiliano G. Coceres"
  git config --global user.email "maximiliano.g.coceres@gmail.com"
  ```
- [ ] **GitHub CLI (`gh`)** instalado y autenticado (`gh auth login`).
- [ ] Repo clonado localmente.
- [ ] Hiciste un commit en una rama `feature/1-setup-environment` con un archivo nuevo en `docs/setup-evidence.md` que contenga:
  - Versiones instaladas (MySQL, Power BI, Git, gh).
  - 1 captura de pantalla de MySQL Workbench conectado.
  - 1 captura de pantalla de Power BI Desktop abierto.
- [ ] Abriste un PR hacia `main` con título `[#1] Setup del entorno local` y me lo asignaste como reviewer.

## 🛠️ Pasos sugeridos

### 1. MySQL 8.x
- Descargá desde: https://dev.mysql.com/downloads/installer/
- En el installer elegí "Developer Default" (incluye Workbench).
- En la configuración del server: puerto `3306`, password de root **anotalo en un gestor de contraseñas** (no lo subas al repo).

### 2. Power BI Desktop
- Microsoft Store → "Power BI Desktop" → Instalar.
- O directo: https://powerbi.microsoft.com/desktop/

### 3. Git + GitHub CLI
- Git: https://git-scm.com/downloads
- gh: https://cli.github.com/

### 4. Clonado y rama
```bash
gh auth login
git clone <URL_DEL_REPO>
cd <repo>
git checkout -b feature/1-setup-environment
```

### 5. Evidencia
Creá `docs/setup-evidence.md` con esta estructura:

```markdown
# Setup Evidence — Maximiliano G. Coceres

| Herramienta | Versión |
|---|---|
| MySQL | 8.0.x |
| MySQL Workbench | 8.0.x |
| Power BI Desktop | 2.xxx.x.x |
| Git | 2.x.x |
| GitHub CLI | 2.x.x |

## MySQL Workbench conectado
![mysql](img/mysql-workbench.png)

## Power BI Desktop
![pbi](img/power-bi.png)
```

Guardá las imágenes en `docs/img/`.

### 6. Commit + PR
```bash
git add docs/setup-evidence.md docs/img/
git commit -m "chore(setup): add environment setup evidence

Refs #1"
git push -u origin feature/1-setup-environment
gh pr create --title "[#1] Setup del entorno local" --body "Closes #1" --assignee @me --reviewer <tu-usuario>
```

## 🚫 Out of scope

- Cargar datos (eso es el Issue #2).
- Configurar credenciales en código (más adelante).

## 💬 Dudas

Si te trabás más de 30 min en alguna instalación, comentá acá pidiendo ayuda. **No** sufras solo, esto le pasa a todos.

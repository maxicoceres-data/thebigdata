#!/usr/bin/env bash
# =============================================================
# create-issues.sh
# -------------------------------------------------------------
# Crea automáticamente los issues, labels y milestones del
# Sprint 0 y Sprint 1 en el repositorio de GitHub usando `gh`.
#
# Uso:
#   1. Asegurate de tener instalado GitHub CLI: https://cli.github.com/
#   2. Autenticate:   gh auth login
#   3. Posicionate en la raíz del repo (donde está este script o uno arriba).
#   4. Ejecutá:       bash scripts/create-issues.sh
#
# Autor: Claude (Tech Lead Data Analytics @ TheBigTech)
# =============================================================
set -euo pipefail

REPO="maxicoceres-data/thebigdata"
ASSIGNEE="maxicoceres-data"

echo "🔧 Verificando autenticación en GitHub CLI..."
gh auth status >/dev/null 2>&1 || { echo "❌ Necesitás correr 'gh auth login' primero."; exit 1; }
echo "✅ Autenticado."

# -------------------------------------------------------------
# 1. LABELS
# -------------------------------------------------------------
echo ""
echo "🏷️  Creando labels..."

create_label () {
  local name="$1"
  local color="$2"
  local desc="$3"
  gh label create "$name" --repo "$REPO" --color "$color" --description "$desc" 2>/dev/null \
    && echo "   ✓ $name" \
    || echo "   • $name (ya existía)"
}

create_label "sprint-0"        "0E8A16" "Sprint 0 - Onboarding"
create_label "sprint-1"        "1D76DB" "Sprint 1 - SQL Exploratorio"
create_label "sprint-2"        "5319E7" "Sprint 2 - SQL Intermedio + DQ"
create_label "sprint-3"        "B60205" "Sprint 3 - Power BI Modelado"
create_label "sprint-4"        "D93F0B" "Sprint 4 - Power BI Dashboard"
create_label "sprint-5"        "FBCA04" "Sprint 5 - Documentación final"
create_label "sql"             "0075CA" "Tarea SQL"
create_label "power-bi"        "F4B400" "Tarea Power BI"
create_label "python"          "306998" "Tarea Python"
create_label "kpi"             "00B8D9" "KPI de negocio"
create_label "data"            "C5DEF5" "Carga / manipulación de datos"
create_label "data-quality"    "8B0000" "Calidad de datos"
create_label "documentation"   "0E8A16" "Documentación"
create_label "setup"           "5319E7" "Configuración inicial"
create_label "good-first-issue" "7057FF" "Ideal para empezar"
create_label "question"        "CC317C" "Necesita aclaración"
create_label "blocked"         "B60205" "Está bloqueado"
create_label "P0 - Crítico"    "B60205" "Prioridad crítica"
create_label "P1 - Alto"       "D93F0B" "Prioridad alta"
create_label "P2 - Normal"     "FBCA04" "Prioridad normal"
create_label "P3 - Bajo"       "0E8A16" "Prioridad baja"

# -------------------------------------------------------------
# 2. MILESTONES (vía API porque gh no tiene comando directo)
# -------------------------------------------------------------
echo ""
echo "🎯 Creando milestones..."

create_milestone () {
  local title="$1"
  local description="$2"
  local due_on="$3"  # formato ISO 8601: 2026-05-29T23:59:59Z

  gh api "repos/$REPO/milestones" \
    -f title="$title" \
    -f description="$description" \
    -f due_on="$due_on" \
    -f state="open" \
    >/dev/null 2>&1 \
    && echo "   ✓ $title" \
    || echo "   • $title (ya existía o falló)"
}

create_milestone "Sprint 0 - Onboarding"         "Setup del entorno y dataset"           "2026-05-29T23:59:59Z"
create_milestone "Sprint 1 - SQL Exploratorio"   "Exploración y KPIs base"              "2026-06-12T23:59:59Z"
create_milestone "Sprint 2 - SQL Intermedio"     "JOINs, subqueries, Data Quality"       "2026-06-26T23:59:59Z"
create_milestone "Sprint 3 - Power BI Modelado"  "Modelado de datos en Power BI"         "2026-07-10T23:59:59Z"
create_milestone "Sprint 4 - Power BI Dashboard" "Dashboard ejecutivo final"             "2026-07-24T23:59:59Z"
create_milestone "Sprint 5 - Cierre"             "Documentación y presentación final"    "2026-08-07T23:59:59Z"

# -------------------------------------------------------------
# 3. ISSUES
# -------------------------------------------------------------
echo ""
echo "📝 Creando issues..."

create_issue () {
  local title="$1"
  local body_file="$2"
  local labels="$3"
  local milestone="$4"

  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --body-file "$body_file" \
    --label "$labels" \
    --milestone "$milestone" \
    --assignee "$ASSIGNEE" \
    && echo "   ✓ $title"
}

# Sprint 0
create_issue \
  "[Setup] Configuración del entorno local de desarrollo" \
  "issues/sprint-0/01-setup-environment.md" \
  "sprint-0,setup,good-first-issue,P0 - Crítico" \
  "Sprint 0 - Onboarding"

create_issue \
  "[Data] Carga del dataset classicmodels en MySQL" \
  "issues/sprint-0/02-load-dataset.md" \
  "sprint-0,setup,data,P0 - Crítico" \
  "Sprint 0 - Onboarding"

create_issue \
  "[Docs] Personalizar README del repo con tu información" \
  "issues/sprint-0/03-repo-documentation.md" \
  "sprint-0,documentation,P2 - Normal" \
  "Sprint 0 - Onboarding"

create_issue \
  "[PM] Configuración del GitHub Project Board (kanban)" \
  "issues/sprint-0/04-github-project-board.md" \
  "sprint-0,setup,documentation,P1 - Alto" \
  "Sprint 0 - Onboarding"

# Sprint 1
create_issue \
  "[SQL] Exploración inicial de tablas (perfil de datos)" \
  "issues/sprint-1/05-data-exploration.md" \
  "sprint-1,sql,P1 - Alto" \
  "Sprint 1 - SQL Exploratorio"

create_issue \
  "[SQL] KPI - Top 10 clientes por facturación" \
  "issues/sprint-1/06-top-customers-kpi.md" \
  "sprint-1,sql,kpi,P1 - Alto" \
  "Sprint 1 - SQL Exploratorio"

create_issue \
  "[SQL] KPI - Top 10 productos más vendidos" \
  "issues/sprint-1/07-top-products-kpi.md" \
  "sprint-1,sql,kpi,P2 - Normal" \
  "Sprint 1 - SQL Exploratorio"

create_issue \
  "[SQL] KPI - Serie temporal de ventas mensuales" \
  "issues/sprint-1/08-monthly-sales-kpi.md" \
  "sprint-1,sql,kpi,P1 - Alto" \
  "Sprint 1 - SQL Exploratorio"

create_issue \
  "[SQL] Reporte preliminar de calidad de datos" \
  "issues/sprint-1/09-data-quality-report.md" \
  "sprint-1,sql,data-quality,documentation,P0 - Crítico" \
  "Sprint 1 - SQL Exploratorio"

echo ""
echo "🎉 ¡Listo! Todos los issues, labels y milestones fueron creados."
echo "   👉 Abrí: https://github.com/$REPO/issues"

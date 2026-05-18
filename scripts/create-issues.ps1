# =============================================================
# create-issues.ps1  (Windows PowerShell - ASCII safe, robust)
# -------------------------------------------------------------
# Crea automaticamente los issues, labels y milestones del
# Sprint 0 y Sprint 1 en el repositorio de GitHub usando gh.
#
# Uso:
#   1. Instala GitHub CLI: https://cli.github.com/
#   2. Autentica:   gh auth login
#   3. Posicionate en la raiz del repo.
#   4. Ejecuta:     powershell -ExecutionPolicy Bypass -File scripts/create-issues.ps1
#
# Autor: Claude (Tech Lead Data Analytics @ TheBigTech)
# =============================================================

# NOTA: NO usamos $ErrorActionPreference = "Stop" a proposito.
# gh CLI escribe warnings en stderr (ej: "label already exists")
# y eso haria abortar el script. Manejamos errores con $LASTEXITCODE.
$ErrorActionPreference = "Continue"

$REPO = "maxicoceres-data/thebigdata"
$ASSIGNEE = "maxicoceres-data"

Write-Host "Verificando autenticacion en GitHub CLI..." -ForegroundColor Cyan
gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Necesitas correr 'gh auth login' primero." -ForegroundColor Red
    exit 1
}
Write-Host "OK - Autenticado." -ForegroundColor Green

# -------------------------------------------------------------
# 1. LABELS
# -------------------------------------------------------------
Write-Host ""
Write-Host "Creando labels..." -ForegroundColor Cyan

function New-Label($name, $color, $desc) {
    # --force actualiza el label si ya existe (en lugar de fallar)
    gh label create $name --repo $REPO --color $color --description $desc --force 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   [OK] $name" -ForegroundColor Green
    }
    else {
        Write-Host "   [!!] $name (fallo, codigo $LASTEXITCODE)" -ForegroundColor Yellow
    }
}

New-Label "sprint-0"         "0E8A16" "Sprint 0 - Onboarding"
New-Label "sprint-1"         "1D76DB" "Sprint 1 - SQL Exploratorio"
New-Label "sprint-2"         "5319E7" "Sprint 2 - SQL Intermedio + DQ"
New-Label "sprint-3"         "B60205" "Sprint 3 - Power BI Modelado"
New-Label "sprint-4"         "D93F0B" "Sprint 4 - Power BI Dashboard"
New-Label "sprint-5"         "FBCA04" "Sprint 5 - Documentacion final"
New-Label "sql"              "0075CA" "Tarea SQL"
New-Label "power-bi"         "F4B400" "Tarea Power BI"
New-Label "python"           "306998" "Tarea Python"
New-Label "kpi"              "00B8D9" "KPI de negocio"
New-Label "data"             "C5DEF5" "Carga / manipulacion de datos"
New-Label "data-quality"     "8B0000" "Calidad de datos"
New-Label "documentation"    "0E8A16" "Documentacion"
New-Label "setup"            "5319E7" "Configuracion inicial"
New-Label "good-first-issue" "7057FF" "Ideal para empezar"
New-Label "question"         "CC317C" "Necesita aclaracion"
New-Label "blocked"          "B60205" "Esta bloqueado"
New-Label "P0-Critico"       "B60205" "Prioridad critica"
New-Label "P1-Alto"          "D93F0B" "Prioridad alta"
New-Label "P2-Normal"        "FBCA04" "Prioridad normal"
New-Label "P3-Bajo"          "0E8A16" "Prioridad baja"

# -------------------------------------------------------------
# 2. MILESTONES
# -------------------------------------------------------------
Write-Host ""
Write-Host "Creando milestones..." -ForegroundColor Cyan

function New-Milestone($title, $description, $dueOn) {
    gh api "repos/$REPO/milestones" `
        -f title="$title" `
        -f description="$description" `
        -f due_on="$dueOn" `
        -f state="open" 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   [OK] $title" -ForegroundColor Green
    }
    else {
        Write-Host "   [--] $title (ya existia o fallo)" -ForegroundColor DarkGray
    }
}

New-Milestone "Sprint 0 - Onboarding"         "Setup del entorno y dataset"        "2026-05-29T23:59:59Z"
New-Milestone "Sprint 1 - SQL Exploratorio"   "Exploracion y KPIs base"            "2026-06-12T23:59:59Z"
New-Milestone "Sprint 2 - SQL Intermedio"     "JOINs, subqueries, Data Quality"    "2026-06-26T23:59:59Z"
New-Milestone "Sprint 3 - Power BI Modelado"  "Modelado de datos en Power BI"      "2026-07-10T23:59:59Z"
New-Milestone "Sprint 4 - Power BI Dashboard" "Dashboard ejecutivo final"          "2026-07-24T23:59:59Z"
New-Milestone "Sprint 5 - Cierre"             "Documentacion y presentacion final" "2026-08-07T23:59:59Z"

# -------------------------------------------------------------
# 3. ISSUES
# -------------------------------------------------------------
Write-Host ""
Write-Host "Creando issues..." -ForegroundColor Cyan

function New-Issue($title, $bodyFile, $labels, $milestone) {
    if (-not (Test-Path $bodyFile)) {
        Write-Host "   [!!] No se encontro el archivo: $bodyFile" -ForegroundColor Red
        return
    }
    $result = gh issue create `
        --repo $REPO `
        --title $title `
        --body-file $bodyFile `
        --label $labels `
        --milestone $milestone `
        --assignee $ASSIGNEE 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   [OK] $title" -ForegroundColor Green
    }
    else {
        Write-Host "   [!!] $title -> ERROR" -ForegroundColor Red
        Write-Host "        $result" -ForegroundColor Yellow
    }
}

# Sprint 0
New-Issue "[Setup] Configuracion del entorno local de desarrollo" `
    "issues/sprint-0/01-setup-environment.md" `
    "sprint-0,setup,good-first-issue,P0-Critico" `
    "Sprint 0 - Onboarding"

New-Issue "[Data] Carga del dataset classicmodels en MySQL" `
    "issues/sprint-0/02-load-dataset.md" `
    "sprint-0,setup,data,P0-Critico" `
    "Sprint 0 - Onboarding"

New-Issue "[Docs] Personalizar README del repo con tu informacion" `
    "issues/sprint-0/03-repo-documentation.md" `
    "sprint-0,documentation,P2-Normal" `
    "Sprint 0 - Onboarding"

New-Issue "[PM] Configuracion del GitHub Project Board (kanban)" `
    "issues/sprint-0/04-github-project-board.md" `
    "sprint-0,setup,documentation,P1-Alto" `
    "Sprint 0 - Onboarding"

# Sprint 1
New-Issue "[SQL] Exploracion inicial de tablas (perfil de datos)" `
    "issues/sprint-1/05-data-exploration.md" `
    "sprint-1,sql,P1-Alto" `
    "Sprint 1 - SQL Exploratorio"

New-Issue "[SQL] KPI - Top 10 clientes por facturacion" `
    "issues/sprint-1/06-top-customers-kpi.md" `
    "sprint-1,sql,kpi,P1-Alto" `
    "Sprint 1 - SQL Exploratorio"

New-Issue "[SQL] KPI - Top 10 productos mas vendidos" `
    "issues/sprint-1/07-top-products-kpi.md" `
    "sprint-1,sql,kpi,P2-Normal" `
    "Sprint 1 - SQL Exploratorio"

New-Issue "[SQL] KPI - Serie temporal de ventas mensuales" `
    "issues/sprint-1/08-monthly-sales-kpi.md" `
    "sprint-1,sql,kpi,P1-Alto" `
    "Sprint 1 - SQL Exploratorio"

New-Issue "[SQL] Reporte preliminar de calidad de datos" `
    "issues/sprint-1/09-data-quality-report.md" `
    "sprint-1,sql,data-quality,documentation,P0-Critico" `
    "Sprint 1 - SQL Exploratorio"

Write-Host ""
Write-Host "LISTO! Revisa: https://github.com/$REPO/issues" -ForegroundColor Cyan

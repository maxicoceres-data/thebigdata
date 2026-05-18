# TheBigTech · Data Analytics Internship

![Status](https://img.shields.io/badge/status-active-success) ![Sprint](https://img.shields.io/badge/sprint-0-blue) ![Stack](https://img.shields.io/badge/stack-MySQL%20%7C%20Power%20BI%20%7C%20Python-informational)

> Repositorio de trabajo de **Maximiliano G. Coceres** ([@maxicoceres-data](https://github.com/maxicoceres-data)) durante su práctica profesional en el área de **Data Analytics** de **TheBigTech Experience**.
>
> **Repo:** https://github.com/maxicoceres-data/thebigdata

---

## Contexto del proyecto

TheBigTech es una consultora de transformación digital con sede en Zaragoza (España), enfocada en ERP Cloud, e-commerce B2B/B2C y desarrollos a medida. Como parte del equipo de **Data Analytics**, el practicante trabajará sobre la migración y análisis de datos de un cliente real:

**Cliente:** `MotorsCorp Distribuidora S.L.` **Industria:** Distribución mayorista de modelos y coleccionables a escala (clásicos, motos, coches, aviones, barcos). **Necesidad:** Migración del sistema legacy al ERP Cloud de TheBigTech y construcción de un dashboard ejecutivo en Power BI con los KPIs principales del negocio.

El dataset utilizado en esta práctica es el público **`classicmodels`** de MySQL, que simula la base de datos transaccional de este cliente.

---

## Stack técnico

| Capa                 | Herramienta                       |
| -------------------- | --------------------------------- |
| Base de datos        | MySQL 8.x                         |
| IDE SQL              | MySQL Workbench                   |
| Visualización        | Power BI Desktop                  |
| Scripting            | Python 3.11+ (puntual)            |
| Control de versiones | Git + GitHub                      |
| Project Management   | GitHub Projects (kanban) + Issues |

---

## Estructura del repositorio

```
.
├── README.md                ← Estás aquí
├── CONTRIBUTING.md          ← Convenciones de branches, commits y PRs
├── .gitignore
├── docs/                    ← Documentación funcional del proyecto
│   ├── 00-onboarding.md
│   ├── 01-project-context.md
│   ├── 02-sprint-plan.md
│   └── 03-conventions.md
├── sql/                     ← Scripts SQL versionados
│   ├── 00_setup/            ← Creación de schema y carga inicial
│   └── 01_exploration/      ← Queries de exploración y KPIs
├── powerbi/                 ← Archivos .pbix (modelos y dashboards)
├── data/
│   └── raw/                 ← Dataset original (no se sube a git)
├── scripts/                 ← Utilidades (carga de issues, etc.)
└── issues/                  ← Backlog versionado en markdown
    ├── sprint-0/
    └── sprint-1/
```

---

## Cómo empezar (Onboarding)

Si estás leyendo esto por primera vez, seguí los pasos en [`docs/00-onboarding.md`](docs/00-onboarding.md).

El primer ticket que debés tomar es el **Issue #1 — Setup del entorno local**.

---

## Equipo

| Rol                             | Persona                |
| ------------------------------- | ---------------------- |
| Tech Lead / Senior Data Analyst | Claude (Tu jefe)       |
| Practicante Data Analytics      | Maximiliano G. Coceres |

---

## Licencia y confidencialidad

Repositorio de uso académico/formativo. Los datos del cliente son simulados (dataset público `classicmodels`).

## Sobre mí

**Nombre:** Maximiliano Coceres  
**Rol:** Practicante Data Analytics  
**LinkedIn:** [Perfil](https://www.linkedin.com/in/maximiliano-gabriel-coceres/)  
**Email:** maximiliano.g.coceres@gmail.com

![Status](https://img.shields.io/badge/status-active-success) ![Sprint](https://img.shields.io/badge/sprint-0-blue)

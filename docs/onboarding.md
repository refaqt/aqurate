# Onboarding — Aqurate (DOQS)

## What this repository is

A **modular open-hardware** positioning and error-motion measurement system using the Documentation System (DOQS): text-first files, identical module layout at every depth, SysML for requirements, FreeCAD for geometry, OKH manifests for publishing.

Aqurate is currently a **single top-level module**. Sub-assemblies will be added under `modules/` later.

## Prerequisites

- Git and [Git LFS](https://git-lfs.com/)
- Python 3.11+ (stdlib `tomllib` for validators)
- FreeCAD 1.1+ (Assembly workbench) for CAD work
- [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/) once, for graphical SysML in SysON (optional until you edit models in the browser)

## Setup

```powershell
git clone --recurse-submodules https://github.com/refaqt/aqurate.git
cd aqurate
git lfs install
bash setup-tooling.sh
python -m venv .venv
.venv\Scripts\Activate.ps1
```

### DOQS tools path

Validators and templates live at **`aqurate/doqs/`** (Git submodule). Run all `python doqs/scripts/...` commands from the **aqurate repository root**.

A separate clone of [github.com/refaqt/doqs](https://github.com/refaqt/doqs) elsewhere on disk (e.g. `../doqs`) does **not** satisfy these paths. Use `bash setup-tooling.sh` after clone (agents, any OS), or create a junction/symlink from `aqurate/doqs` to your existing clone if you prefer that workflow. Humans on Windows may double-click `setup-tooling.bat`.

## Validation (run from repo root)

```powershell
python doqs/scripts/validate_all.py
python doqs/scripts/build_graph.py
python bom/aggregate_bom.py
```

`validate_all.py` runs `validate_okh`, `validate_licenses`, `check_names`, `check_links`, and `validate_build`. To create or refresh split-licence files (`LICENSE`, `LICENSES/`, `TRADEMARKS.md`, per-directory stubs):

```powershell
python doqs/scripts/apply_licenses.py
```

## Graphical SysML (SysON)

Requirements live in `architecture/*.sysml`. To edit them in Eclipse SysON:

1. Install Docker Desktop once (see [doqs/docs/syson.md](../doqs/docs/syson.md)).
2. Double-click `syson.bat` at this repository root (or run `bash syson.sh`).
3. In the control panel, click **Open**, edit in SysON, then click **Save**.
4. Review `git diff` before committing.

Do not use SysON’s homepage **Download** (JSON zip). **Save** writes textual `.sysml` back into `architecture/`.

Agents: `python doqs/scripts/syson.py ui` (do not run `syson.bat`).

## Where to read

| Doc | Use |
| --- | --- |
| `docs/architecture.md` | Human overview (SysML remains authoritative) |
| `doqs/docs/architecture.md` | Canonical DOQS spec |
| `.agents-local/skills/patterns/SKILL.md` | Project-specific reusable patterns |
| `docs/decisions/` | Past technical decisions (ADRs) |
| `docs/mistakes/` | What went wrong and how to avoid it |
| `docs/log/` | Chronological activity log |
| `.agents/` | Shared agent rules and skills (refaqt-agents) |

## Cursor / Agent

Root `AGENTS.md` is the entry point. Shared rules/skills live in `.agents/`; Cursor adapters live under `.cursor/rules/`. Prefer project guidance over duplicate User Rules in Settings.

# ADR-001 — Adopt DOQS layout and tooling submodules

- **Date:** 2026-09-02
- **Status:** Accepted

## Context

Aqurate is a new Refaqt machine repository for a positioning and error-motion measurement system. Sibling projects (qarve, aqtuator) already use the Documentation System (DOQS) and the shared refaqt-agents kit. Starting without that layout would force a later migration of paths, licences, and agent rules.

## Decision

1. Treat the repository root as the top-level DOQS module, with the standard first-level folders from `doqs/docs/architecture.md`.
2. Mount [refaqt/doqs](https://github.com/refaqt/doqs) at `doqs/` and [refaqt/refaqt-agents](https://github.com/refaqt/refaqt-agents) at `.agents/`, both with `branch = main`.
3. Copy setup helpers to the repo root (`setup-tooling.sh` / `.bat`) and keep repo-specific agent rules under `.agents-local/`.
4. Use the machine-repo split licence (CERN-OHL-S hardware, GPL-3.0 firmware/software/simulation, CC BY-SA docs/measurement).

## Consequences

- Agents run `bash setup-tooling.sh` from the repo root before reading shared rules.
- Validators (`python doqs/scripts/validate_all.py`) and `apply_licenses.py` are the PR gates.
- Sub-assemblies can be added later under `modules/` without changing the root layout.
- Extracted modules can become their own Git repos and return as submodules at the same path.

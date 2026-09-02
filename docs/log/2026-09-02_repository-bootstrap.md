# 2026-09-02 — Repository bootstrap

**Role(s):** engineering

## Goal

Initialize the Aqurate repository as a DOQS machine consumer with `doqs/` and `.agents/` tooling submodules.

## Work Done

- Mounted [refaqt/doqs](https://github.com/refaqt/doqs) at `doqs/` and [refaqt/refaqt-agents](https://github.com/refaqt/refaqt-agents) at `.agents/`, both tracking `main`.
- Copied root helpers (`setup-tooling.sh` / `.bat`, `syson.sh` / `.bat`) from `doqs/templates/`.
- Scaffolded the standard first-level folders (`bom/`, `cad/`, `architecture/`, `docs/`, `manufacturing/`, `simulation/`, `measurement/`, `modules/`, `firmware/`, `software/`, `builds/`, `graph/`).
- Added root `okh.toml`, split-licence kit, Cursor adapters, and `.agents-local/` rules.

## Decisions Made

- See `docs/decisions/2026-09-02_adopt-doqs-layout.md`.

## Open Questions

- [ ] Initial module set and measurement campaign list.
- [ ] Storage backend for raw measurement data (`$AQURATE_DATA_ROOT`).

## Next Steps

- [ ] Add FreeCAD assemblies and LFS-tracked binaries.
- [ ] Fill `architecture/machine.sysml` with real requirements as the design starts.

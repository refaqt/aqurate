---
name: project-patterns
description: >-
  Reusable DOQS/Aqurate patterns — validators, licences, OKH. Load before
  implementing or after a novel fix.
---

# Project patterns (Aqurate / DOQS)

Reusable patterns specific to this repository. Check before implementing; update when a pattern changes.

## Validate before commit

**When to use:** After editing any `okh.toml`, build lockfile, SysML import, or first-level directory.

**Pattern:**

```powershell
python doqs/scripts/validate_all.py
python doqs/scripts/build_graph.py
```

**Gotchas:** Run from repository root. `doqs/` must be initialized as a submodule at `aqurate/doqs/`. After adding a first-level content directory, run `python doqs/scripts/apply_licenses.py` first; it must not rewrite `.agents/` or `doqs/`.

**Last used:** 2026-09-02 repository bootstrap

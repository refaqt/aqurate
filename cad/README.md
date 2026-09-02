# Top-level CAD

- **FreeCAD:** v1.1+ with built-in Assembly workbench.
- **Relative paths:** `Edit → Preferences → General → Document → Use relative paths when saving external links`.

## Paths

| Path | Purpose |
|------|---------|
| `assemblies/` | Top assembly and sub-assemblies (future) |
| `parts/` | Manufactured and purchased part models |
| `exports/` | `.step`, `.stl` committed after significant changes |
| `params/` | Parametric model CSVs (`default.csv` plus named overrides) |

Binary `.FCStd` / `.stl` use Git LFS (see root `.gitattributes`). Agents must not create or edit `.FCStd` files.

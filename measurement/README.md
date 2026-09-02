# Measurement

Physical test campaigns for positioning and error-motion characterisation. See [`doqs/docs/architecture.md`](../doqs/docs/architecture.md) (Measurement section) for the folder convention.

`simulation/` predicts; `measurement/` records what the hardware actually did.

## Layout

| Path | Purpose |
|------|---------|
| `cases/` | Campaign definitions (protocol, channel map, sensor config) |
| `results/` | Committed summaries; raw data lives in external storage |
| `data-index.csv` | Manifest of files held outside Git |

## Where the data lives

Raw measurement data is **not in this repository**. Declare the storage backend, root path or bucket, and access path here when the first campaign is recorded. Consumers should resolve the root from an environment variable (suggested: `$AQURATE_DATA_ROOT`) rather than a hardcoded mount.

Columns in [`data-index.csv`](data-index.csv) are the seven doqs-standard ones: `campaign`, `relpath`, `tier`, `bytes`, `sha256`, `recorded_utc`, `notes`. Extra columns may be appended later.

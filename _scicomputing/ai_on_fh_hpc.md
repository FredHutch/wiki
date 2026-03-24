---
title: AI Usage on Fred Hutch HPC
main_authors: tefirman, vortexing, bmcgough
---

## Allowed AI use

These are generally OK on the shared on‑prem HPC cluster, assuming users follow data‑classification rules:

- Using locally installed, offline models (e.g., PyTorch/Transformers models) that do not initiate outbound network connections and do not upload data to external services.
- Fine‑tuning or inference on open‑source models where all weights, code, and tooling are stored on internal storage and run entirely on the cluster, with outbound network access disabled.
- Standard ML/DL workflows (training, evaluation, hyper‑param tuning) using cluster resources, as long as data is permitted for that environment under your organization’s data‑classification policy.
- Use of internal, institution‑hosted AI services that have gone through your security/software review and have an approved data‑use profile.
- For any use involving protected or restricted data classifications, staff should request an AI Review (AIR) before starting the work.

## Explicitly prohibited

To reduce security and compliance risk, the following are not allowed:

- Any use of DeepSeek (models, APIs, websites, or wrapped tools), consistent with emerging institutional and governmental bans due to surveillance and security concerns.
- Any AI tool, application, library, or model that sends prompts, data, or metadata to external servers (“phones home”), whether via HTTP(S), telemetry, “usage analytics,” auto‑update checks, or background sync processes.
- Using public cloud AI APIs (e.g., external LLM endpoints) directly from the HPC cluster, even for “test” data, unless there is a formally approved, documented exception.
- Entering restricted or protected data into any AI system that has not been explicitly authorized for that data classification by your AIR or equivalent governance process.



---
title: AI Usage on Fred Hutch HPC
main_authors: tefirman, vortexing, bmcgough
---

AI tools are increasingly valuable for research applications, from model training to code development. The guidance below is intended to help researchers use these tools effectively in the context of Fred Hutch HPC resources while managing security, compliance, and intellectual property considerations.

## Allowed AI Use

The following applications are generally OK on the shared on‑prem HPC cluster, assuming users follow data‑classification rules:

- Using locally installed, offline models (e.g., PyTorch/Transformers models) that do not initiate outbound network connections and do not upload data to external services.
- Fine‑tuning or inference on open‑source models where all weights, code, and tooling are stored on internal storage and run entirely on the cluster, with outbound network access disabled.
- Standard ML/DL workflows (training, evaluation, hyperparameter tuning) using cluster resources, as long as data is permitted for that environment under your organization's data‑classification policy.
- Use of internal, institution‑hosted AI services that have gone through your security/software review and have an approved data‑use profile.
- For any use involving protected or restricted data classifications, staff should request an [AI Review (AIR)](https://centernet.fredhutch.org/u/data-science-lab/data-governance/ai/artificial-intelligence-review.html) before starting the work.

## Explicitly Prohibited

To reduce security and compliance risk, the following are not allowed:

- Any use of DeepSeek (models, APIs, websites, or wrapped tools), consistent with emerging institutional and governmental bans due to surveillance and security concerns.
- Any AI tool, application, library, or model that sends prompts, data, or metadata to external servers ("phones home"), whether via HTTP(S), telemetry, "usage analytics," auto‑update checks, or background sync processes.
- Using public cloud AI APIs (e.g., external LLM endpoints) directly from the HPC cluster, even for "test" data, unless there is a formally approved, documented exception.
- Entering restricted or protected data into any AI system that has not been explicitly authorized for that data classification by your AIR or equivalent governance process.

## AI-Generated Code on Fred Hutch HPC Resources

Code generated with the help of AI tools — once it has been thoroughly reviewed by the responsible researcher and is running in an environment with no connection to external AI services — should be treated the same as any other code. If you have used AI tools to help write code and you want to run that code on the HPC cluster with sensitive data:

1. **Review the code thoroughly.** Understand what every line does. Do not run AI-generated code you haven't vetted.
2. **Ensure the code is fully disconnected from the AI tool.** No API calls, telemetry, or dependencies that phone home to external AI services.
3. **Follow all standard data-classification rules** for the environment and dataset you are working with.
4. **Request an [AI Review (AIR)](https://centernet.fredhutch.org/u/data-science-lab/data-governance/ai/artificial-intelligence-review.html)** if your use case involves protected or restricted data, as with any other workflow.

When it comes to workflow automation, AI tools should be used to *generate* workflow artifacts (e.g., [WDL](/datascience/wdl_workflows/) or [Nextflow](/compdemos/nextflow/) scripts) rather than to directly submit or manage jobs on the cluster. This ensures that a human reviews the workflow before it consumes shared resources, and it produces a publishable, reproducible artifact rather than a series of ad-hoc job submissions.

## Intellectual Property and Copyright Considerations

Under current guidance, code that is purely AI-generated generally cannot be copyrighted. This has practical implications for researchers:

- **If you have proprietary methods or IP you want to protect**, be cautious about providing that code or detailed descriptions of it to public AI tools. Content you submit may be used for model training, and the AI-generated output may not be eligible for copyright protection.
- **If you are comfortable with your code being fully open source** (e.g., released under an MIT license), then the copyright limitation is largely a non-issue, and AI-assisted development can be used freely (subject to the data-protection and review requirements above).
- **When in doubt**, consult with the [Data Protection group](https://centernet.fredhutch.org/u/data-science-lab/data-governance/ai.html) to understand the implications for your specific project.

---
title: How you can use cBioPortal
last_modified_at: 2025-04-15
main_authors: sitapriyamoorthi
primary_reviewers: tfirman, laderast  
---

cBioPortal offers countless ways to explore and interpret cancer genomics data—**without needing to code**. Below, we walk through a series of research questions using *KRAS* as an example gene to show how to use public datasets to uncover meaningful insights.

> 📝 *Note: These examples use the public cBioPortal instance but can be replicated on the [Fred Hutch instance](https://cbioportal.fredhutch.org/) as well.*

### Example: Investigating KRAS in Cancer

#### **Q1: How often is KRAS mutated in cancer?**

- Visualize different mutations across colorectal, lung, and pancreatic cancers in this [oncoprint](https://www.cbioportal.org/results/oncoprint?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival) → *KRAS is mutated in 26% of patients.*
  
![oncoprint_kras_different_studies](/datademos/assets/cbio_01_oncoprint_kras_different_studies.png)

- Explore mutation types using [lollipop plots](https://www.cbioportal.org/results/mutations?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival) → *KRAS G12 position is mutated most frequently.*
  
![KRAS_lollipop](/datademos/assets/cbio_02_KRAS_lollipop.png) 

- Access [OncoKB and COSMIC](https://www.cbioportal.org/results/mutations?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival) annotations for each variant → *Most KRAS G12 mutations are oncogenic.*
  
![KRAS_oncokb](/datademos/assets/cbio_03_KRAS_oncokb.png)

---

#### **Q2: Are KRAS mutations associated with clinical factors?**

- Add [tracks for clinical correlates](https://www.cbioportal.org/results/oncoprint?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival) such as smoking history to an oncoprint to explore their relationship with genomic data → *KRAS mutations occur more frequently in patients with a history of smoking.*

![KRAS_clinical_covariates](/datademos/assets/cbio_04_KRAS_clinical_covariates.png)

- Use the [plots tab](https://www.cbioportal.org/results/plots?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&plots_horz_selection=%7B%22dataType%22%3A%22clinical_attribute%22%2C%22selectedDataSourceOption%22%3A%22SMOKING_HISTORY%22%7D&plots_vert_selection=%7B%22selectedGeneOption%22%3A3845%2C%22dataType%22%3A%22MUTATION_EXTENDED%22%2C%22mutationCountBy%22%3A%22MutationType%22%7D&plots_coloring_selection=%7B%22colorByCopyNumber%22%3A%22false%22%2C%22colorBySv%22%3A%22false%22%7D) to correlate clinical variables with mutation status → *Patients with a history of smoking have more KRAS mutations.*

![KRAS_clinical_mut](/datademos/assets/cbio_05_KRAS_clinical_mut.png)

---

#### **Q3: Do KRAS mutations co-occur with other mutations?**

- Use the [mutual exclusivity tool](https://www.cbioportal.org/results/mutualExclusivity?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS%250AEGFR%250ACDKN2A&comparison_subtab=clinical&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20) to examine co-mutations or exclusivity→ *KRAS mutations are exclusive from other common driver gene mutations.*
  
![KRAS_cooccurence](/datademos/assets/cbio_06_KRAS_cooccurence.png)

---

#### **Q4: Do KRAS mutations affect survival?**

- View [overall survival](https://www.cbioportal.org/results/comparison?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival) differences between KRAS-mutant and wild-type tumors → *Patients with mutant KRAS have lower overall survival.*
  
![KRAS_OS](/datademos/assets/cbio_07_KRAS_OS.png)

- Explore [disease-free survival](https://www.cbioportal.org/results/comparison?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20) → *Patients with mutant KRAS have lower disease-free survival.*
  
![KRAS_DFS](/datademos/assets/cbio_08_KRAS_DFS.png)

---

### More Ways to Use cBioPortal

- 🔬 [**Pathway analysis**](https://www.cbioportal.org/results/pathways?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20): Explore how mutations impact KRAS-related signaling pathways.
- 🧬 [**Copy number analysis**](https://www.cbioportal.org/results/cnSegments?cancer_study_list=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga&tab_index=tab_visualize&profileFilter=mutations%2Cgistic%2Ccna%2Cstructural_variants&case_set_id=all&Action=Submit&gene_list=KRAS&comparison_subtab=survival&Z_SCORE_THRESHOLD=2.0&RPPA_SCORE_THRESHOLD=2.0&geneset_list=%20): Compare CNAs in KRAS mutant vs. wild-type tumors.
- 🧑‍🤝‍🧑 [**Custom cohort building**](https://www.cbioportal.org/study/summary?id=nsclc_tcga_broad_2016%2Cpaad_tcga%2Ccoadread_tcga): Focus on subsets (e.g., smokers with KRAS mutations).
- ⏳ **Tumor evolution**: Analyze multi-sample progression from the same patient.
- 🛡️ **Immuno-genomics**: Study KRAS links to immune response (e.g., mutational burden).

---

↩️ [Back to: What is cBioPortal?](/datascience/fh-cbio-intro#what-is-cbioportal)

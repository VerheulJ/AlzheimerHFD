# AlzheimerHFD
QIIME2 Microbiome Analysis — V3–V4 16S Region

This repository contains the core data and outputs from a 16S rRNA microbiota analysis based on the V3–V4 region (primers 341F–806R), performed using the QIIME2 platform (version 2023.5.0).

The dataset corresponds to [breve descripción del experimento: por ejemplo, "gut microbiota profiles in experimental rat groups subjected to different treatments"].
o identify network modules linking gut microbial taxa, discriminant metabolites, and protein interaction networks related to AD pathology. The ultimate goal is to reveal novel functional pathways and molecular intermediaries involved in the brain–gut axis modulation of cerebral amyloidosis.


🗂️ Repository Contents

    metadata.tsv — Sample metadata including genotype, diet group, and sample identifiers.

    feature-table.qza — ASV abundance table generated via QIIME2 DADA2 pipeline.

    taxonomy.qza — Taxonomic classification of bacterial ASVs using SILVA 138.1 reference database.

    taxa-bar-plots.qzv — Interactive QIIME2 visualization of taxonomic distributions.

    metabolomics_plasma.csv — Normalized table of discriminant plasma metabolites.

    metabolomics_feces.csv — Normalized table of discriminant fecal metabolites.

    ppi_networks/ — Folder containing PPI network modules derived from metabolite-linked proteins.

    ZS_output/ — Output from ZS Revelen enrichment and virtual pulldown analyses.

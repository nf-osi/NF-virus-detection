
# Biomedical Data Science Project Template
What this project is: A template project for biomedical data science projects with template R markdown files.

What this project isn't: A codebase for running analyses.

## Template structure
`/analysis`: Contains all code notebooks and rendered `html` notebooks.

`/figures`: You could, if you like, store rendered results from your analyses here, so that you can find them when it's time to publish!

`/data`: Where is `/data`? It's a better practice to store the data on Synapse, in the challenge project, so that others can reference the data if they so choose. 

## Using github.io
As seen in the table below, you can optionally and ideally knit your code notebooks to html so that they can be displayed on github.io. In order to set this up, you should enable Github Pages in the Settings for your project, and configure it to use the `gh-pages` branch as source. Once you've done this, any `html` files in the `gh-pages` branch will be rendered on github.io. 

-----

# Your Project Name Here
An area of recent interest in cancer is the potential impact of genomic alterations caused by viral infection. There are well-known associations between viral infection and cancer development (human papilloma virus and cervical cancer, Epstein-Barr virus and lymphoma), but recent evidence indicates that there are more associations than were previously thought. Using genomics (RNAseq, whole genome sequencing) datasets, research groups have uncovered an array of viruses associated with a broad swath of tumors:
* Zapatka et al, “The landscape of viral associations in human cancers” https://www.nature.com/articles/s41588-019-0558-9
* Salyakina et al, “Viral expression associated with gastrointestinal adenocarcinomas in TCGA high-throughput sequencing data” https://pubmed.ncbi.nlm.nih.gov/24279398 
* Tang et al “The landscape of viral expression and host gene fusion and adaptation in human cancer” https://www.nature.com/articles/ncomms3513 

Our group studies neurofibromatosis, a family of rare diseases (neurofibromatosis type 1, NF1; neurofibromatosis type 2, NF2; schwannomatosis, SWN) that predispose patients to a wide variety of benign and malignant tumors (e.g. cutaneous neurofibromas - cNF, plexiform neurofibromas - pNF, malignant peripheral nerve sheath tumors - MPNSTs, in NF1; schwannomas and meningiomas in NF2, schwannomas in schwannomatosis). Furthermore, we have ‘omics (RNAseq, whole exome sequencing, whole genome sequencing) datasets for many of these tumor types. However, despite substantial circumstantial evidence (e.g. cNF tumor formation associated with skin damage, most tumors having profound immune cell infiltration phenotypes), to our knowledge, the potential presence of or impact of viruses on NF-related tumors has been investigated. In this project, we plan to investigate the presence of viral sequences in NF-related tumors, starting with cNF and pNF. 

**Hypothesis:**

cNF and pNF tumors are associated with one or more viruses, and viral sequences will be detectable in ‘omics data from patient tumor samples.

## Analyses
Here's a summary of the analyses we've run so far. 

|analysis|description|
|--|--|
|[Determining top performers](https://sage-bionetworks-challenges.github.io/challenge-analysis/analysis/determine-top-performers.html)|A one-line description of this analysis.|
|[Comparison to baseline/comparator model](https://sage-bionetworks-challenges.github.io/challenge-analysis/analysis/compare-models-to-baseline.html)|A one-line description of this anaylsis.|

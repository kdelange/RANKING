# RANKING
## Targeted RNA-sequencing enables detection of relevant translocations and single nucleotide variants and provides an alternative method for leukemia classification, called RANKING

Based on expression profiling we used machine learning (desicion tree) to predict the type of leukemia, called RANKING (expRession profiling for clAssificatioN of leuKemias using modellING).

In order to use RNAKING you need a X number of patients with a known hematological malignancy, to train your decision tree.

Input: a HTseq count file, filtered by the genes of interest and normalised. Containing samples with known hematological malignancy and novel patients without diagnosis.

1. do PCA analysis with all patients. => PCA_analysis.R

2. Using only the patient with known hematological malignancy, create a decision tree using PCA values. => decisionTree.R
  Using the generated decision tree, predict the dianosis of the novel patients.

3. Plot the relative expression of genes of interst in a boxplot. => boxplot.R
  Make sure to divide patients based on predicted diagnosis. 
  For example EVI1 will only show over-expression when grouped with AML patients.


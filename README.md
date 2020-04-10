# RANKING
## Targeted RNA-sequencing enables detection of relevant translocations and single nucleotide variants and provides an alternative method for leukemia classification, called RANKING

Based on expression profiling we used machine learning (desicion tree) to predict the type of leukemia, called RANKING (expRession profiling for clAssificatioN of leuKemias using modellING).

In order to use RANKING a set of patients with a known hematological malignancy is nesseccary. 
  - HTseq count file, filtered by the genes of interest and normalised.
  - txt file with the known type of leukemia of the patients patients, and if this is known, the over-expression of relevant            genes.  
  
1. Do PCA analysis. => PCA_analysis.R

  Generate the principal components of all patients. Determine which components are most relevant. Make nice plots visualizing the data.

2. Create a decision tree using PCA values. => decisionTree.R
  
  Divide the patients in a train and a test set. Train the desicion tree with the training samples. Test the desicion tree with the test samples.

3. Plot the relative expression of genes of interst in a boxplot. => boxplot.R
  
  Make sure to divide patients based on predicted diagnosis, determined by the desicion tree. 
  AML patients with EVI1 over-expression will only show significant EVI1 over-expression when grouped with AML patientes.


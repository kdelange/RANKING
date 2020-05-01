# RANKING
## Targeted RNA-sequencing enables detection of relevant translocations and single nucleotide variants and provides an alternative method for leukemia classification, called RANKING

Based on expression profiling we used machine learning to predict the type of leukemia, called RANKING (expRession profiling for clAssificatioN of leuKemias using modellING).

In order to use RANKING a set of patients with a  hematological malignancy, classified accordingly to current methods, is necessary.
* HTseq count file, filtered by the genes of interest and normalised.
* txt file with the known type of leukemia of the patients, and if this is known, the over-expression of relevant genes.  
 

1. Do PCA analysis. => PCA_analysis.R
Generate the principal components of all patients. Determine which components are most relevant. Link the principal components to the known type of leukemia, and plot the data. The plots will show already that patients with similar types of leukemia will cluster together.

2. Create a decision tree using PCA values. => decisionTree.R
Divide the PCA data of the patients in a validation and an application set. Train the decision tree with the validation samples. Test the decision tree with the application samples.

3. Plot the relative expression of genes of interest in a boxplot. => boxplot.R
Make sure to group the patients based on (predicted) diagnosis, determined by the decision tree.
AML patients positive for EVI1 over-expression will only show significant EVI1 over-expression when grouped with AML patientes.

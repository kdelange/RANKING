## @ param expression.data is a normalised HTseq count file, filterd on only the genes of intrest. The samples are in the first row.
## @ param information.table dataframe containing per sample information (diagnosis, over-expression positive or negative of genes of intrest) and color linked to that information.
## @ param gene.of.intrest an ENSG number of the gene of intrest (ENSG00000085276 for EVI1)
## @ param indicationEVI1 indication of all patients, AML+ EVI1 over-expression positive AML samples.
## @ param EVI1 EVI1 positive samples (red) and EVI1 negative samples (black).

library(ggplot2)

expression.data <- data.frame(expression.data)

# EVI1
boxplot <- ggplot() + 
  stat_boxplot(geom = 'errorbar', aes(x=information.table$indicationEVI[information.table$indicationEVI != "AML+"], 
                                      y= expression.data$gene.of.intrest[information.table$indicationEVI != "AML+"])) +
  geom_boxplot(fill = "white", outlier.size = -1, outlier.colour = NULL, aes(x=information.table$indicationEVI[information.table$indicationEVI != "AML+"], 
                                                                             y= expression.data$gene.of.intrest[information.table$indicationEVI != "AML+"])) + 
  geom_dotplot(aes(fill = matrix(information.table$EVI1),
              color = matrix(information.table$EVI1),
              x= matrix(information.table$diagnosis),
              y=matrix(expression.data$gene.of.intrest)),
              binaxis = 'y',
              stackdir = 'center',
              dotsize = 0.3,
              binwidth = 0.5,
              position = position_dodge(0.8)) +
  scale_color_manual(values =  c("black", "red"), aesthetics = "color") + 
  scale_fill_manual(values =  c("black", "red"), aesthetics = "fill")+
  theme_minimal()
print(boxplot)



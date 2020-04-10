## For the PCA analyses the build in fuction prcomp() in R is used.
## @ param expression.data is a normalised HTseq count file, filterd on only the genes of intrest. The samples are in the first row.
## @ param information.table dataframe containing per sample information (diagnosis, over-expression positive or negative of genes of intrest) and color linked to that information.

library(ggbiplot)
library(ggplot2)

##Generate PCA information.
expression.data.pca <- prcomp(expression.data, center = TRUE, scale. = TRUE)
summary(expression.data.pca)

## Generate a line plot to see which principal component explain most of you variation in you data. 
plot(expression.data.pca, type = "l")

##  Genarate a PCA plot with two principal components of your choice.
expression.data.pca.plot <- ggbiplot(expression.data.pca,
                                             choices = c(1,2),
                                             obs.scale = 1,
                                             var.scale = 1,
                                             groups = as.character(information.table_subset$diagnosis),
                                             color = as.character(information.table$color),
                                             ellipse = TRUE,
                                             circle = FALSE,
                                             varname.size = 0,
                                             varname.adjust = 20,
                                             var.axes = FALSE)+
  geom_point(aes(shape = information.table_subset$diagnosis, color = information.table_subset$diagnosis), size = 3) +
  scale_shape_manual(name="Subclassification of\nhematological malignancies", values = c(15, 16, 17, 17, 17, 17)) +
  scale_color_manual(name="Subclassification of\nhematological malignancies", values = c("forestgreen", "navyblue", "gold2", "orange2", "orangered2", "firebrick4"))+
  coord_equal(xlim=c(-30,30), ylim = c(-30,30))+
  theme_minimal()
print(expression.data.pca.plot)

## Generate a plot with multiple principal componenets compared to each other. 
## The first 5 principal componenet in evenry possible combination are plotted. Different combinations are possible.
pairs(print(expression.data.pca$x[,1:5], 
      upper.panel = NULL, 
      main = "Subclassification of\nHematological malignancies", 
      pch = c(15, 16, 17, 17, 17, 17)[information.table_subset$diagnosis], 
      col = matrix(information.table$color))
legend("right", legend = c("ALL", "AML", "CML", "Lymphoma", "MDS", "MPN"),
       col =  c("forestgreen", "navyblue", "gold2", "orange2", "orangered2", "firebrick4"), pch = c(15, 16, 17, 17, 17, 17))



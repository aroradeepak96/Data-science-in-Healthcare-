install.packages("readxl")
library("readxl")
df<-read_excel("Leda.Health.Internship.xlsx", sheet = 4)

# simple heatmap of correlations (without values)
heatmap(cor(mower.df[,!c(1)]), Rowv = NA, Colv = NA)

# heatmap using ggplot
# using reshape package to to generate input for the plot 
library(reshape)
cor.mat <- round(cor(df),2) # rounded correlation matrix 
cor.mat
melted.cor.mat <- melt(cor.mat) 
ggplot(melted.cor.mat, aes(x = X1, y = X2, fill = value)) + 
  scale_fill_gradient(low="wheat", high="orangered") +
  geom_tile() + 
  geom_text(aes(x = X1, y = X2, label = value)) +
  ggtitle("Which Variables Are Highly Correlated?")


# Alternative -- reports correlation coefficient
# using GGally package
ggpairs(df[, c(1,2,3,4)])
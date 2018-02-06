filename="raw_data.csv"
dataset <- read.csv(filename)
#Peak at the data
head(dataset)
#Create Standardizing function
standardize <- function(x){
  return((x-mean(x))/sd(x))
}
#call function on dataset and store it in new dataset 3A
Ndata = data.frame(standardize(dataset$A),standardize(dataset$B),standardize(dataset$C),standardize(dataset$D))
#Create boxplots of all variables in standard and original form 3B 3C
par(mfrow=c(2,4))
boxplot(dataset$A)
boxplot(dataset$B)
boxplot(dataset$C)
boxplot(dataset$D)
boxplot(Ndata$standardize.dataset.A.)
boxplot(Ndata$standardize.dataset.B.)
boxplot(Ndata$standardize.dataset.C.)
boxplot(Ndata$dataset2$standardize.dataset.D.)
#Standardized boxplots occupy have lesser range than the the original boxplots 3D
#Prepare Scatter plot of A and B 3E
attach(dataset)
plot(A,B, main = "ScatterPlot of Variable A and B", pch=19)

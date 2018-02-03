filename="twitterdata.csv"
dataset <- read.csv(filename)
#Have a peak at the data
head(dataset)
#Qns 2A and 2C data quality and distribution
library(fitdistrplus)
descdist(dataset$friends_count, discrete = TRUE)
#High skewness and kurtosis indicate the data has a lot of outliers and doesn't follow a normal distrbution and is not symmetric
#Cullen-Frey graph analysis of the data indicates that the data might follow a negative-binormial distribution
#Question 2B find summary statistics
summary(dataset$friends_count)
#3d Scatterplot 2D
library(scatterplot3d)
attach(dataset)
scatterplot3d(created_at_year,education, age, main = "3D Scatter Plot", color = "blue")
#Pie charts
par(mfrow=c(1,2))
countacc=c(650,1000,900,300,14900)
countries=c("UK","Canada","India","Australia","USA")
pct <- round(countacc/sum(countacc)*100)
lbls <- paste(countries,pct)
lbls <- paste(lbls,"%",sep = "")
pie(pct,labels = lbls, col=rainbow(length(lbls)), main="Pie Chart of Accounts By Countries %")
########
library(plotrix)
pie3D(pct,labels=countries,explode=0.4, main="3D Pie Chart ")
#Kernel density plot of created at year
kerndense <- density(as.numeric(dataset$created_at_year))
plot(kerndense, main = "Kernel Density plot of created_at_year")
polygon(kerndense,col = "cadetblue", border = "red")

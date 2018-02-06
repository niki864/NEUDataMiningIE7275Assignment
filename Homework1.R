#Load Dataset
filename="forestfires.csv"
dataset=read.csv(filename)
#Print Summary statistics and look at top few elements in dataset
summary(dataset)
head(dataset)
#Plot into one graph Qns 1A
par(mfrow=c(2,2))
plot(x=dataset$temp,y=dataset$area,col="Blue",xlab = "Temperature",ylab = "Area")
plot(x=dataset$month,y=dataset$area,col="cadetblue",xlab = "Month",ylab = "Area")
plot(x=dataset$DC,y=dataset$area,col="Green",xlab = "DC",ylab = "Area")
plot(x=dataset$RH,y=dataset$area,col="Red",xlab = "RH",ylab = "Area")
#Histogram of Wind Speeds 1B
wind <- dataset$wind
hist(wind,xlab = "Wind Speeds", main = "Histogram of Wind Speeds", col="cadetblue")
#Summary statistics 1C
summary(wind)
#Add density lines 1D
#hist(wind,xlab = "Wind Speeds", main = "Histogram of Wind Speeds", col="cadetblue", density = 6)
hist(wind,xlab = "Wind Speeds", main = "Histogram of Wind Speeds", col="cadetblue")
lines(density(wind), col="blue",lwd=2)
library(scatterplot3d)
#Plot density function 1E
#dense <- density(as.numeric(dataset$month))
#plot(dense, main = "Plot for months")
#polygon(dense, col = "red",border="blue")
library(ggplot2)
qplot(wind,data=dataset,geom = "density", color=month, main = "Density Plot of Wind Speeds By Month")
#Plot Scatter Matrix for temp, RH, DC and DMC 1F
pairs(~temp+RH+DC+DMC, data = dataset, main="Scatter Matrix")
#More correlated scatter matrix with colors
library(gclus)
matdata <- dataset[c(9,10,7,6)]
matdata.corr <- abs(cor(matdata)) #Apply correlation function
matdata.color <- dmat.color(matdata.corr) #Get colors according to correlated data
matdata.order <- order.single(matdata.corr) #Order by correlation
cpairs(matdata, matdata.order, panel.colors = matdata.color, gap=.5, main="Scatter Matrix With Variables Ordered and Colored by Correlation")
#Boxplot for wind, ISI and DC 1G
par(mfrow=c(1,3))
boxplot(dataset$wind,main="boxplot for wind")
boxplot(dataset$ISI, main="boxplot for ISI")
boxplot(dataset$DC, main="boxplot for DC")
#Histogram of DC and Log of DC 1E
par(mfrow=c(1,2))
hist(dataset$DC, main = "Histogram of DC", xlab = "DC")
hist(log(dataset$DC), xlab="Log of DC", main = "Histogram of log DC")

View(iris)

# ---------------- PLOT
# Scatter plot
plot(iris$Sepal.Length~iris$Petal.Length)

# modify labels to the X and Y and Main part 
plot(iris$Sepal.Length~iris$Petal.Length,ylab = "sepal Length", xlab ="Petal Length", 
     main = "Sepal Length vs Petal length")

# Adding colors to the graph
plot(iris$Sepal.Length~iris$Petal.Length,ylab = "sepal Length", xlab="Petal Length", 
     main="Sepal Length vs Petal length", col="blue",pch=16)

# -------------- HISTOGRAM

hist(iris$Sepal.Width)
hist(iris$Sepal.Width, xlab="Sepal width", main = "Distubation of sepal width", col="aquamarine3")

# ------------- BOXPLOT 

boxplot(iris$Sepal.Length~iris$Species)
boxplot(iris$Sepal.Length~iris$Species,xlab = "species", ylab="sepal Length", 
        mani="sepal Length of different species", col="burlywood")
 
# ------------------------------------------------------
# --------------ggplot2 Package -----------------------

#  load ggplot2 package 
library(ggplot2)

# basic call of graph 
ggplot(iris,aes(y = Sepal.Length, x = Petal.Length))+ geom_point()

# add colors to the graph by column name
ggplot(iris,aes(y = Sepal.Length, x = Petal.Length, col=Species))+ geom_point()

# add shapes to the graph by column name
ggplot(iris,aes(y = Sepal.Length, x = Petal.Length, shape=Species))+ geom_point()


# add color and shape to the graph from on column 
ggplot(iris,aes(y = Sepal.Length, x = Petal.Length, col=Species, shape=Species))+ geom_point()

# ------------------------------------------------------------------
# ------------------------------------------------------------------

library(dplyr)
house <- read.csv("house.csv")
View(house)

# -------- geom_histogram( ) 
ggplot(house,aes(x=price))+ geom_histogram()

ggplot(house,aes(x=price))+ geom_histogram(bins = 50)
# add color 
ggplot(house,aes(x=price))+ geom_histogram(bins = 50, fill="palegreen4")
# add color to bounders 
ggplot(house,aes(x=price))+ geom_histogram(bins = 50, fill="palegreen4", col="green")

# position 
ggplot(house,aes(x=price, fill=yr_built > 2000))+ geom_histogram()

ggplot(house,aes(x=price, fill=yr_built > 2000))+ geom_histogram(position = "fill")

# --------- geom_bar( )

ggplot(house, aes(x=waterfront, fill=condition))+geom_bar()
ggplot(house, aes(x=waterfront, fill=floors))+geom_bar(position = "fill")

# ---------- geom_freqpoly()

ggplot(house, aes(x=waterfront, fill=condition))+geom_freqpoly()
ggplot(house, aes(x=price, fill=condition))+geom_freqpoly(bins=60)
ggplot(house, aes(x=yr_built, col=price > 10000))+geom_freqpoly(bins=60)


# ---------- geom_boxPlot()

ggplot(house,aes(x=factor(bedrooms), y=price))+geom_boxplot()
# add colors by fill()
ggplot(house,aes(x=factor(bedrooms), y=price, fill=factor(bedrooms)))+geom_boxplot() 
ggplot(house,aes(x=factor(bedrooms), y=price, fill=yr_renovated > 2000))+geom_boxplot()


# --------- geom_smooth()

ggplot(house, aes(y=price, x=sqft_living))+geom_smooth()
# method= lm
ggplot(house, aes(y=price, x=sqft_living))+geom_point()+geom_smooth(method="lm",se=F)
# add color. 
ggplot(house, aes(y=price, x=sqft_living, col=sqft_above>1000))+
  geom_point()+
  geom_smooth(method="lm",se=F)


# --------------Facting 














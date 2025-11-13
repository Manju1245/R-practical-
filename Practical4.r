library(dplyr)
library(ggplot2)
library(modeest)

data("iris")

# Descriptive Statistics
mean(iris$Sepal.Length)             # mean
median(iris$Sepal.Length)           # median
mlv(iris$Sepal.Length, method="mfv")# mode # nolint
sd(iris$Sepal.Length)               # standard deviation
range(iris$Sepal.Length)            # min and max
summary(iris$Sepal.Length)          # summary

# Histogram
hist(iris$Sepal.Length, main="Histogram of Sepal Length", xlab="Sepal Length", col="lightblue", border="black") # nolint

# Scatterplot
plot(iris$Sepal.Length, iris$Petal.Length, main="Scatterplot of Sepal vs Petal Length", xlab="Sepal Length", ylab="Petal Length", col="blue", pch=19) # nolint

# Boxplot
boxplot(Sepal.Length ~ Species, data=iris, main="Boxplot of Sepal Length by Species", xlab="Species", ylab="Sepal Length", col=c("lightgreen", "lightblue", "pink")) # nolint


# Exercise Questions

# Qs 1 -------------------->
data("iris")
mean(iris$Petal.Width)              # mean
median(iris$Petal.Width)            # median
mlv(iris$Petal.Width, method="mfv") # mode
sd(iris$Petal.Width)                # standard deviation

# Qs 2 -------------------->
data("mtcars")
hist(mtcars$mpg, main="Histogram of mpg", xlab="mpg", col="lightblue", border="black") # nolint

# Qs 3 -------------------->
data("mtcars")
plot(mtcars$hp, mtcars$mpg, main="Scatterplot of hp vs mpg", xlab="hp", ylab="mpg", col="red", pch=19) # nolint

# Qs 4 -------------------->
data("airquality")
boxplot(Ozone ~ Month, data=airquality, main="Boxplot of Ozone by Month", xlab="Month", ylab="Ozone", col=c("maroon", "lightgreen", "lightyellow")) # nolint

# Qs 5 -------------------->
var(iris$Sepal.Width)

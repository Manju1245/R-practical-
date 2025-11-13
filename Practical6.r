library(dplyr)
library(ggplot2)
library(GGally)
library(ggcorrplot)

# Load dataset
data("iris")
head(iris)

# 1. Summary statistics
summary(iris)

# 2. Histogram of Sepal.Length
ggplot(iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20, fill = "lightblue", color = "black") +labs(title = "Distribution of Sepal Length", x = "Sepal Length", y = "Frequency") # nolint

# 3. Scatterplot Sepal. Length vs Petal. Length
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point(size = 3) + labs(title = "Sepal Length vs Petal Length") # nolint

# 4. Boxplot of Sepal. Width by Species
ggplot (iris, aes(x = Species, y = Sepal.Width, fill = Species)) + geom_boxplot() + labs(title = "Boxplot of Sepal Width by Species") # nolint

# 5. Correlation matriz
corr_matrix <- cor(iris[, 1:4]) # nolint
corr_matrix
ggcorrplot(corr_matrix, lab = TRUE, title = "Correlation Matrix Heatmap")


# 6. Pair plot
ggpairs(iris[, 1:4])



# Exercise Questions --------------------------------------------->

# Qs 1 ----------------------------------------------------------->
data("mtcars")
ggplot(mtcars, aes(x = mpg)) + geom_histogram(bins = 20, fill = "skyblue", color = "black") + labs(title = " Qs 1 - Distribution of MPG", x = "Miles per Gallon (mpg)", y = "Frequency") # nolint

# Qs 2 ----------------------------------------------------------->
data("mtcars")
ggplot(mtcars, aes(x = wt, y = hp)) + geom_point(color = "darkblue", size = 3) + labs(title = "Qs 2 - Horsepower vs Weight", x = "Weight (1000 lbs)", y = "Horsepower") # nolint

# Qs 3 ----------------------------------------------------------->
data("airquality")
ggplot(airquality, aes(y = Ozone)) + geom_boxplot(fill = "lightgreen", color = "black") + labs(title = "Qs 3 - Boxplot of Ozone Levels", y = "Ozone (ppb)") # nolint

# Qs 4 ----------------------------------------------------------->
data("iris")
correlation_value <- cor(iris$Sepal.Length, iris$Sepal.Width)
print(correlation_value)

# Qs 5 ----------------------------------------------------------->
data("mtcars")
ggpairs(mtcars[, 1:4])

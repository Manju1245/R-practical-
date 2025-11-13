library(dplyr)
library(caret)

# Load dataset
paste("Loading dataset---------->")
data("mtcars")
head(mtcars)


cat(paste("\n1 - Binning: Categorize mpg into Low, Medium, \n"))
mtcars$mpg_category <- cut(mtcars$mpg, breaks = c(-Inf, 15, 25, Inf), labels = c("Low", "Medium", "High")) # nolint
table(mtcars$mpg_category)


cat(paste("\n2 - Encoding: Convert Species to numeric codes (iris dataset)\n"))
data("iris")
iris$Species_code <- as.numeric(as.factor(iris$Species))
head(iris[, c("Species", "Species_code")])


cat(paste("\n3 - Normalization: Scale wt (weight) column\n"))
mtcars$wt_normalized <- (mtcars$wt - min(mtcars$wt)) / (max(mtcars$wt)- min(mtcars$wt)) # nolint
head(mtcars$wt_normalized)


cat(paste("\n4 - Standardization: Z-Score for hp (horsepower)\n"))
mtcars$hp_zscore <- scale(mtcars$hp)
head(mtcars$hp_zscore)


cat(paste("\n5 - Feature creation: Power to weight ratio\n"))
mtcars$power_wt <- mtcars$hp / mtcars$wt
head(mtcars$power_wt)



# Exercise Questions -------------------------------------->

# Qs 1 ---------------------------------------------------->
data("iris")
iris$Sepal.length_category <- cut(iris$Sepal.Length, breaks = 3, labels = c("Short", "Medium", "Long")) # nolint
head(iris[, c("Sepal.Length", "Sepal.length_category")])

# Qs 2 ---------------------------------------------------->
data("iris")
iris_dummy <- cbind(iris[, 5], model.matrix(~ Species - 1, data = iris))
head(iris_dummy)

# Qs 3 ---------------------------------------------------->
data("mtcars")
mtcars$mpg_normalization <- (mtcars$mpg - min(mtcars$mpg)) / (max(mtcars$mpg) - min(mtcars$mpg)) # nolint
head(mtcars$mpg_normalization)

# Qs 4 ---------------------------------------------------->
data("iris")
iris$sw_standardized <- scale(iris$Sepal.Width)
head(iris$sw_standardized)

# Qs 5 ---------------------------------------------------->
data("mtcars")
mtcars$efficiency <- mtcars$mpg / mtcars$hp 
head(mtcars$efficiency)

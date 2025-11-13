library(dplyr)

# Load iris dataset
data("iris")

# 1. t-test: Compare Sepal. Length of setosa and versicolor
t_test_result <- t.test(Sepal.Length ~ Species, data = iris %>% filter (Species %in% c("setosa", "versicolor"))) # nolint
t_test_result

# 2. ANOVA: Compare Sepal. Length across all species
anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)

# 3. Correlation: Sepal. Length and Petal. Length
correlation <- cor(iris$Sepal.Length, iris$Petal.Length)
correlation

# 4. Correlation test with significance
cor_test <- cor.test(iris$Sepal.Length, iris$Petal.Length)
cor_test


# Exercise Question ---------------------->

# Qs 1 ----------------------------------->
data("mtcars")
t_test_result <- t.test(mtcars$mpg, mu = 20)
t_test_result

# Qs 2 ----------------------------------->
data("iris")
anova_model <- aov(Petal.Width ~ Species, data = iris)
summary(anova_model)

# Qs 3 ----------------------------------->
data("mtcars")
correlation_value <- cor(mtcars$mpg, mtcars$hp)
correlation_value

# Qs 4 ----------------------------------->
data("iris")
t_test_paired <- t.test(iris$Sepal.Length, iris$Sepal.Width, paired = TRUE)
t_test_paired

# Qs 5 ----------------------------------->
data("airquality")
airquality_clean <- na.omit(airquality) # Remove missing values to avoid NA errors # nolint
cor_test_result <- cor.test(airquality_clean$Ozone, airquality_clean$Temp)
cor_test_result

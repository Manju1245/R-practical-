library(dplyr)
library(ggplot2)


# Load dataset
data("mtcars")
head(mtcars)

# 1. Simple Linear Regression: mpg predicted by wt
model_simple <- lm(mpg ~ wt, data = mtcars)
summary(model_simple)

# 2. Plot regression line
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point(color = "blue") + geom_smooth(method = "lm", se = TRUE, color = "red") + labs(title = "Simple Linear Regression: MPG vs Weight", x = "Weight (1000 lbs)", y = "Miles per Gallon") # nolint

# 3. Multiple Linear Regression: mpg predicted by wt and hp
model_multiple <- lm(mpg ~ wt + hp, data = mtcars)
summary(model_multiple)

# 4. Residual diagnostics
plot(model_multiple, which = 1) # Residuals vs Fitted
plot(model_multiple, which = 2) # Q-Q Plot




# Exercise Question ----------------------------->

# Qs 1 ------------------------------------------>
cat(paste("\nQuestion 1 ---------->\n"))
data("iris")
model1 <- lm(Petal.Length ~ Sepal.Length, data = iris)
summary(model1)

# Qs 2 ------------------------------------------>
cat(paste("\nQuestion 2 ---------->\n"))
data("mtcars")
model2 <- lm(mpg ~ wt + hp + drat, data = mtcars)
summary(model2)

# Qs 3 ------------------------------------------>
cat(paste("\nQuestion 3 ---------->\n"))
r2 <- summary(model2)$r.squared
adj_r2 <- summary(model2)$adj.r.squared
cat("R²:", r2, "\nAdjusted R²:", adj_r2, "\n")

# Qs 4 ------------------------------------------>
cat(paste("\nQuestion 4 ---------->\n"))
plot(model1$residuals, main = "Qs 4 - Residuals of Petal.Length ~ Sepal.Length", ylab = "Residuals", xlab = "Index", col = "blue", pch = 19) # nolint
abline(h = 0, col = "red", lwd = 2)

# Qs 5 ------------------------------------------>
cat(paste("\nQuestion 5 ---------->\n"))
data("airquality")
airquality_clean <- na.omit(airquality) # Remove missing values
model3 <- lm(Ozone ~ Temp, data = airquality_clean)
summary(model3)

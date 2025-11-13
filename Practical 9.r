library(dplyr)
library(caret)
library(rpart)
library(rpart.plot)
library(pROC)
library(ggplot2)


# Load dataset
data("iris")

# Convert to binary classification: setoso vs non_setosa
iris_bin <- iris %>% mutate(Species = factor(ifelse(Species == "setosa", "setosa", "non_setosa"), levels = c("non_setosa","setosa"))) # nolint

# Train-test split
set.seed(123)
idx <- createDataPartition(iris_bin$Species, p = 0.7, list = FALSE)
trainData <- iris_bin[idx, ] # nolint
testData <- iris_bin[-idx, ] # nolint

# 1. Logistic Regression
log_model <- glm(Species ~ Sepal.Length + Petal.Length, data = trainData, family = binomial()) # nolint
log_prob <- predict(log_model, testData, type = "response")
log_class <- ifelse(log_prob > 0.5, "setosa", "non_setosa")
confusionMatrix(factor(log_class, levels=levels(testData$Species)), testData$Species) # nolint

# ROC Curve
roc_obj <- roc(testData$Species, log_prob, levels = c("non_setosa", "setosa"))
plot(roc_obj, col = "blue", main = "ROC Curve - Logistic Regression")

# 2. Decision Tree
tree_model <- rpart(Species ~ Sepal.Length + Petal.Length, data = trainData, method = "class") # nolint
rpart.plot(tree_model)

# Predictions & Confusion Matrix
tree_pred <- predict(tree_model, testData, type = "class")
confusionMatrix(tree_pred, testData$Species)


# Exercise Questions ------------------------------------------>

# Qs 1 -------------------------------------------------------->
cat(paste("\nQs 1 ---------------------->\n"))
# Convert am to factor: 0 = automatic, 1 = manual
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("automatic", "manual")) # nolint
# Logistic regression
log_model <- glm(am ~ hp + wt, data = mtcars, family = binomial())
summary(log_model)

# Qs 2 -------------------------------------------------------->
cat(paste("\nQs 2 ---------------------->\n"))
data("iris")
tree_model <- rpart(Species ~ ., data = iris, method = "class")
rpart.plot(tree_model)

# Qs 3 -------------------------------------------------------->
cat(paste("\nQs 3 ---------------------->\n"))
# Predicted probabilities and classes
log_prob <- predict(log_model, mtcars, type = "response")
log_class <- ifelse(log_prob > 0.5, "manual", "automatic")
# Confusion matrix
cm <- confusionMatrix(factor(log_class, levels = levels(mtcars$am)), mtcars$am)
cm
cm$overall["Accuracy"]

# Qs 4 -------------------------------------------------------->
cat(paste("\nQs 4 ---------------------->\n"))
roc_obj <- roc(mtcars$am, log_prob, levels = c("automatic", "manual"))
plot(roc_obj, col = "blue", main = "ROC Curve - Logistic Regression")
auc(roc_obj)

# Qs 5 -------------------------------------------------------->
cat(paste("\nQs 5 ---------------------->\n"))
# Train-test split
set.seed(123)
idx <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train <- iris[idx, ]
test  <- iris[-idx, ]

# Logistic Regression (multiclass via multinomial)
library(nnet)
log_iris <- multinom(Species ~ ., data = train)

pred_log <- predict(log_iris, test)
acc_log <- mean(pred_log == test$Species)

# Decision Tree
tree_iris <- rpart(Species ~ ., data = train, method = "class")
pred_tree <- predict(tree_iris, test, type = "class")
acc_tree <- mean(pred_tree == test$Species)

cat("Logistic Regression Accuracy:", round(acc_log, 3), "\n")
cat("Decision Tree Accuracy:", round(acc_tree, 3), "\n")

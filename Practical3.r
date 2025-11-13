library(dplyr)

# Loading and showing first 6 rows of the dataset
data("airquality")
head(airquality)

# Check for missing values

sum(is.na(airquality))          # total NA counts
colSums(is.na(airquality))      # missing values per columns

# Handling missing values

# Replacing NA values by mean
airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE) # nolint

# Replacing NA values by median
airquality$Solar.R[is.na(airquality$Solar.R)] <- median(airquality$Solar.R, na.rm = TRUE) # nolint


# Removing duplicates
data("iris")
iris_with_duplicates <- rbind(iris, iris[1:5, ])        # add duplicates artificially  # nolint
nrow(iris_with_duplicates)                              # before removing
iris_clean <- distinct(iris_with_duplicates)            # remove duplicates
nrow(iris_clean)                                        # after removing



# Standardize formats
iris_clean$Species <- tolower(as.character(iris_clean$Species))
iris_clean$Species <- as.factor(iris_clean$Species)

head(iris_clean)



# Exercise Questions ----------------------------------------------->

# Qs 1 --------------------->
data("airquality")
sum(is.na(airquality))

# Qs 2 --------------------->
data("airquality")
head(airquality)
airquality$Ozone[is.na(airquality$Ozone)] <- median(airquality$Ozone, na.rm = TRUE) # nolint
head(airquality)

# Qs 3 --------------------->
data("mtcars")
mtcars_duplicate <- rbind(mtcars, mtcars[1:5, ])
nrow(mtcars_duplicate)
mtcars_clean <- distinct(mtcars_duplicate)
nrow(mtcars_clean)

# Qs 4 --------------------->
head(mtcars)
rownames(mtcars) <- toupper(rownames(mtcars))
head(mtcars)

# Qs 5 --------------------->
data("iris")
head(iris)
iris$Species <- as.numeric(as.factor(iris$Species))
head(iris)

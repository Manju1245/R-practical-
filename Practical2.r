library(dplyr)

#Importing inbuilt datasets - IRIS
data("iris")    # importing inbuit dataset
head(iris)      # first 6 rows
str(iris)       # structure of the dataset
summary(iris)   # summary of the dataset

# Importing another inbuit dataset - MTCARS
data("mtcars")
head(mtcars)
str(mtcars)

# --> TITANIC dataset
data("Titanic")
Titanic


# checking of missing values
sum(is.na(iris))            # total missing values
colSums(is.na(mtcars))      # missing values per column 


# summarize distribution by group 
iris %>% group_by(Species) %>% summarise(Avg_Sepal_Length = mean(Sepal.Length), Avg_Sepal_Length = mean(Sepal.Length))  # nolint



# Exercise Questions ------------------------------------->

# Qs 1 ---------->
data("airquality")
str(airquality)

# Qs 2 ---------->
sum(is.na(airquality))

# Qs 3 ---------->
summary(mtcars)

# Qs 4 ---------->
mean(mtcars$hp)

# Qs 5 ---------->
iris %>% group_by(Species) %>% summarise(avg_sepal_width = mean(Sepal.Width))

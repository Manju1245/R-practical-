#Print a message
print("Hello This is text message")

x <- 10
y <- 5

#Assignment Operator
sum_value <- x+y
diff_value <- x-y
prod_value <- x*y
div_value <- x/y

sum_value
diff_value
prod_value
div_value


# Relational Operator
greater_check <- x>y
equal_check <- x==y


greater_check
equal_check

# Exploring dataset
data("iris")
head(iris)          # first 6 rows of iris dataset

str(iris)           # structure of iris dataset

summary(iris)       # descriptive statistics


# -------- Exercise Questions --------

# Qs 1 ---------------------------->
data("mtcars")
head(mtcars, 15)


# Qs 2 ---------------------------->
max(iris$Sepal.Length)
min(iris$Sepal.Length)


# Qs 3 ---------------------------->
str(airquality)


# Qs 4 ---------------------------->
p <- 100
q <- 50
greater_checkin <- p>q

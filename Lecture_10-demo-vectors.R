# Vectors demo

library(ggplot2)
library(dplyr)

midwest |> pull(county)


# make a vector with the c() function
colors <- c("yellow", "blue", "orange")

print(colors)

# first thing in colors vector has index 1
print(colors[1])

# second thing in colors vector has index 2
print(colors[2])

# use the length() function to find how many things in my vector
length(colors)

# last thing in my vector as at index length(my vector)
# last color:
colors[length(colors)]

# last county
county_vector <- midwest |> pull(county)
county_vector[length(county_vector)]

# I can use c() to look up multiple indices of a vector
#colors 1 and 2
colors[c(1,2)]

#colors 2,3
colors[c(2,3)]

# If I want first and third, I can use true false values to
# mark the first and third to keep
colors[c(TRUE, FALSE, TRUE)]

1 + 1

# vectors have to be same type, so what if I try different types
different_types <- c("yellow", 60, TRUE)
different_types


# I can check what data type is stored in a vector
# or variable with typeof()
typeof(colors)
typeof(1L)
typeof(1.0)
typeof(TRUE)
typeof(midwest)

# if I want to check type, I can use is. function
is.character(colors)
is.character(1.0)

# I can change a value in my vector using [index]
colors[2] <- "purple"
print(colors)

# vectorized operations
prices <- c(1.5, 2.0, 2.2)
inflated_prices <- prices * 1.1

points_students_got <- c(43, 37, 49)
student_percent <- points_students_got / 50 * 100
 
# I can even do this by two vectors of same size

# find the average test scores for each of 3 students
students_test_1 <- c(83, 75, 92)
students_test_2 <- c(90, 56, 77)

avg_student_test_score <- 
  (students_test_1 + students_test_2) / 2

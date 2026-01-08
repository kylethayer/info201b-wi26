# Demo 2.2, R code in R studio

# ha ha, the computer doesn't care what comments I write

# Load a dataset of the top 5 national parks by visits
np_top_5_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/refs/heads/main/2020-National-Park-Visits-By-State-Top5.csv")

np_top_5_df

summary(np_top_5_df)


# functions

print(5)

print("hello")

sum(2, 2)

sum(1, 2, 3, 4, 5)

seq(1,10)

sum(seq(1,10))

sum(seq(1,100))


# operators: basic (+, -, * , /)

2 + 2

1 + 2 + 3 + 4 + 5

32 / 4


# conditional operators, >, >=, < , <=, ==, !=
# is 1 bigger than 2?
1 > 2

# is 1 less than 2?
1 < 2

# is 2 the same as 2
2 == 2


# Demo variables
my_var <- 6

print(my_var)


# how many minutes in a year?
years <- 1
days <- years * 365
hours <- days * 24
minutes <- hours * 60

# how many minutes in a year?
years <- 2
days <- years * 365
hours <- days * 24
minutes <- hours * 60

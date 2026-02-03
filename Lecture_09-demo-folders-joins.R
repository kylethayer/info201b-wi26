
# I want to do read.csv() to load a file
# I could use an absolute path to the file
# C:\Users\kmthayer\Desktop\201_demo\recipe2_demo\example_data.csv

# but I want to use a relative path, which means I need to 
# know where I am starting from

# get the "working directory"
getwd()

# I will save this file in a place where I also have my data

# I happen have a file called "demo_L03_fake_students.csv"
# next to this R file

# I did R Studio Session -> Set Working Directory -> To Source File Location

# Now I can do read.csv with just the filename
# because I am in the same folder as the file
fake_students_df <- read.csv("demo_L03_fake_students.csv")

# Note: if my file was in a subfolder of here called "project"
# then I would run read.csv("project/demo_L03_fake_students.csv")



###### More Join Examples
library(dplyr)

# This code creates data frames manually
people_df <- data.frame(
  first_name = c("Kyle", "Kyle", "Sue", "Sue"),
  last_name = c("Thayer", "Smith", "Smith", "Davis"),
  age = c(40, 27, 33, 87)
)

books_df <- data.frame(
  title = c("Ficciones", "Parable of the Sower", "The Brothers Karamazov"),
  auth_first_name = c("Jorge Luis", "Octavia E.", "Fyodor"),
  auth_last_name = c("Borges", "Butler", "Dostoyevski")
)

# This tracks which person has each book
people_books_df <- data.frame(
  first_name = c("Kyle", "Kyle", "Sue", "Kyle"),
  last_name = c("Thayer", "Smith", "Smith", "Smith"),
  title = c("Ficciones", "Ficciones", "Parable of the Sower", "The Brothers Karamazov")
)

# Let's start by looking at combining the people info with which books they own

# Note: If I just use first_name or last_name, it will combine them
# incorrectly
incorrect_people_books_df <- 
  people_df |> 
    inner_join(
      people_books_df,
      join_by(first_name)
    )

# correctly join by matching both first name and last name
people_and_books_info <- 
  people_df |> 
    inner_join(
      people_books_df,
      join_by(first_name, last_name)
    )

# note: left join will keep Sue Davis, even though she owns no books
left_people_and_books_info <- 
  people_df |> 
  left_join(
    people_books_df,
    join_by(first_name, last_name)
  )


# join author info as well to get all three dataframes combined
  people_and_books_info |>
  inner_join(
    books_df,
    join_by(title)
  )

  
  
### National Parks Demo
  # Find greatest number of visits and least 
  
np_df <- read.csv("1979-2022-National-Park-Visits-By-State.csv")

max_visits <-
  np_df |>
  filter(RecreationVisits == max(RecreationVisits))

min_visits <-
  np_df |>
  filter(RecreationVisits == min(RecreationVisits))

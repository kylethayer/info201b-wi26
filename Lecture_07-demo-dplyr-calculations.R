library(dplyr)
library(stringr)
library(ggplot2)

pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

#### Mutate

# try to get the first fabric percent based on 
# the first two characters of the fabric
pocket_df <- 
  pocket_df |>
  mutate(first_fabric_per = str_sub(fabric, end=2))

# Note: this fails for pants that are 100%, since it just gets "10"

# What if we want to get the area size of front pockets?
# we'll ignore complications with min/max
# we'll just do minHeightFront * minWidthFront
pocket_df <-
  pocket_df |>
  mutate(front_area = minHeightFront * minWidthFront)


##### Summarize
#Note the other function
# summary gets some pre-chosen summary statistics for you
summary(pocket_df)

# example find avg price of all pants without summarize
avg_price <-
  pocket_df |>
  pull(price) |>
  mean()

# get summary values (total number of pants, average price, number brands)
pants_summary_df <-
  pocket_df |>
  summarize(
    total_pants = n(),
    avg_price = mean(price),
    num_brands = n_distinct(brand)
  )

# without summarize, let's find avg price of Levi's
avg_price_levis <-
  pocket_df |>
  filter(brand == "Levi's") |>
  pull(price) |>
  mean()

# now, same with summarize
levi_pants_summary_df <-
  pocket_df |>
  filter(brand == "Levi's") |>
  summarize(
    total_pants = n(),
    avg_price = mean(price),
    num_brands = n_distinct(brand)
  )

# Note: if you want to get a value out to display
# like in a quarto document ("vapply" error), then you need to "pull" 
# it out of the "summarize"d dataframe
avg_levi_price <-
  levi_pants_summary_df |>
  pull(avg_price)


#### Group_by
# group_by groups the rows together in preparation for
# the next operation (often "summarize")

# summarize now by each brand
pants_summary_by_brand_df <-
  pocket_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )

# Note: Sumarizing by group is really good for making bar charts
# where each group is a bar
pants_summary_by_brand_df |>
  ggplot() +
  geom_col(aes(x = brand, y = avg_price))

# by Googling and finding a stackoverflow answer I found tihs
# to make the text vertical
pants_summary_by_brand_df |>
  ggplot() +
  geom_col(aes(x = brand, y = avg_price)) +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))


#####
# Data cleaning

# problems: extra space on "Guess "
# problem: "7 for All Mankind" vs. "7 for all Mankind"
cleaned_pants_df <-
  pocket_df |>
  mutate(
    brand = trimws(brand) # remove spaces at beginning and end of string
  ) |>
  mutate(
    brand = ifelse(
      brand == "7 for all Mankind", # if check (lower case "a" version)
      "7 for All Mankind", # what to do if true (use upper case "a" brand)
      brand # otherwise leave brand as is
    )
  )

# summarize now by each brand
pants_summary_by_brand_df <-
  cleaned_pants_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )

pants_summary_by_brand_df |>
  ggplot() +
  geom_col(aes(x = brand, y = avg_price)) +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

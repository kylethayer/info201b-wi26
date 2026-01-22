#### Conditional Demo

money <- 3
coffee_price <- 5

if(money > coffee_price) {
  print("You have more than enough money to buy coffee")
} else if(money == coffee_price){
  print("You have exactly the right amount of money for coffee")
} else { # we assume in all other cases money is less than coffee_price
  print("You do not have enough money to buy coffee")
}


#### Demo of Subsets of data in dplyr

library("dplyr")

pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

brand_and_price_df <- pocket_df |>
                        select(brand, price)


### Select (columns)

# using select won't work to get just one column and 
# do something like get an average
pocket_df |> select(price) |> mean()
# Select returns a dataframe, even if it's only one column
#   so you can't take the mean()

# the way to get one column and do something like average
pocket_df |> pull(price) |> mean()


### filter (rows)

# only Abercrombie
ab_df <- pocket_df |> filter(brand == "Abercrombie")

# only Abercombie for men:
ab_for_men_df <- pocket_df |>
                  filter(brand == "Abercrombie", menWomen == "men")

# Alternate version of code above using & for "and"
ab_for_men_df <- pocket_df |>
                  filter(brand == "Abercrombie" & menWomen == "men")


# get only expenise pants (over $70)
expensive_pants_df <-
  pocket_df |>
  filter(price > 70)


### Finding min/max row

# find the most expensive pants
max_price <-
  pocket_df |>
  pull(price) |>
  max()

# Which brand was that? What row was that?

# use filter to find all rows that match that max_price
max_price_rows <-
  pocket_df |>
  filter(price == max_price)

# shorthand of this as one set of commands
max_price_rows <-
  pocket_df |>
  filter(price == max(price))

# what is the brand of the max price
max_price_brand <-
  pocket_df |>
  filter(price == max(price)) |>
  pull(brand)


# let's do the same for cheapest pants (min)
min_price <- 
  pocket_df |>
  pull(price) |>
  min()

min_price_rows <-
  pocket_df |>
  filter(price == min(price))

#what is the min price brand
min_price_brand <-
  pocket_df |>
  filter(price == min(price)) |>
  pull(brand)

# NOTE: If you have missing values (NA), then min/max
# won't work, so you have to use "na.rm = true" when 
# you take the min or max


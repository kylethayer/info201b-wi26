### Demo of why I prefer pipe rather than just parentheses

library(dplyr)
pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")


# pipe version of it
pants_summary_by_brand_df <-
  pocket_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )

# no pipe, instead parentheses
pants_summary_by_brand_df <- 
  summarize(
    group_by(
      pocket_df, 
      brand),
    total_pants = n(),
    avg_price = mean(price)
    )

#another example with pipe:
avg_front_area_levis <-
  pocket_df |>
  mutate(front_area = maxHeightFront * maxWidthFront) |> 
  filter(brand == "Levi's") |>
  pull(front_area) |>
  mean() |> 
  round(2)

# example without pipe
avg_front_area_levis <-
  round(
    mean(
      pull(
        filter(
          mutate(
            pocket_df, 
            front_area = maxHeightFront * maxWidthFront),
          (brand == "Levi's")
        ),
        front_area
      )
    ),
    2
  )



############## Demo of joining store and cart info

library(dplyr)

store_items_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/store_items.csv")
user_cart_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/user_cart.csv")

# to calculate how much the user has to pay, I have to join
# the user info with the store price info
user_cart_with_price_df <- 
  user_cart_df |>
  inner_join(store_items_df, join_by(item_name))


# no that I have the quantity in the cart and the price
# I can calcualte the cost of each item type for the user
user_cart_with_price_df <-
  user_cart_with_price_df |> 
  mutate(subtotal_item_price = quantity * item_price)

# finally, I can find their total cart price by adding together
# all the subtotal_item_price's
total_cost <-
  user_cart_with_price_df |>
  pull(subtotal_item_price) |>
  sum()

# Side note: if I do outer_join, then we'll have all
# items, even if they weren't in the user's cart
user_cart_with_price_outer_join_df <- 
  user_cart_df |>
  full_join(store_items_df, join_by(item_name))


#### NYC Flights dataset
# install.packages("nycflights13")
library("nycflights13")

flights <- flights
airpots <- airports

# join flight destinations to the airports info
# Note when using left_join instead of inner_join, we 
# can see if there are destinations we don't have info for
flights_with_dest_info_df <-
  flights |>
  left_join(airports, join_by(dest == faa))


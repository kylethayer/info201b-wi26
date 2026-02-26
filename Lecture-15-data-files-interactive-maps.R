#### Demo load a data file

# Make sure to set session working directory
getwd()

skating_df <- read.csv("lecture-15-demo-data-skating.csv")


### Demo interactive maps

library(ggplot2)
library("dplyr")
library("plotly")

# Load a shapefile of US states using ggplots' map_data() function
# also if needed, run 
# install.packages("maps")
# install.packages("mapproj")
state_shape <- map_data("state")

uw_location_df <- data.frame(
  lat = 47.6543238,
  long = -122.30800
)

# Draw a map of the states
ggplot(state_shape) +
  geom_polygon(aes(
    x=long,
    y=lat,
    group = group
  )) +
  # Add a point from the separate uw_location_df 
  geom_point(data= uw_location_df,
    aes(
      x = long,
      y = lat
    ),
    color = "red"
  ) + 
  coord_map()


##### Choropleth example

my_location_df <- data.frame(
  state = "washington",
  am_i_here = TRUE
)

# take the state shapes, and join my new data to it
state_combined_my_location_df <- 
  state_shape |>
  left_join(my_location_df, join_by(region == state))
  
ggplot(state_combined_my_location_df) +
  geom_polygon(aes(
    x = long,
    y = lat,
    group = group,
    fill = am_i_here
  ))

## States I've lived in
places_lived_df <- data.frame(
  state = c("washington", "colorado", "georgia"),
  ive_lived_here = c(TRUE, TRUE, TRUE)
)

# take the state shapes, and join my new data to it
state_combined_my_lived_df <- 
  state_shape |>
  left_join(places_lived_df, join_by(region == state))

# two updates: use ggplotly, and add point for UW
my_location_plot <- 
  ggplot(state_combined_my_lived_df) +
    geom_polygon(aes(
      x = long,
      y = lat,
      group = group,
      fill = ive_lived_here
    )) +
    # Add a point from the separate uw_location_df 
    geom_point(data= uw_location_df,
      aes(
        x = long,
        y = lat
      ),
      color = "blue"
    )

ggplotly(my_location_plot)


# Review of Dates: as.Date() for HW 7 (I think)

# To see the official documentation of as.Date() in RStudio
?as.Date()
# Note: I think the offial documentation is hard to read

### Examples that don't work with as.Date()
as.Date("Dec. 6th, 2024")

# 12/06/2024 (this is ambiguous)
date_1 <- as.Date("12/06/2024")
date_1_month <- format(date_1, "%m")

# You can set what format as.Date uses to inpterpret a date

# one other note: as.Date removes time (if there was time in the data)
date_2_text <- "2024/12/06 3:42:00" #Also, note: timezone makes this ambiguous
date_2_date <- as.Date(date_2_text)


### Interactive graphs ###
library(ggplot2)
library(plotly)

## ggplotly
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy
  ))
ggplotly(my_chart)


# To make custom hover text, make text aes() 
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy,
    text = paste0("Highway Mileage: ", hwy, "<br>",
                  "Displacement in Liters: ", displ)
  ))
ggplotly(my_chart, tooltip = "text")


# I can make small multiples using
# facet_wrap(~categoryname)
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy,
    text = paste0("Highway Mileage: ", hwy, "<br>",
                  "Displacement in Liters: ", displ, "<br>",
                  "Class: ", class)
  )) +
  facet_wrap(~class)
ggplotly(my_chart, tooltip = "text")

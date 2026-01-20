# install.packages("ggplot2")
library("ggplot2")

# save midwest as a variable so it shows up in RStudio better 
midwest <- midwest


# scatter plot of points with x/y axis based on
# college degrees and poverty
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty))

###### bar chart
# bar charts often have categories for the x axis
# so make a bar chart of population total per county
ggplot(midwest) + 
  geom_col(aes(x = county, y = poptotal))

# that was too much data, so let's try looking at a subset

# just look at the start of the data
midwest |> head()

partial_midwest <- midwest |> head()

ggplot(partial_midwest) + 
  geom_col(aes(x = county, y = poptotal))


##### Scatter plot with colors (color by "state")
ggplot(midwest) +
  geom_point(mapping = aes(
    x = percollege, 
    y = percadultpoverty, 
    color = state))

### histograms (break data into bins)
ggplot(midwest, aes(x = poptotal)) +
  geom_histogram(binwidth = 100000)

# add color using "fill" for the bars
ggplot(midwest, aes(x = poptotal, fill = state)) +
  geom_histogram(binwidth = 100000)

### Add labels to histogram above using the "labs" function
ggplot(midwest, aes(x = poptotal, fill = state)) +
  geom_histogram(binwidth = 100000) +
  labs(
    title = "Histogram of population per county",
    y = "Number of Counties",
    x = "Total population in county",
    fill = "State"
  )

# Imports
library(ggplot2)
library(plyr)
library(viridis)

get_third_chart <- function(df) {
  sorted = count(df, c('Genre', 'Year'))
  ggplot(sorted, aes(x=Year, y=freq, fill=Genre)) + 
    geom_area() +
    scale_fill_viridis(discrete = T) +
    ggtitle("Stacked Area Chart of Genre vs Year of Release") +
    ylab("Total Games Made")
}

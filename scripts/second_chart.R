# Imports
library("dplyr")
library("stringr")
library("ggplot2")
library("leaflet")

get_second_chart <- function(df) {
  ggplot(data = df, aes(x = Genre, y = Total_Shipped)) +
    geom_boxplot(na.rm = TRUE) +
    ggtitle("Boxplot of Genre vs Total Shipped") +
    xlab("Genres") +
    ylab("Total Shipped (millions)") +
    theme(axis.text.x = element_text(angle=90, hjust=1))
}
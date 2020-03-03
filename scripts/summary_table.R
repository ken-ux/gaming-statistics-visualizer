# Imports
library("dplyr")
library("stringr")
library("knitr")

# Agregate table script
agregate <- function(df) {
  ret <- df %>%
    group_by(Genre) %>%
    summarise(
      num_games = n(),
      avg_rating = mean(metacritic, na.rm = TRUE),
      total_shipped = sum(Total_Shipped, na.rm = TRUE),
      avg_playtime = mean(playtime, na.rm = TRUE),
      avg_achievements = mean(achievements_count, na.rm = TRUE)
    ) %>%
    arrange(-total_shipped)
  col_names <- c(
    "Genre",
    "Total Games",
    "Average Rating<br>(of 100)",
    "Total Shipped<br> (Millions)",
    "Average Playtime<br>(Hours)",
    "Average Number of Achievements"
  )
  kable(ret, col.names = col_names)
}

# playtime vs metacritic

library("ggplot2")
library("dplyr")

# The shaded area of the smoothed line is the confidence interval

get_first_chart <- function(dataset) {
new_game_data <- dataset %>%
  select(
    metacritic,
    Playtime = playtime) %>%
  na.omit() %>%
  filter(Playtime > 0 & Playtime < 100)
  
first_chart <- ggplot(data = new_game_data, mapping = aes(x = metacritic, y = Playtime)) +
  geom_point(
    color = "red",
    alpha = .3,
  ) +
  geom_smooth(
    fill = "blue",
    alpha = .2
  ) +
  labs(
    title = "Playtime vs. Metacritic Ratings",
    x = "Critic Score",
    y = "Playtime (Hours)"
  ) +
  scale_x_continuous(limits = c(40, 100)) +
  scale_y_continuous(limits = c(0, 75))
  return (first_chart)
}
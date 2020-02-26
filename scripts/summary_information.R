library("dplyr")
# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$game_titles <- nrow(dataset) # Number of game titles
  ret$oldest_date <- # Oldest date of game recorded in dataset
  ret$genres <- # Number of unique genres
  ret$platforms <- # Number of unique platforms
  ret$publishers <- # Number of unique publishers
  ret$sales <- # Total sales of games
  # do some more interesting stuff
  return (ret)
}
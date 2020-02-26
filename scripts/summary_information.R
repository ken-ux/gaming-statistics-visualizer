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

# The steps below are what is necessary to merge both datasets.
df1 <- read.csv("data/vgsales-12-4-2019.csv", head = T)
df2 <- read.csv("data/game_info.csv", head = T)
colnames(df2)[colnames(df2) == 'name'] <- 'Name'
df3 <- merge(df1,df2,by=c('Name'),all.x=T)

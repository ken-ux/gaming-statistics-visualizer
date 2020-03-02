# Necessary libraries
library("dplyr")
library("stringr")

# The steps below are what what necessary to merge both datasets.
# They have been put into comments to prevent long knitting times.
## df1 <- read.csv("data/vgsales-12-4-2019.csv", head = T)
## df2 <- read.csv("data/game_info.csv", head = T)
## colnames(df2)[colnames(df2) == 'name'] <- 'Name'
## df3 <- merge(df1,df2,by=c('Name'),all.x=T, stringsAsFactors = FALSE)

# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$game_titles <- nrow(dataset) # Number of game titles
  ret$oldest_date <- dataset %>% # Oldest date of game recorded in dataset
    mutate(date = as.Date(released)) %>%
    summarize(min = min(date, na.rm = TRUE)) %>%
    pull()
  ret$genres <- dataset %>% # Number of unique genres
    group_by(Genre) %>%
    summarize(count = n()) %>%
    pull(Genre) %>% # You can end here to getindividual genres
    length()
  ret$platforms <- dataset %>% # Number of unique platforms
    group_by(Platform) %>%
    summarize(count = n()) %>% # You can end here to get individual platforms
    pull(Platform) %>%
    length()
  ret$top_three_platforms <- dataset %>% # Top three platforms with most games
    group_by(Platform) %>%
    summarize(count = n()) %>%
    arrange(-count) %>%
    top_n(3) %>%
    pull(Platform) %>%
    as.character()
  ret$publishers <- dataset %>% # Number of unique publishers
    group_by(Publisher) %>%
    summarize(count = n()) %>%
    pull(Publisher) %>% # You can end here to get individual publishers
    length()
  # Total global sales of games
  ret$sales <- paste(round(sum(na.omit(dataset$Global_Sales))
                           / 1000, digits = 2), "billion")
  return (ret)
}

# lint("scripts/summary_information.R")

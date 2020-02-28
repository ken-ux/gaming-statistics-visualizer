library("dplyr")
library("stringr")
# A function that takes in a dataset and returns a list of info about it:
dataset <- df3
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
  ret$sales <- paste(sum(na.omit(dataset$Global_Sales)), "million") # Total global sales of games
  # do some more interesting stuff
  return (ret)
}

# The steps below are what is necessary to merge both datasets.
df1 <- read.csv("data/vgsales-12-4-2019.csv", head = T)
df2 <- read.csv("data/game_info.csv", head = T)
colnames(df2)[colnames(df2) == 'name'] <- 'Name'
df3 <- merge(df1,df2,by=c('Name'),all.x=T, stringsAsFactors = FALSE)

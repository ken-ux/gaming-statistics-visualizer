library("dplyr")
library("stringr")
# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$game_titles <- nrow(dataset) # Number of game titles
  ret$oldest_date <- df3 %>% # Oldest date of game recorded in dataset
    mutate(date = substr(released, 1, 4)) %>%
    desc() %>%
    select(date) %>%
    na.omit() %>%
    top_n(1)
  ret$genres <- df3 %>% # Number of unique genres
    group_by(Genre) %>%
    summarize(count = n()) %>%
    pull(Genre)
  ret$platforms <- df3 %>% # Number of unique platforms
    group_by(Platform) %>%
    summarize(count = n()) %>%
    pull(Platform)
  ret$publishers <- df3 %>% # Number of unique publishers
    group_by(Publisher) %>%
    summarize(count = n()) %>%
    pull(Publisher)
  ret$sales <- df3 %>% # Total global sales of games
    select(Global_Sales) %>%
    na.omit() %>%
    group_by(Global_Sales) %>%
    summarize(total_sales = sum()) %>%
    pull(total_sales)
  # do some more interesting stuff
  return (ret)
}

# The steps below are what is necessary to merge both datasets.
df1 <- read.csv("data/vgsales-12-4-2019.csv", head = T)
df2 <- read.csv("data/game_info.csv", head = T)
colnames(df2)[colnames(df2) == 'name'] <- 'Name'
df3 <- merge(df1,df2,by=c('Name'),all.x=T)
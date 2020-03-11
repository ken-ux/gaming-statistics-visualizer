# Insert any libraries below
library("dplyr")
library("shiny")
library("ggplot2")
library("stringr")

# Import .csv as dataframe
game_data <- read.csv("data/merged_game_data.csv", stringsAsFactors = FALSE)


# Source UI and server from respective files
source("app_ui.R")
source("app_server.R")

shinyApp(ui = my_ui, server = my_server)
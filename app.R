# Insert any libraries below
library("dplyr")
library("shiny")
library("ggplot2")


# Source UI and server from respective files
source("app_ui.R")
source("app_server.R")

shinyApp(ui = my_ui, server = my_server)
# Insert any libraries below
library("dyplr")
library("shiny")
library("ggplot")


# Source UI and server from respective files
source("app_ui.R")
source("app_server.R")

shinyApp(ui = my_ui, server = my_server)
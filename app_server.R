# Keep track of any libraries you use and add it to the list in app.R

game_data <- read.csv("data/merged_game_data.csv", stringsAsFactors = FALSE)
# Filter rows that contain empty values for metacritic score or genre.
filtered_data <- game_data %>%
  select(
    Metacritic = metacritic,
    Genre
  ) %>%
  na.omit()

# Provide a list of genres as choices for user selection.
genre_choices <- filtered_data %>%
  group_by(Genre) %>%
  summarize(count = n()) %>%
  pull(Genre)

#Filter rows that contain empty values for platform or year
filtered_data_plat <- game_data %>%
  select(
    Platform = Platform,
    Year
  ) %>%
  na.omit()

#Provide a list of platforms as choices for user selection
platform_choices <- filtered_data_plat %>%
  group_by(Platform) %>%
  summarize(count = n()) %>%
  pull(Platform)

my_server <- function(input, output) {
  output$summary_text <- renderUI({
    tags$div(
      tags$br(),
      tags$p(
        "We were interested in exploring ", tags$b("gaming "),
        "as a domain because it ventures to a realm of technology
         that has gained exceptional tractionand popularity over
         time. Complex and interesting advancements in components
         like ", tags$em("gaming platforms, companies, and
         technological innovations"), " have produced entirely new
         genres, virtual reality, mobile games, and more! Our group
         has played different video games throughout our lives and
         this project is an attempt to realize how our view
         of how gaming has evolved parallels trends in the data."
      ),
      tags$img(
        src = "https://miro.medium.com/max/9600/1*Mxcnq0CcJM8BQkpcwJ_w8A.jpeg",
        width = "70%"
      )
    )
  })

  output$major_questions <- renderUI({
    tags$div(
      tags$br(),
      tags$p("The major questions we intend to answer are as follows:"),
      tags$ol(
        tags$li("How do Metacritic scores compare between game genres?"),
        tags$li("How have video game sales changed over the years, and how do
          different genres compare?"),
        tags$li("How has different platforms' video game sales changed over time?")
      )
    )
  })

  output$data_info <- renderUI({
    tags$div(
      tags$br(),
      tags$p(
        "The dataset we are using comes from two sources; the authors are ",
        tags$a(
          href = "https://www.kaggle.com/jummyegg/rawg-game-dataset/data",
          "Trung Hoang"
        ),
        "and ", tags$a(
          href = "https://www.kaggle.com/ashaheedq/video-games-sales-2019",
          "Abdulshaheed Alqunber"
        ), ". Both authors have their datasets published on Kaggle.
        Our reasoning for merging the datasets are to get a wider scope and
        more variables of games that both datasets inform us about!"
      )
    )
  })

  # Kenny

  # Make boxplot for metacritic score vs. genre.
  output$first_chart <- renderPlotly({
    # Filter data for a specific genre choice.
    specific_genre <- filtered_data %>%
      filter(Genre == toString(input$genre_pick_one))
    test <- ggplot(data = specific_genre) +
      geom_boxplot(
        mapping = aes(x = Genre, y = Metacritic)
      ) +
      labs(
        title = paste0(
          "Metacritic Score for ",
          toString(input$genre_pick_one), " Games"
        ),
        y = "Metacritic Score"
      ) +
      scale_y_continuous(limits = c(0, 100))
    ggplotly(test)
  })

  output$comparison_chart <- renderPlotly({
    # Filter data for a specific genre choice.
    specific_genre <- filtered_data %>%
      filter(Genre == toString(input$genre_pick_two))
    plot <- ggplot(data = specific_genre) +
      geom_boxplot(
        mapping = aes(x = Genre, y = Metacritic)
      ) +
      labs(
        title = paste0(
          "Metacritic Score for ",
          toString(input$genre_pick_two), " Games"
        ),
        y = "Metacritic Score"
      ) +
      scale_y_continuous(limits = c(0, 100))
    ggplotly(plot)
  })

  output$takeaway_one <- renderUI({
    tags$div(
      tags$br(),
      tags$br(),
      tags$p(
        "For our question ",
        tags$b("\"How do Metacritic scores compare between game genres?\""),
        " you can refer back to our first interactive page. It allows users
         to compare between many different genres and take note of the
         median score that is assigned from Metacritic's aggregated reviews.
         This question is open-ended to allow users to make their own
         conclusions for specific they're interested in! It also allows
         one to find unique trends from hundreds of genre combinations.
         Overall, we saw that no genres had abysmal scores, indicating
         that every genre will find a gamer or critic they resonate with!"
      )
    )
  })

  # Peter
  output$second_chart <- renderPlotly({
    genre_filtered <- filter(game_data, Genre %in% input$check_genre)
    my_plot <- ggplot(data = genre_filtered) +
      geom_point(mapping = aes(
        x = Year, y = Total_Shipped, color = Genre,
        text = paste0(
          Name, "<br>", "Year Released: ", Year, "<br>",
          "Shipped: ", Total_Shipped, " Million"
        )
      )) +
      labs(
        title = "Year of Release vs. Total Games Shipped",
        x = "Year of Release",
        y = "Total Shipped (millions)",
        color = "Genre"
      ) +
      scale_x_continuous(limits = c(1980, max(game_data$Year, na.rm = TRUE))) +
      scale_y_continuous(limits = c(0, 50))
    ggplotly(my_plot, tooltip = "text")
  })

  output$takeaway_two <- renderUI({
    tags$div(
      tags$br(),
      tags$br(),
      tags$p(
        "For our question ",
        tags$b("\"How have video game sales changed over the years, and how do
         different genres compare?\""), "You can refer back to our second
         interactive page. You can see a plot of all kinds of different games
         organized by genre, and see how sales have changed over the years,
         overall as well as between genres. It is plain to see that over the
         many years since video games were first introduced their sales have
         been increasing. Between different genres things look pretty similar,
         aside from certain genres, such as ", tags$b("Simulation"), " or ",
        tags$b("Visual Novel"), " which appear to have much lower than average
         units shipped. Looking at points which are more of outliers, they tend
         to be mostly ", tags$b("Platformer, Role-Playing, "), "or ",
        tags$b("Racing"), " games. However, these games may share other factors
         which we did not consider in this analysis, such as the same publisher,
         which may be more of a factor than genre. It is difficult to conclude
         whether the genre is the primary factor or not. Ignoring the outliers,
         those genres seem to do well in general, so perhaps it isn't a
         coincidence."
      )
    )
  })

  # Ryan
  output$third_chart <- renderPlotly({
    platform_filtered <- filter(game_data, Platform %in% input$check_platform)
    my_plot <- ggplot(data = platform_filtered) +
      geom_point(mapping = aes(
        x = Year, y = Total_Shipped, color = Platform,
        text = paste0(
          Name, "<br>", "Year Released: ", Year, "<br>",
          "Shipped: ", Total_Shipped, " Million"
        )
      )) +
      labs(
        title = "Year of Release vs. Total Games Shipped",
        x = "Year of Release",
        y = "Total Shipped (millions)",
        color = "Platform"
      ) +
      scale_x_continuous(limits = c(1980, max(game_data$Year, na.rm = TRUE))) +
      scale_y_continuous(limits = c(0, 50))
    ggplotly(my_plot, tooltip = "text")
  })
  
  output$takeaway_three <- renderUI({
    tags$div(
      tags$br(),
      tags$br(),
      tags$p(
        "For our question ",
        tags$b("\"How has different platforms' video game sales changed over 
         time?\""),"You can refer back to our third interactive page. It shows 
         a plot of platforms and how the sales of games for each of these have 
         changed over time. Overall, game sales increased as time progresses
         but for individual consoles does not follow this trend."
      )
    )
})
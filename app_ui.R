summary_page <- tabPanel(
  p("Project Overview: ", em("Gaming")),
  sidebarLayout(
    sidebarPanel(
      p("This website was developed thanks to Shiny and the authors:
         Kenny, Peter, and Ryan!")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Scope",
          htmlOutput(outputId = "summary_text")
        ),
        tabPanel(
          "Major Questions",
          htmlOutput(outputId = "major_questions")
        ),
        tabPanel(
          "Dataset",
          htmlOutput(outputId = "data_info")
        )
      )
    )
  )
)

interactive_one <- tabPanel(
  "Metacritic Score Between Genres",
  splitLayout(
    cellWidths = c("50%", "50%"),
    plotlyOutput(outputId = "first_chart"),
    plotlyOutput(outputId = "comparison_chart")
  ),
  hr(),
  fluidRow(
    column(
      4,
      h4("How do Metacritic scores compare between game genres?"),
      p("The boxplots above can be adjusted to fit the Metacritic
        scores for a specific genre using the dropdown menus to the right!")
    ),
    column(
      4,
      selectInput(
        inputId = "genre_pick_one",
        label = "Genre One",
        choices = genre_choices
      ),
      selectInput(
        inputId = "genre_pick_two",
        label = "Genre Two",
        choices = genre_choices
      )
    )
  )
)

interactive_two <- tabPanel(
  "Shipped Units Over the Years",
  sidebarLayout(
    sidebarPanel(
      h4("How have video game sales changed over the years, and how do
          different genres compare?"),
      p("Sales is measured in total units shipped to better compare
       differently priced games as well as across years. Change which
        genres are displayed using the checkboxes below!"),
      checkboxGroupInput(
        inputId = "check_genre",
        label = "Select Genres to Display",
        choices = genre_choices,
        selected = genre_choices,
      )
    ),
    mainPanel(
      plotlyOutput("second_chart")
    ),
    position = "left"
  )
)

interactive_three <- tabPanel(
  "Interactive Dataset Three"
)

takeaways <- tabPanel(
  "Major Takeaways",
  navlistPanel(
    "Navigation",
    tabPanel(
      "Metacritic Score Between Genres Takeaways", # Kenny
      htmlOutput(outputId = "takeaway_one")
    ),
    tabPanel(
      "Shipped Units Over The Years Takeaways", # Peter
      htmlOutput(outputId = "takeaway_two")
    ),
    tabPanel(
      "Takeaway Three" # Ryan
    )
  )
)

my_ui <- navbarPage(
  "Gaming Statistics",
  summary_page,
  interactive_one, # Kenny
  interactive_two, # Peter
  interactive_three, # Ryan
  takeaways
)

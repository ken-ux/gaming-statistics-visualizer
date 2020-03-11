summary_page <- tabPanel(
  p("Project Overview: ", em("Gaming")),
  sidebarLayout(
    sidebarPanel(
      p("This website was developed thanks to Shiny and the authors: Kenny, Peter, and Ryan!")
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
  "Interactive Dataset One",
  splitLayout(
    cellWidths = c("50%", "50%"),
    plotOutput(outputId = "first_chart"),
    plotOutput(outputId = "comparison_chart")
  ),
  hr(),
  fluidRow(
    column(4,
      h4("How do Metacritic scores compare between game genres?"),
      p("The boxplots above can be adjusted to fit the Metacritic
        scores for a specific genre using the dropdown menus to the right!")
    ),
    column(4,
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
  "Interactive Dataset Two"
)

interactive_three <- tabPanel(
  "Interactive Dataset Three"
)

takeaways <- tabPanel(
  "Major Takeaways",
  navlistPanel(
    "Navigation",
    tabPanel(
      "Takeaway One", # Kenny
      htmlOutput(outputId = "takeaway_one")
    ),
    tabPanel(
      "Takeaway Two" # Peter
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
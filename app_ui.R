summary_page <- tabPanel(
  p("Project Overview: ", em("Gaming")),
  sidebarLayout(
    sidebarPanel(
      # Add image here later
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
  "Interactive Dataset One"
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
      "Takeaway One" # Kenny
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
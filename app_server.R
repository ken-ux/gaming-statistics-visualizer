# Keep track of any libraries you use and add it to the list in app.R
my_server <- function(input, output) {
  output$summary_text <- renderUI({
    tags$div(
      tags$br(),
      tags$p("We were interested in exploring ", tags$b("gaming "), "as a domain because it
        ventures to a realm of technology that has gained exceptional traction
        and popularity over time. Complex and interesting
        advancements in components like ", tags$em("gaming platforms, companies,
        and technological innovations"), " have produced entirely new genres, virtual reality,
        mobile games, and more! Our group has played different video games
        throughout our lives and this project is an attempt to realize how our view
        of how gaming has evolved parallels trends in the data."),
      tags$img(
        src="https://miro.medium.com/max/9600/1*Mxcnq0CcJM8BQkpcwJ_w8A.jpeg",
        width = "70%"
      )
    )
  })
  
  output$major_questions <- renderUI({
    tags$div(
      tags$br(),
      tags$p("The major questions we intend to answer are as follows:"),
      tags$ol(
        tags$li("First question"),
        tags$li("Second question"),
        tags$li("Third question")
      )
    )
  })
  
  output$data_info <- renderUI({
    tags$div(
      tags$br(),
      tags$p("The dataset we are using comes from two sources; the authors are ",
        tags$a(href="https://www.kaggle.com/jummyegg/rawg-game-dataset/data", "Trung Hoang"),
        "and ", tags$a(href="https://www.kaggle.com/ashaheedq/video-games-sales-2019",
        "Abdulshaheed Alqunber"), ". Both authors have their datasets published on Kaggle.
        Our reasoning for merging the datasets are to get a wider scope and more variables
        of games that both datasets inform us about!")
    )
  })

  # Kenny
  output$first_chart <- renderPlot({
    
    
    
    
  })



  # Peter




  # Ryan
  
  
  
  
  
  
}
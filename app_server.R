# Keep track of any libraries you use and add it to the list in app.R
my_server <- function(input, output) {
  output$summary_text <- renderUI({
    tags$div(
      tags$br(),
      tags$p("We are interested in gaming as a domain because it
       explores a realm of technology that has gained traction
       and popularity over time, producing complex and interesting
       advancements in elements such as gaming platforms, companies,
       and technological innovations (VR, mobile, etc.) Our
       group has played different video games throughout our lives
       and it would be interesting to see how our perspective of its
       evolution parallels trends we uncover.")
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
      tags$p("The dataset we are using comes from two sources. They are ",
             tags$a(href="https://www.kaggle.com/jummyegg/rawg-game-dataset/data", "Trung Hoang"),
             "and ", tags$a(href="https://www.kaggle.com/ashaheedq/video-games-sales-2019", "Abdulshaheed Alqunber"))
    )
  })

  # Kenny




  # Peter




  # Ryan
  
  
  
  
  
  
}
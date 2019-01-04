library(shiny)
ui <- fluidPage(
  titlePanel("The XQAC Hotel Word Cloud"),
  sidebarPanel(
    selectInput("hotel", "Choose Hotel",
                choices = hotel_reviews_v2$hotel.name,
                selected = ""
    ),
    radioButtons("rating", label = "Select Rating (Stars)",
                choices = list("1" = 1,
                "2" = 2,
                "3" = 3,
                "4" = 4,
                "5" = 5),
                selected = ""
    ),
    hr(),
    sliderInput(inputId = "freq",
                label = "Frequency of Words:",
                value = 30, min = 0, max = 60),
    sliderInput(inputId = "max",
                label = "Number of Words:",
                value = 50, min = 1, max = 100)),
  mainPanel(
    tabsetPanel(
      tabPanel("Sort by Hotel Name", plotOutput("plot1", width = "100%", height = "600px")),
      tabPanel("Sort by Hotel Rating", plotOutput("plot2", width = "100%", height = "600px"))
    )
  )
)

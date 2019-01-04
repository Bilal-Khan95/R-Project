server <- function(input,output,session){
  output$plot1 <- renderPlot({
    set.seed(183565743)
    wordcloud(corpusify(hotel_reviews_name(input$hotel)),
              scale = c(4, 2),
              min.freq = input$freq,
              max.words= input$max, 
              random.order=FALSE, 
              rot.per=0.318, 
              colors=brewer.pal(n=8, name = "Dark2"))
  })
  output$plot2 <- renderPlot({
    set.seed(183565743)
    wordcloud(corpusify(hotel_reviews_rating(input$rating)),
              scale = c(4, 2),
              min.freq = input$freq,
              max.words= input$max, 
              random.order=FALSE, 
              rot.per=0.318, 
              colors=brewer.pal(n=8, name = "Dark2"))
  })
}

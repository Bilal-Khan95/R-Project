library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(shiny)

hotel_reviews_name <- function(name){
  hotel_name <- subset(hotel_reviews_v2, hotel.name == name)
  hotel_name_reviews <- hotel_name$reviews.text
  return(hotel_name_reviews)
}

hotel_reviews_rating <- function(rating){
  hotel_rating <- subset(hotel_reviews_v2,  reviews.rating == rating)
  hotel_rating_reviews <- hotel_rating$reviews.text
  return(hotel_rating_reviews)
}

corpusify <- memoise(function(text_file){
  docs <- Corpus(VectorSource(text_file))
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeNumbers)
  docs <- tm_map(docs, removeWords, stopwords("english"))
  docs <- tm_map(docs, removeWords, c("2","der","die","das","sehr","auch","war","mit","wir","und","sie","I","the","The","and","a","as","an"))
  docs <- tm_map(docs, removePunctuation)
  docs <- tm_map(docs, stripWhitespace)
  
  return(docs)
})

shinyApp(ui = ui, server = server)

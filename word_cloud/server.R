#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(wordcloud)

function(input, output, session) {
        freq <- reactive ({
                input$change
                isolate({
                        book <- input$book
                        DTM <- getDTM (book)
                        f <- colSums(as.matrix(DTM))
                        ord = order(-f)
                        f = f[ord]
                        f
                })
                
        })
        
        output$plot1 <- renderPlot({
                minfreq <- input$minFreq
                maxword <- input$MaxWords
                wordcloud(names(freq()), freq(), max.words = maxword,
                          min.freq = minfreq, colors = brewer.pal(6, "Dark2") )
        })
        
}
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word Cloud"),
  
  # Sidebar with a slider input for number of bins 
      sidebarLayout(
                sidebarPanel(
                        selectInput ("book",
                                   "Choose a book:", 
                                  choices = books ),
                       actionButton ("change", "change"),
                       hr(),
                       sliderInput("minFreq", "Minimum Frequency:", 1, 50, value = 15, step = 1),
                       sliderInput("MaxWords", "Maximum Number of Words:", 1, 300, value = 100 )
                ),
     
      mainPanel(
             textOutput("text1"),
             textOutput("text2"),
             plotOutput("plot1")
             
      )#column(3
)
))


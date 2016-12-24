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
  fluidRow(
      column(9,
        
                sidebarPanel(
                        selectInput ("book",
                                   "Choose a book:", 
                                   c("A Mid Summer Night's Dream", "The Merchant of Venice",
                                   "Romeo and Juliet"), selected = "A Mid Summer Night's Dream" ),
                       actionButton ("change", "change"),
                       h1(""),
                       sliderInput("minFreq", "Minimum Frequency:", 1, 50, value = 15, step = 1),
                       sliderInput("MaxWords", "Maximum Number of Words:", 1, 300, value = 100 )
                )
      ) #column(9
    )#fluidRow (

  
))


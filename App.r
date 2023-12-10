# Matthew Yi, Aiden O, John Kim 
# 12-6-2023
# I worked on this project with my teammates 

library(dplyr)
library(stringr)
library(plotly)
library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Examining Minimum Wage Rates and Inflation Rates in the U.S.")
    mainPanel(
    tabsetPanel(type = "tab",
                tabPanel("Data", tableOutput("example")),
                tabPanel("Page 1 Test", verbatimTextOutput("Test")),
                tabPanel("Test TAB", verbatimTextOutput("Test"))
    )
  )
    





  )
)

server <- function(input, output) {
  
}













shinyApp(ui = ui, server = server) 

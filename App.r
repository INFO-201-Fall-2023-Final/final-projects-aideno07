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
  tabsetPanel(
    tabPanel("Introduction"),
    h2("About the Project"),
    p("Over the past two decades, the alarming rise in US inflation has outpaced adjustments in job wages, leaving many citizens grappling with financial hardship. 
      Soaring costs of living, coupled with stagnant wages, make it increasingly challenging to maintain financial stability, pushing individuals into a cycle of economic despair. 
      The widening wage gap exacerbates poverty rates, a persistent issue in the US. As savings are depleted, unemployment rises, and social unrest grows, poverty and homelessness surge. 
      The struggle for daily needs intensifies, impacting mental well-being, while businesses suffer from adjusting prices amid financial hardships. Despite acknowledging the issue, 
      the US faces difficulties in finding effective solutions, raising the question: How much must the minimum wage increase to keep pace with inflation?"),
    br(),
    p("Through this project, we hope to ")
    






  )
)

server <- function(input, output) {
  
}

tabPanel("Page 1 Test", 












shinyApp(ui = ui, server = server) 

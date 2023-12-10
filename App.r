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
              tabPanel("Introduction", tableOutput("example"),
                       h2("About the project"),
                       p("Over the past two decades, the alarming rise in US inflation has outpaced adjustments in job wages, leaving many citizens grappling with financial hardship. 
                         Soaring costs of living, coupled with stagnant wages, make it increasingly challenging to maintain financial stability, pushing individuals into a cycle of economic despair. 
                         The widening wage gap exacerbates poverty rates, a persistent issue in the US. As savings are depleted, unemployment rises, and social unrest grows, poverty and homelessness surge. 
                         The struggle for daily needs intensifies, impacting mental well-being, while businesses suffer from adjusting prices amid financial hardships. Despite acknowledging the issue, 
                         the US faces difficulties in finding effective solutions, raising the question: How much must the minimum wage increase to keep pace with inflation?"),
                       br(),
                       p("Through this project, we aim to explore the impact of inflation in different states within the United States. 
                         Thus, upon completion, we expect our project to reveal the relationship between minimum wage and inflation rates throughout the U.S. 
                         All in all, we believe that our study is of high importance because it illustrates how inflation and minimum wage rates are affecting low and middle-income communities. 
                         Due to the issue at hand, we desire to examine the problem more closely and identify any trends or patterns.")),
                tabPanel("Minimum Wage Rates", verbatimTextOutput("Test")),
                tabPanel("Inflation Rates", verbatimTextOutput("Test")), 
                tabPanel("Comparing the two datasets", verbatimTextOutput("Test"))
    )
  )
)

server <- function(input, output) {
  
}













shinyApp(ui = ui, server = server) 

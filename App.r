# Matthew Yi, Aiden O, John Kim 
# 12-6-2023
# I worked on this project with my teammates 

library(dplyr)
library(stringr)
library(plotly)
library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Examining Minimum Wage Rates and Inflation Rates in the U.S."),
  mainPanel(
    tabsetPanel(type = "pills",
                tabPanel("Introduction", tableOutput("example"),
                         h2("About the project"),
                         p("Over the past two decades, the alarming rise in US inflation has outpaced adjustments in job wages, leaving many citizens grappling with financial hardship. 
                          Soaring costs of living, coupled with stagnant wages, make it increasingly challenging to maintain financial stability, pushing individuals into a cycle of economic despair. 
                          The growing difference between high and low wages makes poverty worse, which is a big problem in the US. As people's savings run out, more people lose their jobs, 
                          and this causes more social problems. It leads to an increase in poverty and homelessness. The struggle for daily needs intensifies, impacting mental well-being, 
                          while businesses suffer from adjusting prices amid financial hardships. Despite acknowledging the issue, the US faces difficulties in finding effective solutions, 
                          raising the question: How much must the minimum wage increase to keep pace with inflation?"),
                         br(),
                         p("Through this project, we aim to explore the impact of inflation in different states within the United States. 
                      Thus, upon completion, we expect our project to reveal the relationship between minimum wage and inflation rates throughout the U.S. 
                      All in all, we believe that our study is of high importance because it illustrates how inflation and minimum wage rates are affecting low and middle-income communities. 
                      Due to the issue at hand, we desire to examine the problem more closely and identify any trends or patterns.")),
                  tabPanel("Minimum Wage Rates", textOutput("Test"),  
                          h2("the minimum wage has also increase in most places trying to keep up with the inflation rate")),
                  tabPanel("Inflation Rates", textOutput("Test"),
                          h2("At the same time, the inflation rate has also increased due to a multitude of reasons, Covid-19 in particular")), 
                  tabPanel("Comparing the two datasets", textOutput("Test"),
                          h2("Now lets look at the minimum wage and inflation rates side by side"))
    )
  )
)

server <- function(input, output) {
  
}








shinyApp(ui = ui, server = server) 

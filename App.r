# Matthew Yi, Aiden O, John Kim 
# 12-6-2023
# I worked on this project with my teammates 

library(dplyr)
library(shiny)
library(ggplot2)
library(readr)

sum_df <- read_csv("CleanedDataOfInflationandWage.csv")

ui <- fluidPage(
  titlePanel("Examining Minimum Wage Rates and Inflation Rates in the U.S."),
  mainPanel(
    tabsetPanel(type = "pills",
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
                
                tabPanel("Minimum Wage Rates", 
                         selectizeInput("selectedYears", "Select Years", choices = unique(sum_df$Year), multiple = TRUE),
                         plotOutput("minWageScatterPlot"),
                         verbatimTextOutput("minWageText")),
                tabPanel("Inflation Rates", 
                         selectizeInput("selectedYearsInflation", "Select Years", choices = unique(sum_df$Year), multiple = TRUE),
                         plotOutput("inflationScatterPlot"),
                         verbatimTextOutput("inflationText")), 
                tabPanel("Comparing the two datasets", textOutput("comparisonText"))
    )
  )
)

server <- function(input, output) {
  output$minWageScatterPlot <- renderPlot({
    selected_years_data <- filter(sum_df, Year %in% input$selectedYears)
    ggplot(selected_years_data, aes(x = as.factor(Year), y = Federal.Minimum.Wage)) +
      geom_point(aes(color = factor(Year)), size = 3) +
      scale_y_continuous(limits = c(0, max(sum_df$Federal.Minimum.Wage, na.rm = TRUE) * 1.2)) +
      labs(title = "Minimum Wage Scatter Plot",
           x = "Year",
           y = "Federal Minimum Wage",
           color = "Year in the US") +
      theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 12),
            axis.text.y = element_text(size = 12),  
            plot.title = element_text(size = 20), 
            axis.title.x = element_text(size = 14),  
            axis.title.y = element_text(size = 14))
  })
  
  output$minWageText <- renderText({
    "Summary of Graph:\n\nThe scatterplot above shows the slight increase in Federal Minimum Wage over the past 20 years.
    With this plot, we are able to see how rare of an occurrence it is for the Minimum Wage to increase.
    As we can see, the minimum wage has only increased 2.1 dollars over a total of 20 years."
  })
  
  output$inflationScatterPlot <- renderPlot({
    selected_years_data_inflation <- filter(sum_df, Year %in% input$selectedYearsInflation)
    ggplot(selected_years_data_inflation, aes(x = as.factor(Year), y = Average_Inflation)) +
      geom_point(aes(color = factor(Year)), size = 3) +
      scale_y_continuous(limits = c(0, max(sum_df$Average_Inflation, na.rm = TRUE) * 1.2)) +
      labs(title = "Inflation Rate Scatter Plot",
           x = "Year",
           y = "Average Inflation Rate",
           color = "Year in the US") +
      theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 12),
            axis.text.y = element_text(size = 12),  
            plot.title = element_text(size = 20), 
            axis.title.x = element_text(size = 14),  
            axis.title.y = element_text(size = 14))
  })
  
  output$inflationText <- renderText({
    "Summary of Inflation Graph:\n\nThe scatterplot above shows the fluctuation of inflation rates over the last 20 years.
    A 2.0 Inflation Rate is considered high, and 11 of the past 20 years have had numbers above this 2.0 mark.
    This is not something that should be overlooked and should be adjusted for. Many citizens feel the impacts and
    suffer financially, struggling to meet simple daily needs."
  })
}

shinyApp(ui = ui, server = server)

library(shiny)
library(RColorBrewer)
library(ggplot2)
require("readr")
require("shiny")
library(tidyverse)
#gr <- read_csv("https://raw.githubusercontent.com/YumingWang1/Data-visualization/master/gr.csv")
ui <- fluidPage(
  titlePanel(title = h4("Growth Rate for China, U.S. and Canada by each sector in last decade", align="center")),
  sidebarPanel(
    textInput(inputId = "caption",
              label = "Caption:",
              value = "Sectors"),
    radioButtons("Sector", "Select the Sector",
                 choices = c("Average Wage",
                             "Mining",
                             "Manufacturing",
                             "Production and supply of Utilities",
                             "Construction",
                             "Wholesale and Retail Trades",
                             "Transport, Storage and Post",
                             "Information Transmission and software",
                             "Financial Intermediation",
                             "Education"),
                 selected = "Average Wage")),
  
  
  mainPanel(
    plotOutput("bar",height=500))
)

server <- function(input,output){
  
  reactive_data = reactive({
    selected_Sector = input$Sector
    return(gr[gr$Sectors==selected_Sector,])
    
  })
  
  output$caption <- renderText({
    input$caption
  })
  
  output$bar <- renderPlot({
    
    color <- c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6))
    
    our_data <- reactive_data()
    
    bp <- barplot(colSums(our_data[,c("China","U.S.","Canada")]),
            ylab="Growth Rate",
            ylim =c(0,2.0),
            xlab="Country",
            names.arg = c("China","U.S.","Canada"),
            col = color)
    text(bp,0.1,labels=our_data[c("China","U.S.","Canada")])
    legend("topright", legend = c("China","U.S.","Canada"), 
           col = c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6)) , 
           bty = "n", pch=20 , pt.cex = 2, cex = 1.5, horiz = FALSE, inset = c(0.05, 0.05))
    
  
  })
}
shinyApp(ui=ui, server=server)


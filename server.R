library(tidyverse)

#this one can be deleted once the next one is working
#source('boxWhiskerGenerate.R')
source('colPlotGenerate.R')

getData <- function(pathToFile) {
  data <- read_csv(pathToFile)
  return(data)
}

server <- function(input, output) {
  
  dataInput <- reactive({
    getData('Islas_seedRain_trapLevel.csv')
  })
  
  # sends the column plots to UI
  output$colPlotRender <- renderPlot({
    colPlotCreate( # creates the box whisker plots
      dataInput(),
      input$succession_stage_id,
      input$growth_form_id,
      input$dispersal_mode_id)
    })
} 
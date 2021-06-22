library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(scales)

source('overviewUI.R')
source('boxWhiskerUI.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    #menuItem('Overview', tabName='overview'),
    menuItem('Seed dispersal visualization', tabName='boxWhiskers')
 )
)

body <- dashboardBody(
  
  tabItems(
    boxWhiskerTab
  )
)

dashboardPage(
  dashboardHeader(title=''),
  sidebar,
  body,
  skin='green'  
  
  
  )


#New layout should basically be the following 
#(without the ui object since this is a 2-file app)
# ui <- fluidPage(
#   
#   titlePanel("Seed Deposition by Restoration Treatment"),
#   
#   sidebarLayout(
#     
#     sidebarPanel(
#       sliderInput(
#         "bins", label = "Number of bins:",
#         min = 1, value = 30, max = 50
#       )
#     ),
#     
#     mainPanel(
#       plotOutput("distPlot")
#     )
#   )
# )
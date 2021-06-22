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

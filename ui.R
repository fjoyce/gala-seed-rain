library(shiny)
library(shinydashboard)
library(shinyWidgets)

source('overviewUI.R')
source('boxWhiskerUI.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Seed dispersal visualization', tabName='boxWhiskers')
  )
)

body <- dashboardBody(
  
  tabItems(
    overviewTab,
    boxWhiskerTab
  )
)

dashboardPage(
  dashboardHeader(title='Restoring tropical forests'),
  sidebar,
  body,
  skin='green'  
  
  
  )

library(shiny)
#library(shinydashboard)
#library(shinyWidgets)
library(scales)

####New layout should basically be the following#### 
#####(without the ui object since this is a 2-file app)#####

fluidPage(
  
  titlePanel("Seed Deposition by Restoration Treatment"),
  
  sidebarLayout(
    
    sidebarPanel(width = 3,
      # box(
      #   h1('Seed Deposition'),
      #   'Use the dropdown menu to see the patterns
      # of seed dispersal by different categories.
      # Select "All" to gain an understanding
      # of the overall pattern or specify a category to test
      # your hypothesis.',
      tags$p("Use the dropdown menus to see the patterns of seed deposition by different categories of seeds. Select 'All' to gain an understanding of the overall pattern or specify particular categories to test your hypothesis."),
      
      selectInput(inputId='succession_stage_id',
                  label='Successional Stage ',
                  choices=c( 'All', 'Early', 'Both', 'Late'),
                  selected=c('All')),
      selectInput(inputId='growth_form_id',
                  label= 'Growth form',
                  choices=c('All', 'Tree','Shrub'),
                  selected=c('All')),
      selectInput(inputId='dispersal_mode_id',
                  label=  'Dispersal mode',
                  choices=c('All', 'Animal-dispersed' , 'Wind-dispersed'),
                  selected=c('All'))
    ),
  
    mainPanel(width = 9,
      plotOutput('colPlotRender'))
      
)
)

#############################

#source('overviewUI.R')
#source('boxWhiskerUI.R')


##This one shouldn't be needed since 
##I put those UI elements directly into the sidebar##
#source('colPlotUI.R')

# sidebar <- dashboardSidebar(
#   sidebarMenu(
#     #menuItem('Overview', tabName='overview'),
#     menuItem('Seed dispersal visualization', tabName='colPlot')
#  )
# )
# 
# body <- dashboardBody(
#   
#   tabItems(
#     colPlotTab
#   )
# )
# 
# dashboardPage(
#   dashboardHeader(title=''),
#   sidebar,
#   body,
#   skin='green'  
#   
#   )


  #)
#)
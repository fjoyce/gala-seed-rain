library(shiny)
#library(shinydashboard)
#library(shinyWidgets)
library(scales)

####New layout should basically be the following#### 
#####(without the ui object since this is a 2-file app)#####

fluidPage(
  
  titlePanel("Deposición de semillas por tratamiento"),
  
  sidebarLayout(
    
    sidebarPanel(width = 3,
      # box(
      #   h1('Seed Deposition'),
      #   'Use the dropdown menu to see the patterns
      # of seed dispersal by different categories.
      # Select "All" to gain an understanding
      # of the overall pattern or specify a category to test
      # your hypothesis.',
      tags$p("Utiliza los menús para visualizar los patrones de deposición de semillas de diferentes categorías. Selecciona 'Todas' para entender el patrón general o especifica categorías particulares para probar tus hipótesis."),
      
      selectInput(inputId='succession_stage_id',
                  label='Etapa sucesional ',
                  choices=c( 'Todas', 'Temprana', 'Ambas', 'Tard\u00EDa'),
                  selected=c('Todas')),
      selectInput(inputId='growth_form_id',
                  label= 'Forma de crecimiento',
                  choices=c('Todas', '\u00C1rbol','Arbusto'),
                  selected=c('Todas')),
      selectInput(inputId='dispersal_mode_id',
                  label=  'Modo de dispersión',
                  choices=c('Todos', 'Animales' , 'Viento'),
                  selected=c('Todos'))
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
#boxWhiskerTab
boxWhiskerTab <- tabItem(
  tabName ='boxWhiskers',
  fluidRow(
    box(
      h1('Seed Dispersal'),
      'Use the dropdown menu to see the patterns 
      of seed dispersal by different categories. 
      Select "All" to gain an overall understanding 
      of the patterns or specify a category to test 
      your hypothesis.',
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
    box(
      h1('Seed Dispersal by Restoration Treatment '),
      plotOutput('boxWhiskerRender') # receives box whisker plot that server sent
      
    )
  )
)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              


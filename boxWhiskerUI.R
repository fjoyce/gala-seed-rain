#boxWhiskerTab
boxWhiskerTab <- tabItem(
  tabName ='boxWhiskers',
  #put each box in its own fluidRow to make them stack instead of side by side
  fluidRow(
    box(
      h1('Seed Deposition'),
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
    )
    
  ),
  fluidRow(
    box(
      h1('Seed Deposition by Restoration Treatment '),
      plotOutput('boxWhiskerRender') # receives box whisker plot that server sent
      
    )
  )
)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              


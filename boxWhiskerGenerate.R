library(tidyverse)

boxWhiskerCreate <- function(data_input, succession_stage_id, growth_form_id, dispersal_mode_id ){
  
  print(data_input)
  
  processed_data <- data_input
  
  # rename the tree types to just Tree
  processed_data <- processed_data %>%
    mutate(Growthform=replace(Growthform, Growthform=='CT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='CP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='UT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='UP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='ET', 'Tree'))
  
  
  # because of the huge difference in outlier values round 4000-6000
  # check if these are valid
  #They make the graph extremely small making it hard to see any trends, we filter deposition rate below 10 to better see trends
  #processed_data <- processed_data %>%
   # filter(DepositionRate < 10)
  

 
  
  if (succession_stage_id != 'All') {
    processed_data <- processed_data %>% 
      filter(str_detect(SuccessionalStage, succession_stage_id))
    
  }
  if (growth_form_id != 'All') {
    processed_data <- processed_data %>%
      filter(str_detect(Growthform, growth_form_id))
    
  }
  
  if (dispersal_mode_id != 'All') {
    processed_data <- processed_data %>%
      filter(str_detect(Dispersalmode , dispersal_mode_id))
    
  }
  print(processed_data)
  
  # renaming the treatment groups to their actual names
  processed_data <- processed_data %>%
    mutate(Treatment = factor(
      Treatment,
      levels=c('C', 'I', 'P', 'R'),
      labels=c('Nat_reg', 'App_nuc', 'Plantation', 'Ref_for')
    ))
  
  p <- ggplot(processed_data, aes(x=Treatment, y=log10(Seed_deposition_rate))) + 
    geom_boxplot()+
    geom_boxplot(fill='#A4A4A4', color="black")+
    theme_classic()+ 
    ylab('Deposition rate (m-2 yr-1')+
    xlab('Restoration treatment')
  
 return(p)
} 
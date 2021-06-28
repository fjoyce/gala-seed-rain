library(tidyverse)
library(plotrix)
library(scales)
library(cowplot)


colPlotCreate <- function(data_input, succession_stage_id, growth_form_id, dispersal_mode_id ) {
  
  print(data_input)
  
  processed_data <- data_input
  
  # renaming the treatment groups to their actual names
  processed_data <- processed_data %>%
    mutate(Treatment = factor(
      Treatment,
      levels=c('C', 'I', 'P', 'R'),
      labels=c('Control', 'Islas', 'Plantacion', 'Bosque ref.')
      )) %>% 
    #rename tree categories to just "Tree"
    mutate(Growthform=replace(Growthform, Growthform == 'CT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform == 'CP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform == 'UT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform == 'UP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform == 'ET', 'Tree')) %>% 
    mutate(Growthform=replace(Growthform, Growthform == 'Tree', 'Arbol')) %>% 
    mutate(Growthform=replace(Growthform, Growthform == 'Shrub', 'Arbusto')) %>% 
    mutate(Dispersalmode=replace(Dispersalmode, Dispersalmode == 'Animal-dispersed', 'Animales')) %>%
    mutate(Dispersalmode=replace(Dispersalmode, Dispersalmode == 'Wind-dispersed', 'Viento')) %>% 
    mutate(SuccessionalStage=replace(SuccessionalStage, SuccessionalStage == 'Both', 'Ambas')) %>% 
    mutate(SuccessionalStage=replace(SuccessionalStage, SuccessionalStage == 'Early', 'Temprana')) %>%
    mutate(SuccessionalStage=replace(SuccessionalStage, SuccessionalStage == 'Late', 'Tardia'))
    
  
  #the following conditionals filter by 
  #successional stage, growth form, and dispersal mode based on input
  #(i.e. if "All" is not selected )
  if (succession_stage_id != 'Todas') {
    processed_data <- processed_data %>% 
      filter(str_detect(SuccessionalStage, succession_stage_id))
    
  }
  if (growth_form_id != 'Todas') {
    processed_data <- processed_data %>%
      filter(str_detect(Growthform, growth_form_id))
    
  }
  
  if (dispersal_mode_id != 'Todos') {
    processed_data <- processed_data %>%
      filter(str_detect(Dispersalmode , dispersal_mode_id))
    
  }
  print(processed_data)
  
  overall_dep_rate <- processed_data %>% 
    #first just get overall seed deposition rates (all species) for each trap
    group_by(Site,Treatment, Plot, Trap) %>% 
    summarize(trap_dep_rate = sum(Seed_deposition_rate))

  #then take means by treatment
  mean_se <- overall_dep_rate %>% 
    group_by(Treatment) %>% 
    summarize(mean_dep_rate = mean(trap_dep_rate), 
              SE = std.error(trap_dep_rate))
  
  p <- ggplot(mean_se, aes(x = Treatment, y = mean_dep_rate)) +
    #more muted blue #20618D
    #JAE graph color is #0201FF 
    geom_col(fill = '#0201FF') + 
    geom_errorbar(aes(ymin = mean_dep_rate - SE,
                      ymax = mean_dep_rate + SE,
                      width = 0.2)) +
    theme_cowplot(font_size = 20) +
    scale_y_log10(
      breaks = function(x) {
        brks <- extended_breaks(Q = c(1,5))(log10(x))
        10 ^ (brks[brks %% 1 == 0])
      },
      limits = c(10^0,10^4),
      labels = math_format(format = log10),
    ) +
    ylab(expression(Deposicion ~ (semillas ~ m ^ -2 ~ a ^ -1))) +
    xlab('Tratamiento') +
    labs(caption = "Columnas representan promedios con 1 error estandar de la media.")
  
  return(p)
}
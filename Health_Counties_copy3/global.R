library(shinydashboard)
library(tidyverse)
library(DT)

tn_2019 <- readRDS('data/tn_2019.RDS')

# Generate Options for dropdown menu in ui
county <- tn_2019 %>% 
  pull(County) %>% 
  unique()

Low_birth_weight_pct<- tn_2019 %>%
  pull(`% LBW`) %>%
  unique()


library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)

tn_2019 <- readRDS('data/tn_2019.RDS')
tn_2019_health<-readRDS('data/tn_2019_totalhealth.RDS')
tn_2019_hfactors<-readRDS('data/tn_2019hfactors.RDS')
tncopa<-readRDS('data/tncopa.RDS')
demo_tn_pops<-readRDS('data/demo_tn_pops.RDS')
mortality<-readRDS('data/mortality.RDS')

# Generate Options for dropdown menu in ui
County <- tn_2019 %>% 
  pull(County) %>% 
  unique()

Low_birth_weight_pct<- tn_2019 %>%
  pull(`% LBW`) %>%
  unique()


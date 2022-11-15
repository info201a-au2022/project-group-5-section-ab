library(kableExtra)
library(dplyr)
library(tidyverse)

Breast_Cancer <- read_csv("../data/Breast_Cancer.csv")
Breasr_table <- Breast_Cancer %>% group_by(`Marital Status`) %>% 
                summarise(`Average Tumor Size` = round(mean(`Tumor Size`)), `Average Survival Months` = round(mean(`Survival Months`)))

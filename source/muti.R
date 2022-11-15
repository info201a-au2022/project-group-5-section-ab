
library("viridis") 
library(dtplyr)
library(dplyr)
library(tidyverse)



Breast_Cancer <- read_csv("../data/Breast_Cancer.csv")
Breast_Cancer_info <- Breast_Cancer %>%  filter(Status=="Dead") %>% 
                      select('A Stage', 'Status', 'T Stage', 'N Stage')
                     
first <- Breast_Cancer_info %>% group_by(name = Breast_Cancer_info$`A Stage`) %>% summarise(A_num = n())
Two <-  Breast_Cancer_info %>% group_by(name = Breast_Cancer_info$`T Stage`) %>% summarise(T_num = n())
Three <- Breast_Cancer_info %>%group_by(name = Breast_Cancer_info$`N Stage`) %>% summarise(N_num = n())

par(mfrow = c(1, 3))
barplot(first$A_num, names.arg=first$name,col = '#8e82c6', xlab = 'A stage' , ylab = 'death counts')

barplot(Two$T_num, names.arg=Two$name, col = viridis(10), xlab = 'T stage' , ylab = 'death counts')

barplot(Three$N_num, names.arg=Three$name,col = viridis(10), xlab = 'N stage' , ylab = 'death counts')





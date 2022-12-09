library(stringr)
library("viridis") 
library(dtplyr)
library(dplyr)





library(tidyverse)

breast_cancer <- read.csv('../data/Breast_Cancer.csv')
cancer_rate <- read_csv("../data/Cancer_Rates.csv")



summary_info <- list()
summary_info$zipmostBcancer <- cancer_rate %>% filter(Breast_Can == max(Breast_Can, na.rm = TRUE)) %>% select(ZIP)

summary_info$survivalTstage1 <- breast_cancer %>% filter(T.Stage == "T1") %>% summarise(max = max(Survival.Months))

summary_info$survivalTstage2 <- breast_cancer %>% filter(T.Stage == "T2") %>% summarise(max = max(Survival.Months))

summary_info$survivalTstage3 <- breast_cancer %>% filter(T.Stage == "T3") %>% summarise(max = max(Survival.Months))

summary_info$survivalTstage4 <- breast_cancer %>% filter(T.Stage == "T4") %>% summarise(max = max(Survival.Months))

summary_info$maritalrelationM <- breast_cancer %>% filter(Marital.Status == "Married") %>% summarise(max = max(T.Stage))

summary_info$maritalrelationD <- breast_cancer %>% filter(Marital.Status == "Divorced") %>% summarise(max = max(T.Stage))

summary_info$maritalrelationS <- breast_cancer %>% filter(Marital.Status == "Single",na.rm = TRUE) %>% summarise(max = max(T.Stage))

summary_info$maritalrelationW <- breast_cancer %>% filter(Marital.Status == "Widowed") %>% summarise(max = max(T.Stage))

summary(summary_info)



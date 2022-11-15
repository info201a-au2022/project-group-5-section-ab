library(stringr)
library(dplyr)
setwd("~/Documents/proj/project-group-5-section-ab/data")
breast_cancer <- read.csv("Breast_Cancer.csv")
cancer_rate <- read.csv("Cancer_Rates.csv")
View(breast_cancer)
View(cancer_rate)

summary_info <- list()
summary_info$zipmostBcancer <- cancer_rate %>% filter(Breast_Can == max(Breast_Can, na.rm = TRUE)) %>% select(ZIP)

summary_info$survivalTstage1 <- breast_cancer %>% filter(T.Stage == "T1") %>% select(Survival.Months)

summary_info$survivalTstage2 <- breast_cancer %>% filter(T.Stage == "T2") %>% select(Survival.Months)

summary_info$survivalTstage3 <- breast_cancer %>% filter(T.Stage == "T3") %>% select(Survival.Months)

summary_info$survivalTstage4 <- breast_cancer %>% filter(T.Stage == "T4") %>% select(Survival.Months)

summary_info$maritalrelationM <- breast_cancer %>% filter(Marital.Status == "Married") %>% select(T.Stage)

summary_info$maritalrelationD <- breast_cancer %>% filter(Marital.Status == "Divorced") %>% select(T.Stage)

summary_info$maritalrelationS <- breast_cancer %>% filter(Marital.Status == "Single") %>% select(T.Stage)

summary_info$maritalrelationW <- breast_cancer %>% filter(Marital.Status == "Widowed") %>% select(T.Stage)

summary(summary_info)
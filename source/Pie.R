library(dtplyr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(scales)


Breast_Cancer_d <- read_csv("../data/Breast_Cancer.csv")

Breast_Cancer_one <- Breast_Cancer_d %>% select(`Marital Status`, Status)

Breast_Cancer_spec <- Breast_Cancer_one%>% group_by(`Marital Status`) %>% summarise(total=n())

Breast_cancer_dead <-  Breast_Cancer_one%>% group_by(`Marital Status`) %>% filter(Status == 'Alive')%>% summarise(alive=n())

Breast_cancer_all <- full_join(Breast_Cancer_spec, Breast_cancer_dead, by="Marital Status") %>% mutate(ratio=alive/total)

ggplot(Breast_cancer_all, aes(x = '', y = ratio, fill = `Marital Status`)) +
    geom_bar(width = 1, stat = "identity") + 
    coord_polar("y", start=0) +  
    geom_text(aes(label = round(ratio,2)), position = position_stack(vjust = 0.5)) +
    scale_fill_brewer("Blues") + ggtitle("Different proportion of surivial rate on different Marital Status") + ylab('decimals are corelated survival rate')






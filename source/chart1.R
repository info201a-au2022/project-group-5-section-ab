library(dtplyr)
library(dplyr)
library(tidyverse)
install.packages("viridis")
library("viridis") 
Cancer_Rates <- read_csv("Documents/info201/Cancer_Rates.csv")
Cancer_Rates <- Cancer_Rates %>% select(ZIP,All_Cancer,Breast_Can)
Cancer_stat <- Cancer_Rates %>% mutate(ratio = Breast_Can / All_Cancer) %>% 
              arrange(desc(ratio))
barplot(Cancer_stat$ratio,names.arg=Cancer_stat$ZIP,xlab="Location",ylab="Breast_cancer_ratio",col=viridis(10),
        main="Breast cancer proportion of all cancers in different zip codes",border="red")


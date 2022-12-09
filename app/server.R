#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyverse)
library(ggplot2)

#load data
Breast_Cancer <- read_csv("data/Breast_Cancer.csv")


Breast_Cancer_dead <- Breast_Cancer %>% filter(Status=="Dead")


Breast_Cancer_one <- Breast_Cancer %>% select(`Marital Status`, Status)

Breast_Cancer_spec <- Breast_Cancer_one%>% 
  group_by(`Marital Status`) %>% summarise(total=n())

Breast_cancer_dead <-  Breast_Cancer_one%>% group_by(`Marital Status`) %>% 
  filter(Status == 'Alive')%>% summarise(alive=n())

Breast_cancer_all <- full_join(Breast_Cancer_spec, Breast_cancer_dead, by="Marital Status") %>% 
  mutate(ratio=alive/total)

server <- function(input, output) {
  output$pie_chart <- renderPlot ({
    breast_cancer_fill <- Breast_cancer_all %>% 
      filter(`Marital Status` %in% input$Status)
    ggplot(breast_cancer_fill, aes(x = '', y = ratio, fill = `Marital Status`)) +
      geom_bar(width = 1, stat = "identity") + 
      coord_polar("y", start=0) +  
      geom_text(aes(label = round(ratio,2)), position = position_stack(vjust = 0.5)) +
      scale_fill_brewer("Blues") + 
      ggtitle("Different proportion of surivial rate on different Marital Status") + 
      ylab('decimals are corelated survival rate')
  })
  
  output$plot_chart <- renderPlot({
    if (input$typeselect == "bar") {
      ggplot(Breast_Cancer_dead, aes(Race)) + geom_bar()
    } else if (input$typeselect == "histogram") {
      ggplot(Breast_Cancer_dead, aes(differentiate)) + geom_histogram(stat="count")
      
    }
    else if (input$typeselect == "scatter") {
      ggplot(Breast_Cancer, aes(`Tumor Size`, `Survival Months`)) + geom_point() +
        stat_smooth(method = "lm")
    }
  })
  output$plot_info <- renderText ({
    if (input$typeselect == "bar") {
      "The bar plot demonstrates the race mortality information.
      In the breast cancer dataset, white females have the most death numbers,  
      it is possible because that dataset has most white female samples"
      
    } else if (input$typeselect == "histogram") {
     
      "The histogram demonstrates the tumor differentiation that causes death.
      Most of death cases are moderately differentiated."
      
    }
    else if (input$typeselect == "scatter") {
    "The scatter plot demonstrates the relationship between tumor sizes and survived months.
      It is hard to conclude the correlation between these two factors since the linearities is moderate and the outliers is massive."
    }
    
  })
  output$table <- DT::renderDataTable(DT::datatable({
    Breast_Cancer_table <- Breast_Cancer %>% select(`Marital Status`, `Survival Months`, 
                                                    `Tumor Size`, Age, Race, `T Stage`, `N Stage`, `A Stage`, `Status`)
    if (input$marital != "All") {
      Breast_Cancer_table <- Breast_Cancer_table[Breast_Cancer_table$`Marital Status` == input$marital,]
    }
    if (input$Months != "All") {
      Breast_Cancer_table<- Breast_Cancer_table[Breast_Cancer_table$`Survival Months` == input$Months,]
    }
    Breast_Cancer_table
  }))
  
}






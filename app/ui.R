
library(shiny)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(bslib)

Breast_Cancer <- read_csv("data/Breast_Cancer.csv")

multi_chart_tab <- tabPanel(
  "Death Counts",
  fluidPage(
    titlePanel(HTML('<h1 style="color:#4B0082;">Death count on different stages</h1>')),
    HTML('The first interactive page presents three different kinds of charts for breast cancer mortality information.'),
    hr(),
  
  sidebarLayout(
    selectInput(inputId = "typeselect",
                "Select the corresponding plot type:", 
                choices = c("bar", "histogram", "scatter"),
                
    ),
    
    mainPanel(
      plotOutput(outputId = "plot_chart"),
      textOutput(outputId = "plot_info")
    )
  )
  )
)

pie_chart_tab <- tabPanel(
  "Survival Rate",
  fluidPage(
    titlePanel(HTML('<h1 style="color:#4B0082;">Survival Rate based on Marital Status</h1>')),
    HTML('The pie chart reveal the survial rate based on different Marital Status, 
             by hitting the checkboxes on the left, it can present different pie charts based on
             different Marital Status selected.'),
    hr(),
  ),
  
  fluidRow(
    column(6,offset = 2,
    checkboxGroupInput(inputId = "Status",
                "check the following status:", 
                choices = unique(Breast_Cancer$`Marital Status`),
                selected = "Married"
  ),
  
  column(12, offset = 4,
      plotOutput(outputId = "pie_chart"),
      
    )
    )
  )
)


table_tab <- tabPanel(
  "Table",
  fluidPage(
    titlePanel(HTML('<h1 style="color:#4B0082;">Summarized table</h1>')),
    HTML("The following table is used to cross-filter or search the clinical factors that affects mortality"),
    hr(),
  ),
  fluidRow(
    column(4,
           selectInput("marital",
                       "Marital Status:",
                       c("All",
                         unique(as.character(Breast_Cancer$`Marital Status`))))
            
    ),
    column(4,
           selectInput("Months",
                       "Survival Months:",
                       c("All",
                         unique((Breast_Cancer$`Survival Months`))))
    )
  ),
  DT::dataTableOutput("table")
)

report_tab <- tabPanel(
  "Summary takeaways",
   fluidPage(
    HTML('<h3 style="color:#4B0082;">Research Questions</h3>'),
    h6("What is the relationship that race and location (sourced by zip code) have with the number of breast cancer cases?"),
    h6("What is the correlation between breast cancer and marital status?"),
    h6("Which of the three stages of cancer is the one that affects a patient's chance of survival the most?"),
    HTML('<h3 style="color:#4B0082;">Summary takeaways</h3>'),
    p("We found that African American and Hispanic women are the most likely to develop breast cancer. Looking at the chart, we also see that the breast cancer ratio is higher in the location with zip code 60083 than the location with zip code 60084 even though they both represent Lake County, Illinois. This may have to do with the racial breakdown of the two counties, as 60083 had 11.4% African American population while a zip code like 60020 only had 0.9% African American population, and thus subsequently had a much lower Breast Cancer rate."),
    img(src = "p0.png", height = 400, width = 800, align = "center"),
    p("We did not find a strong positive correlation between the diagnosis of breast cancer and marital status, however in general married women have a lower mortality rate. This can be seen in the pie chart, where married women have a higher survival rate at 0.86 compared to women who are widowed, separated, divorced or single."),
    img(src = "p2.png", height = 450, width = 800, align = "center"),
    p("We found that the earlier someone is diagnosed, the higher their chance of survival. We found stage 3 to be curable and stage 4 as having the highest mortality rate. In A Stage, mortality rate is much higher if the cancer is regional (spread to nearby structures or lymph nodes) versus distant (spread to distant parts of the body such as lungs, liver or bones). T stage refers to the size of tumor, T2  (More than 2 cm but less than 5 cm) has the highest mortality rate. N refers to the number of lymph nodes spread to, N1 (Cancer has spread to 1-3 axillary lymph nodes)  is the highest number of deaths. Therefore, the earlier the stage, and if the cancer is distant, the higher chance and time of survival there is."),
    img(src = "p3.png", height = 500, width = 800, align = "center"),
    HTML('<h1 style="color:#4B0082;">Conclusion</h1>'),
    p("Unfortunately, Breast Cancer remains a large issue in the United States, as approximately 1 in 8 women in the United States will develop Breast Cancer, and 1 in 39 women will die from Breast Cancer in the U.S. Furthermore, women of color, especially African American and Hispanic women who already face tremendous oppression and discrimination have a much higher chance of being diagnosed with Breast Cancer and are often unable to obtain the proper treatment early enough. Furthermore, we want to ensure that women in the United States understand how important having emotional and financial support is, as well as the importance of catching Breast Cancer in its earlier stages. With this in mind, we hope our project has established some correlations between certain attributes and likelihood of being diagnosed with Breast Cancer, and establish systems to help all people get equal access to information and treatment in regards to Breast Cancer. We hope not to increase fear about Breast Cancer, but to have people acknowledge that Breast Cancer is a very real and common health hazard in the United States, and that people should
    be aware of its causes and stages. By educating the public, both those suffering from Breast Cancer or those interested in working on mitigating the prevalence of Breast Cancer in the UNited States will be able 
    to utilize data and knowledge in order to help those who are at the greatest risk of developing Breast Cancer or dying as a result of Breast Cancer."), 
    p("In summary, a couple of the important findings that we found that we want to highlight are that African American and Hispanic women are more likely to develop Breast Cancer (have a much higher proportion of Breast Cancer cases in comparison to their proportion to the total population), married women tend to have a slightly higher survival rate compared to women who are single, separated, widowed or divorced and Breast Cancer discovered in earlier stages have a much higher chance of treatment allowing for survival. These findings present important information relating to likelihood of developing Breast Cancer, and what decisions can be made to maximize one’s survival odds. From a human perspective, it is disheartening to think that one’s friend, partner, or relative can be diagnosed with Breast Cancer, but it is important to raise awareness and focus on solutions and treatment before it is too late. ")
   )
)
conclusion_tab <- tabPanel(
  "Report",
  fluidPage(
    HTML('<h1 style="color:#4B0082;">Report</h1>'),
    strong("Code name:"),
    p("breast_cancer_analysis"),
    strong("Project title"),
p("Don't panic: interpreting the breast cancer
"),
    strong("Authors"),
    p("
Jiacheng Gong (jchengg@uw.edu)
Ferryn Drake (fdrake@uw.edu)
Anneliese Boucher (anelabee@uw.edu)
Benjamin Po (bkp2002@uw.edu)
"),
strong("
Affiliation
"),
p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
strong('Date'),
p("Autumn 2022"),
strong("Abstract"),
p("The main question is that the public lacks awareness of breast cancer due to its invisibility and prevalence. This question is important because breast cancer harms and changes the lives of women all across the world. To address such an issue, we plan to structure a research for breast cancer to provide information support to the public and breast cancer patients."),
strong('Keywords'),
p("human physiology, cancer stage, data related individual breast cancer cases, clinical indicators of breast cancer
"),
strong("Introduction"),
p("Other than skin cancer, breast cancer is the most common cancer among American women, according to the CDC. However, it is unfortunate that many people still do not realize how personally risky breast cancer is. The American cancer society shows that each year in the United States, about 264,000 women get breast cancer and 42,000 die from the disease. Plenty of them could survive if breast cancer is diagnosed and treated promptly. We hope to use the data that takes clinical indicators to analyze, using our analysis to educate the public about breast cancer, both for the benefit of the healthy and those who are already battling the disease. Meanwhile, it is vital to clarify the misunderstanding of breast cancer to break people's fear of cancer and let their nerves off."),
strong("Problem domain"),
p("sociotechnical situation"),
p("In modern culture, the pursuit of health and longevity continues unabated.Breast cancer, a disease with a disproportionate patient number of men and women, should receive more attention. Although the five-year relative survival for breast cancer is 90.5%. However, when breast cancer isn't detected early, the consequences of breast cancer are much more dangerous and terminal, only 6% of these patients are in the distant (late) stage. Breast cancer, despite being a mild cancer with a high chance of cure, is extremely lethal for patients in its late stages.dangerous and terminal. There are many reasons for late detection of breast cancer in patients, but it is mainly due to lack of adequate attention and appropriate background knowledge. Meanwhile, the female group has a higher chance to be minoritized or marginalized. The female population may be persecuted for more unpaid work or other reasons that leads them to having less accessibility to Breast Cancer Prevention. The female minority are more likely prosecuted by either unequal medical resources or education level."),
p("Project frame"),
p("As a result, it is essential to carry out research on breast cancer, which requires the use of three data files in order to perform an in-depth analysis of the indicators and factors related to breast cancer. The study not only has the potential to serve as an important guide for women living in low-income areas and members of certain racial groups to ensure that they are paying attention to their bodies, but it also has the potential to serve as a reference for society as a whole to invest more resources in assisting those individuals.

With 85% of breast cancer patients having no family history of the disease, our society should keep dedicating more and spreading awareness of breast cancer."),
img(src = "breast-cancer-family-history.png", height = 425, width = 350, align = "center"),
p(""),
strong("
The project intends to implement the following human values:
"),
p(""),
p("Empathy"),
p("Respect"),
p("Acceptance"),
p("Love"),
p("From a human value perspective, breast cancer plays a large role. No one wants to see a family member, a friend, or anyone they care about suffer from this disease. People care about having a healthy and long life, which breast cancer can get in the way of that goal. According to BreastCancer.org, 'Breast cancer is the most commonly diagnosed cancer among American women. In 2022, it's estimated that about 30% of newly diagnosed cancers in women are going to be breast cancers.'The wide spread that breast cancer has in our society is massive. Which continues to show that people care about spreading awareness and raising funds to help those in need. Also showing why people place such a high value on the month of October. By dedicating a whole month to Breast Cancer Awareness, everyday people are showing how much they value fighting this disease and bringing attention to prevention and treatment methods."),
strong("Stakeholders"),
p("Direct stakeholders"),
p("The direct stakeholders are any women that look at this data to analyze the contributing factors associated with breast cancer diagnosis and mortality. This data can be used to see what components to a woman (like age, race, cancer differentiation, etc.) contributed to a smaller survival rate."),
p("Indirect stakeholders"),
p("
The indirect stakeholders of breast cancer diagnosis are those who may not suffer from the disease but have a loved one that does. Breast cancer treatment is not cheap and is not fast. When a mother, sister, boss, friend, or any person in your life is diagnosed, their main attention and priority is healing. Therefore, this can easily have harmful effects on the people around them.
"),
strong("Harms"),
p("Evidently, there are many harmful effects of breast cancer. When caught early, the treatment and survival rate are known to be much more favorable for the patient. However, there are factors outside of early detection that contribute to breast cancer diagnosis. According to data found by the National Cancer Institution between 2010-2014, 'The average age of diagnosis of breast cancer was 62 years. Furthermore, breast cancer in women is most often diagnosed between the ages of 55 and 64 years.' So, women of an older age are at a higher risk for developing breast cancer."),
strong("Research questions"),
p("What kind of relationship does race and location(sourced by zip code) have with the number of breast cancer cases? We want to discover whether the disadvantage brought by location and race has any effects on cancer treatment. This is critical in helping cancer patients who are racially or locationally disadvantaged."),
p("
Is there a correlation between serveries and marital status? We would like to know if marital status affects a woman's quality of life and therefore the incidence of breast cancer.This can reflect whether the status of women in the family and the quality of life after marriage are influenced by gender
"),
p("
Which one of the three stages of cancer is the one that affects a patient's chance of survival the most? The three different cancer stages represent three different metrics, and we noticed that there are some examples where A stage is distant but the patient dies. It is important to know which indicator most affects the progression of the disease for breast cancer science.
"),
strong("The dataset"),
p("Breast_cancer.csv"),
p("The dataset provides information on population-based cancer statistics sampled from 2007-2011 from female patients with lobular carcinoma breast cancer. The data set offers many usable samples and variables, making it easier for me to investigate all three of the research questions. Breast_cancer.csv is collected by RIHANNA NAMDARI, a user from Kaggle. The authors created the dataset to provide resources and support to the U-BRITE for the 'AI against CANCER DATA SCIENCE HACKATHON' campaign. The authors and the U-BRITE organization may have contributed funds to the data. The authors and the U-BRITE organization and cancer research organizations that need relevant data may benefit from the data. Breast_cancer csv is the secondary data extraction from the National Cancer Institute's SEER Program. The SEER program is a government organization for cancer research that is more credible, but may lack timeliness due to secondary extraction.Google data research is used to collect the selected data.Combined with the Google description and self search verification, the data source is relatively reliable."),
p("Cancer_Rates .numbers"),
p("
The dataset provides various Cancer Rates for Lake County, Illinois. The dataset includes the rate of breast cancer and zip codes within the county, which is crucial for me to examine question one: if breast cancer rate correlates with the location.
"),
p("Cancer_Rates .numbers are collected by DATA.GOV, an official website of the U.S. government. The author creates the dataset for public health consideration and medical policy reference. Taxpayers and governments fund the data. All U.S. citizens and residents may benefit from the data. Since the data is sourced and verified from the government's official website based on actual medical history and reports, it is relatively reliable. We acquire this data from the Google search engine by searching the 'government official data' keyword. We believe the source is credible"),
p("explorer_download"),
p("The dataset provides SEER 5-Year Age-Adjusted Incidence Rates, 2015-2019, based on race/ethnicity. The dataset demonstrates the breast cancer indicators based on race, which is essential for me to examine question one: if breast cancer rate correlates with race.

explorer_download is collected by SEER, a government organization for cancer research. Public donations and government subsidies may help fund the data. Breast cancer patients or other medical organizations may benefit from the data. The dataset is directly sourced by SEER, which collects data from authorities and medical facilities. Therefore, the data is credible. We obtain the data from Google data search by referring to the description and verifying by personal judgment. We think the source is reliable.
"),
strong("Findings"),
p("One major finding that we found was that there is a visible correlation between race and Breast Cancer, as African American and Hispanic women were more likely to be diagnosed than their 
counterparts. We found this as locations with higher percentage populations of African American and Hispanic women tended to have higher Breast Cancer rates. While we only tested this at the county level by comparing ZIP codes in Illinois, we estimate that this pattern is concurrent in other states and on a national level. This is an important finding as it demonstrates how raising awareness in minority communities is crucial to help as many women as possible get diagnosed early and have the highest chance of surviving. Another major finding that we discovered in our data was that although there was not a strong correlation, married women tended to have higher survival rates as opposed to women who were widowed, divorced, separated or single. While the exact reason is unclear, we estimate this may be because of the emotional or financial support offered by marriage and a stable familial relationship. However, the difference between survival rates is only a few percentage points, so the correlation is not completely clear, and not strong enough to say for certain if marital status has a substantial impact on the survival rate of a woman diagnosed with Breast Cancer. The last finding that we found within our data was that the earlier Breast Cancer is diagnosed, the greater the likelihood and time a woman has to survive. For example, if the Cancer is found to be distant and still relatively small in size and has not spread to many nodes, it is likely that the woman can survive with the proper treatment. We found this finding by looking at our data and seeing that if Breast Cancer is regional, and the size of the tumor has grown beyond 4 or 5 centimeters in size, and has spread to over 4 lymph nodes, the chances of survival are very slim. On a larger level, all three of these findings were interesting and demonstrated to us that Breast Cancer does correlate with systems of oppression, and that minorities are at greater risk of being diagnosed and dying of Breast Cancer as opposed to white women. This reinforces the importance of raising awareness and ensuring that people are knowledgeable about their risk of being diagnosed with Breast Cancer, and can take action before Breast Cancer becomes fatal.
"),
strong("Discussion"),
p("Besides Skin Cancer, Breast Cancer is the most common cancer found in American women and remains a huge health issue in the United States as well as many other countries. With Breast Cancer being so prevalent in the United States, our findings have important implications as people need to be aware of how it is actually very possible they may be diagnosed with Breast Cancer. As stated earlier, Breast Cancer is not necessarily linked with genetic factors, as many women who are diagnosed with Breast Cancer do not have a family history of it. Concurrent with our findings above, it is evident that environmental and racial factors do play a factor on both a woman's likelihood to be diagnosed with Breast Cancer as well as her survival rate once she is diagnosed. These findings have important implications because it shows that women who are already facing prejudice and oppression from other systems are also at greater risk of being diagnosed with Breast Cancer, and subsequently dying from it. Further compounding the problem, there is no cure for Breast Cancer and the best available option is getting treatment for Breast Cancer, which may only allow survival in most women if diagnosed early enough. Our findings are important because by presenting visual data clearly, we can raise awareness to all women about the dangers and risks of Breast Cancer, as well as what factors they should consider about themselves to see if they are at a higher risk. This awareness may help encourage more women to get checked regularly for Breast Cancer, and allow for women of all races and backgrounds to get Breast Cancer discovered early if they have it, and thus grant them a significantly higher chance of survival by starting treatment while the cancer is still in its early stages. Besides maximizing awareness and informing people about the stages of Breast Cancer, our findings about marital status and survival rates may suggest that women with emotional and financial support are more likely to survive. With this in mind, our findings may help or incite others to create organizations to offer financial or emotional support to women diagnosed with Breast Cancer in order to maximize their chances of survival. With so many women affected in the U.S alone annually by Breast Cancer, it is important that we can spread information about  the correlations certain environmental and personal factors have with the diagnoses and survival rates in regards to Breast Cancer. 
"),
strong('Conclusion'),
p("Unfortunately, Breast Cancer remains a large issue in the United States, as approximately 1 in 8 women in the United States will develop Breast Cancer, and 1 in 39 women will die from Breast Cancer in the U.S. Furthermore, women of color, especially African American and Hispanic women who already face tremendous oppression and discrimination have a much higher chance of being diagnosed with Breast Cancer and are often unable to obtain the proper treatment early enough. Furthermore, we want to ensure that women in the United States understand how important having emotional and financial support is, as well as the importance of catching Breast Cancer in its earlier stages. With this in mind, we hope our project has established some correlations between certain attributes and likelihood of being diagnosed with Breast Cancer, and establish systems to help all people get equal access to information and treatment in regards to Breast Cancer. We hope not to increase fear about Breast Cancer, but to have people acknowledge that Breast Cancer is a very real and common health hazard in the United States, and that people should be aware of its causes and stages. By educating the public, both those suffering from Breast Cancer or those interested in working on mitigating the prevalence of Breast Cancer in the UNited States will be able to utilize data and knowledge in order to help those who are at the greatest risk of developing Breast Cancer or dying as a result of Breast Cancer. "),
p("In summary, a couple of the important findings that we found that we want to highlight are that African American and Hispanic women are more likely to develop Breast Cancer (have a much higher proportion of Breast Cancer cases in comparison to their proportion to the total population), married women tend to have a slightly higher survival rate compared to women who are single, separated, widowed or divorced and Breast Cancer discovered in earlier stages have a much higher chance of treatment allowing for survival. These findings present important information relating to likelihood of developing Breast Cancer, and what decisions can be made to maximize one’s survival odds. From a human perspective, it is disheartening to think that one’s friend, partner, or relative can be diagnosed with Breast Cancer, but it is important to raise awareness and focus on solutions and treatment before it is too late. "),
strong(" Acknowledgements"),
p("Thanks to our TA Jinrui and Professor Winegarden!"),
strong("References"),
p("'Breast Cancer Facts and Statistics ' Breast Cancer Facts and Statistics, https://www.breastcancer.org/facts-statistics"),
p("Basic Information about Breast Cancer. Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 26 Sep. 2022, https://www.cdc.gov/cancer/breast/basic_info/index.htm#:~:text=Each%20year%20in%20the%20United,What%20Is%20Breast%20Cancer%3F."),
p("
Cancer Rates - Catalog. (n.d.). Cancer Rates - Catalog. Retrieved October 31, 2022, from https://catalog.data.gov/dataset/cancer-rates-5cf0c
"),
p("Breast Cancer. (n.d.). Breast Cancer | Kaggle. Retrieved October 31, 2022, from https://www.kaggle.com/datasets/reihanenamdari/breast-cancer
"),
p("Cancer of the Breast (Female) - Cancer Stat Facts. (n.d.). SEER. Retrieved October 31, 2022, from https://seer.cancer.gov/statfacts/html/breast.html Total work time. (2016, January 12)."),
p("Gender Equality Observatory. Retrieved October 31, 2022, from https://oig.cepal.org/en/indicators/total-work-time United Cancer Support Foundation of Knoxville Tennessee. (2022, June 10)."),
p("United Cancer Support Foundation. Retrieved October 31, 2022, from https://unitedcsf.org"),
p("Cancer Rates - Catalog. (n.d.). Cancer Rates - Catalog. Retrieved October 31, 2022, from https://catalog.data.gov/dataset/cancer-rates-5cf0c")

)
)

introduction_tab <- tabPanel(
  "Introduction",
  fluidPage(
  HTML('<h4 style="color:	#4B0082;">Authors: Jiacheng Gong, Ferryn Drake, Anneliese Boucher, Benjamin Po</h4>'),
  p("
Whether you personally know someone with breast cancer, know of people that have been affected by it, or seen the statistics that breast cancer holds, breast cancer is the second most common cancer among American women. Every year in the United States, roughly 264,000 women are diagnosed with breast cancer and 42,000 pass away from the disease. While treatment and modern day science continue to advance to help save women from the terminal effects of this disease, a cure has not been found. However, there are certain elements to the disease and its identification that can be the difference between life and death from breast cancer. By analyzing three data sets that hold various statistics of breast cancer amongst women, we are able to make an analysis of the indicators and factors related to its detection and a patient's likelihood of survival.
"),
  p("We have ", strong("three main points of research and questions"), "that we analyze through the data."),
  p("The first question deals with the", strong ("mortality aspect"), "Is there a relationship between breast cancer and races , tumor differentiate or tumor size ? Are there certain disadvantages that a person could be predisposed to just because of their personal circumstancesThese disadvantages could include lack of services available to people in that area, more difficult opportunities to receive a screening, etc. These implications could have a direct effect on the likelihood of survival.  
"),
  p("The next question deals with the ", strong("marital status of a patient")," Is there a correlation between breast cancer and marital status of a woman? This data is important to analyze because being married or being single can affect how cancer is treated. This information is important to look at because it should be widely known amongst women. While marital status might not be the first thing a person thinks about with breast cancer detection, it is an aspect of a woman’s life that could affect the outcome of the disease."),
  p("The final question has to do with the ", strong("effects of the stage of breast cancer at detection."), "What stages of breast cancer showcase a more severe case of breast cancer. On a scientific level, it is important to note which stage of breast cancer tends to lead to more extreme cases but also on the human level. Having correct and relevant information about a disease that is established in society can encourage women to make sure they get breast cancer frequently."),
  img(src = "BreastAwareness.png", height = 440, width = 880, align = "center"),
  h6("Dataset"),
  p("The breast cancer data sourced from Kaggle"),
  a(href="https://www.kaggle.com/datasets/reihanenamdari/breast-cancer", "Click here!"),
  p("The Cancer_Rates data sourced from DATA.GOV"),
  a(href = "https://catalog.data.gov/dataset/cancer-rates-5cf0c", "Click here!"), 
  p("explorer_download source from SEER"), 
  a(href = "https://seer.cancer.gov/statfacts/html/breast.html%20Total%20work%20time", "Click here!" )
  )
)

ui <- navbarPage(theme = bs_theme(bootswatch = "minty"),
                  
  titlePanel("Don’t Panic: Interpreting Breast Cancer Data"), 
  introduction_tab,
  multi_chart_tab,
  pie_chart_tab,
  table_tab,
  report_tab,
  conclusion_tab
)

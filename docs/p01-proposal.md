# Don't panic: interpreting the breast cancer: Project Proposal

### Code name

breast_cancer_analysis

### Project title:

Don't panic: interpreting the breast cancer

### Authors

Jiacheng Gong([jchengg\@uw.edu](mailto:jchengg@uw.edu){.email})

Ferryn Drake ([fdrake\@uw.edu](mailto:fdrake@uw.edu){.uri})

Anneliese Boucher

Benjamin Po

### Affiliation

INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date

Autumn 2022

### Abstract

The main question is that the public lacks awareness of breast cancer due to its invisibility and prevalence. This question is important because breast cancer harms and changes the lives of women all across the world. To address such an issue, we plan to structure a research for breast cancer to provide information support to the public and breast cancer patients.

## Keywords

**human physiology**, **cancer stage**, **data related individual breast cancer cases**, **clinical indicators of breast cancer**

## Introduction

Other than skin cancer, breast cancer is the most common cancer among American women, according to the [CDC](https://www.cdc.gov/cancer/breast/basic_info/index.htm#:~:text=Each%20year%20in%20the%20United,What%20Is%20Breast%20Cancer%3F). However, it is unfortunate that many people still do not realize how personally risky breast cancer is. The American cancer society shows that each year in the United States, about 264,000 women get breast cancer and 42,000 die from the disease. Plenty of them could survive if breast cancer is diagnosed and treated promptly. We hope to use the data that takes clinical indicators to analyze, using our analyswes to educate the publwec about breast cancer, both for the benefit of the healthy and those who are already battling the disease. Meanwhile, it is vital to clarify the misunderstanding of breast cancer to break people's fear of cancer and let their nerves off.

## Problem Domain

***sociotechnical situation***

In modern culture, the pursuit of health and longevity continues unabated.Breast cancer, a disease with a disproportionate patient number of men and women, should receive more attention. Although the [five-year relative survival](https://seer.cancer.gov/statfacts/html/breast.html) for breast cancer is 90.5%. However, when breast cancer isn't detected early, the consequences of breast cancer are much more dangerous and terminal, only 6% of these patients are in the distant (late) stage. Breast cancer, despite being a mild cancer with a high chance of cure, is extremely lethal for patients in its late stages.dangerous and terminal. There are many reasons for late detection of breast cancer in patients, but it is mainly due to lack of adequate attention and appropriate background knowledge. Meanwhile, the female group has a higher chance to be minoritized or marginalized. The female population may be persecuted for more [unpaid work](https://oig.cepal.org/en/indicators/total-work-time) or other reasons that leads them having less accessibility to Breast Cancer Prevention. The female minority are more likely prosecuted by either unequal medical resources or education level.

***Project frame***

As a result, it is essential to carry out research on breast cancer, which requires the use of three data files in order to perform an in-depth analysis of the indicators and factors related to breast cancer. The study not only has the potential to serve as an important guide for women living in low-income areas and members of certain racial groups to ensure that they are paying attention to their bodies, but it also has the potential to serve as a reference for society as a whole to invest more resources in assisting those individuals.

With 85% of breast cancer patients having no family history of the disease, our society should keep dedicating more and spreading awareness of breast cancer.

![graph](https://unitedcsf.org/wp-content/uploads/2018/10/breast-cancer-family-history.png)

The project intends to implement the following **human values**：

1.**Empathy**

2.**respect**

3.**acceptance**

4.**Love**

From a human value perspective, breast cancer plays a large role. No one wants to see a family member, a friend, or anyone they care about suffer from this disease. People care about having a healthy and long life, which breast cancer can get in the way of that goal. According to [BreastCancer.org](https://www.breastcancer.org/facts-statistics.), "Breast cancer is the most commonly diagnosed cancer among American women. In 2022, it's estimated that about 30% of newly diagnosed cancers in women are going to be breast cancers." The wide spread that breast cancer has in our society is massive. Which continues to show that people care about spreading awareness and raising funds to help those in need. Also showing why people place such a high value on the month of October. By dedicating a whole month to Breast Cancer Awareness, everyday people are showing how much they value fighting this disease and bringing attention to prevention and treatment methods.

The project takes following **stakeholders**:

1.**direct stakeholders**

The direct stakeholders are any women that look at this data to analyze the contributing factors associated with breast cancer diagnosis and mortality. This data can be used to see what components to a woman (like age, race, cancer differentiation, etc.) contributed to a smaller survival rate.

2.**indirect stakeholders**

The indirect stakeholders of breast cancer diagnosis are those who may not suffer from the disease but have a loved one that does. Breast cancer treatment is not cheap and is not fast. When a mother, sister, boss, friend, or any person in your life is diagnosed, their main attention and priority is healing. Therefore, this can easily have harmful effects on the people around them.

**harms**: Evidently, there are many harmful effects of breast cancer. When caught early, the treatment and survival rate are known to be much more favorable for the patient. However, there are factors outside of early detection that contribute to breast cancer diagnosis. According to data found by the National Cancer Institution between 2010-2014, "The average age of diagnosis of breast cancer was 62 years. Furthermore, breast cancer in women is most often diagnosed between the ages of 55 and 64 years." So, women of an older age are at a higher risk for developing breast cancer.

### Research questions

1.  What kind of relationship does race and location(sourced by zip code) have with the number of breast cancer cases? We want to discover whether the disadvantage brought by location and race has any effects on cancer treatment. This is critical in helping cancer patients who are racially or locationally disadvantaged.

2.  Is there a correlation between serveries and marital status? We would like to know if marital status affects a woman's quality of life and therefore the incidence of breast cancer.This can reflect whether the status of women in the family and the quality of life after marriage are influenced by gender

3.  Which one of the three stages of cancer is the one that affects a patient's chance of survival the most? The three different cancer stages represent three different metrics, and we noticed that there are some examples where A stage is distant but the patient dies. It is important to know which indicator most affects the progression of the disease for breast cancer science.

### The Dataset

| name of data                                                                                                                                                                                                                                                                                                                                          | num of variables | num of observations |
|-----------------------------------------------|-------------|-------------|
| [Breast_cancer.csv](https://www.kaggle.com/datasets/reihanenamdari/breast-cancer)                                                                                                                                                                                                                                                                     | 16               | 4025                |
| [Cancer_Rates .numbers](https://catalog.data.gov/dataset/cancer-rates-5cf0c)                                                                                                                                                                                                                                                                          | 9                | 27                  |
| [explorer_download](https://seer.cancer.gov/statistics-network/explorer/application.html?site=61&data_type=1&graph_type=10&compareBy=race&chk_race_1=1&chk_race_6=6&chk_race_5=5&chk_race_4=4&chk_race_9=9&chk_race_8=8&chk_race_3=3&chk_race_2=2&series=9&hdn_sex=3&age_range=1&stage=101&advopt_precision=1&advopt_show_ci=on&hdn_view=1#tableWrap) | 3                | 8                   |

The project contains three following dataset:

I.**Breast_cancer.csv**

The dataset provides information on population-based cancer statistics sampled from 2007-2011 from female patients with lobular carcinoma breast cancer. The data set offers many usable samples and variables, making it easier for me to investigate all three of the research questions. Breast_cancer.csv is collected by RIHANNA NAMDARI, a user from Kaggle. The authors created the dataset to provide resources and support to the U-BRITE for the "AI against CANCER DATA SCIENCE HACKATHON" campaign. The authors and the U-BRITE organization may have contributed funds to the data. The authors and the U-BRITE organization and cancer research organizations that need relevant data may benefit from the data. Breast_cancer csv is the secondary data extraction from the National Cancer Institute's SEER Program. The SEER program is a government organization for cancer research that is more credible, but may lack timeliness due to secondary extraction.Google data research is used to collect the selected data.Combined with the Google description and self search verification, the data source is relatively reliable.

**II.Cancer_Rates .numbers**

The dataset provides various Cancer Rates for Lake County, Illinois. The dataset includes the rate of breast cancer and zip codes within the county, which is crucial for me to examine question one: if breast cancer rate correlates with the location.

Cancer_Rates .numbers is collected by DATA.GOV, an official website of the U.S. government. The author creates the dataset for public health consideration and medical policy reference. Taxpayers and governments fund the data. All U.S. citizens and residents may benefit from the data. Since the data is sourced and verified from the government's official website based on actual medical history and reports, it is relatively reliable. We acquire this data from the Google search engine by searching the "government official data" keyword. We believe the source is credible.

**III.explorer_download**

The dataset provides SEER 5-Year Age-Adjusted Incidence Rates, 2015-2019, based on race/ethnicity. The dataset demonstrates the breast cancer indicators based on race, which is essential for me to examine question one: if breast cancer rate correlates with race.

explorer_download is collected by SEER, a government organization for cancer research. Public donations and government subsidies may help fund the data. Breast cancer patients or other medical organizations may benefit from the data. The dataset is directly sourced by SEER, which collects data from authorities and medical facilities. Therefore, the data is credible. We obtain the data from Google data search by referring to the description and verifying by personal judgment. We think the source is reliable.

### Expected Implications

Suppose We have successfully answered the above research questions.

If We are able to demonstrate that there is a correlation between the number of people diagnosed with breast cancer and their race, then potentially more resources will be made available to assist those who are in a disadvantaged position.

If the answer to our second question can be found, We believe it will pave the way for increasingly credible research on the relationship status of women and the health conditions they face.There is a possibility that some married women, in particular situations, have a heightened awareness of breast cancer.

If the response to our third question can be considered reasonable. We believe that it will be educational regarding the treatment of breast cancer and that it will also encourage the development of new treatment options and additional research.

### Limitations

Finding a correlation between the three datasets is one of the limitation we have. We must determine an appropriate method for processing the data files based on varying sample sizes and characteristics. We may have trouble finding ways to visualize data, which may involve some statistical knowledge, or parts of code we haven't learned We may have difficulty in analyzing the data, and the breast cancer topic involves some terminology that we may need to interpret with reference to some medical sources. The data are not uniform because the three data sources are from different backgrounds. each data file's sampling size and population may vary and the breast cancer data may be inaccurate as a result. Some indicators in the dataset may not be well utilized because of massive amount of observations and variables.

### References

"Breast Cancer Facts and Statistics ." Breast Cancer Facts and Statistics, <https://www.breastcancer.org/facts-statistics>. "

Basic Information about Breast Cancer." Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 26 Sep. 2022, <https://www.cdc.gov/cancer/breast/basic_info/index.htm#>:\~:text=Each%20year%20in%20the%20United,What%20Is%20Breast%20Cancer%3F.

Cancer Rates - Catalog. (n.d.). Cancer Rates - Catalog. Retrieved October 31, 2022, from <https://catalog.data.gov/dataset/cancer-rates-5cf0c>

Breast Cancer. (n.d.). Breast Cancer \| Kaggle. Retrieved October 31, 2022, from <https://www.kaggle.com/datasets/reihanenamdari/breast-cancer>

Cancer of the Breast (Female) - Cancer Stat Facts. (n.d.). SEER. Retrieved October 31, 2022, from <https://seer.cancer.gov/statfacts/html/breast.html> Total work time. (2016, January 12).

Gender Equality Observatory. Retrieved October 31, 2022, from <https://oig.cepal.org/en/indicators/total-work-time> United Cancer Support Foundation of Knoxville Tennessee. (2022, June 10).

United Cancer Support Foundation. Retrieved October 31, 2022, from <https://unitedcsf.org>

Cancer Rates - Catalog. (n.d.). Cancer Rates - Catalog. Retrieved October 31, 2022, from <https://catalog.data.gov/dataset/cancer-rates-5cf0c>

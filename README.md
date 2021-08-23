# dissertation

This folder contains the code to support the dissertation: Lockdown Lifted: Understanding explanatory features of spatial resilience from London's public transport demand recovery. 

### Abstract

The disruptive effects of the Covid-19 pandemic has rapidly shifted how individuals navigate cities. In the context of public transport, there are concerns that behaviour will shift towards a car-driven future. Academia, industry, and transport providers are actively studying behaviour changes to identify future trends. A resilience perspective may aid the discussion around recovery – particularly a recovery that may not be a return to pre-pandemic behaviour. This research specifically focusses on London’s public transport system and introduces the concept of spatial resiliency to the existing body of research. It defines spatial resiliency as the rate of recovery in public transport demand at the Middle Super Output Area (MSOA) level. This perspective identifies relationships between spatial attributes and the rate of recovery in public transport demand. The scope of the analysis begins after the first lockdown restrictions were lifted and before new restrictions were introduced in mid-September. 
This research builds on methods that investigated spatial resiliency of transport systems after climate disruptions through global modelling. A localised perspective is added to existing spatial resiliency research through the introduction of local indicators of spatial autocorrelation (LISA) and a Geographic Weighted Regression (GWR) model. In London, it finds spatial dependencies in the below average rate of recovery in inner London and an above average rate of recovery in the outer south. Spatial attributes of socioeconomic, built environment, and risk perception features are analysed to identify statistically significant contributions. Through spatial regression modelling, it is found that income, car ownership, and density of public transport infrastructure have the greatest influence on spatial patterns in resiliency. Furthermore, influential relationships vary locally, inviting future research to examine the drivers of this spatial heterogeneity. The research concludes with recommendations for TfL to capture the influences of homeworking, ensure funding for a minimum level of service, and advocates for a polycentric recovery.

### Methodology

The code contains six primary notebooks: 
1. Data Processing (01_data_processing_v3 & 01_data_processing)
2. Counterfactual Estimate (02-analysis_prediction2020)
3. Calculate Resilience Measure (03.1-analysis_recoveryrate)
4. Spatial Analysis (03.2-analysis_featurecreation & 04-analysis_spatialmodel_v2). 

The workflow largely follows the diagram below:

![image](https://user-images.githubusercontent.com/72401618/130419477-922012c6-934a-4b3c-b6d9-7e7d51236366.png)

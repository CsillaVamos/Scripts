###########################################################################
###########################GENERAL HEALTH ANALYSIS


#make correct path for libraries
.libPaths()

#upload libraries
library(sp)
library(raster)
library(terra)
library(sf)
library(tiff)
library(stars)
library(units)
library(maptools)
library(devtools)
library(readr)
library(rgdal)
library(dplyr)
library(sf)
library(tidyverse)
library(rgeos)
library(sp)
library(tmap) 
library(raster)
library(sfheaders)
library(knitr)
library(MASS)
library(purrr)
library(broom)
library(ggplot2)




##############################################################
###UPLOAD DATASETS

health_survey <- read.csv("Data/Amigo_FUP2023_health.csv", sep = ",")

results <- read.csv("final_results/final_results3.csv", sep = ";")

head(health_survey)
head(results)



###########clean datasets

#keep wanted columns
health_survey <- subset(health_survey, select = c(bsex, education, gage, geoid, ghealth, ggbstr, ggbnbh, ggbview))

#rename 
names(health_survey)[names(health_survey) == "bsex"] <- "sex"
names(health_survey)[names(health_survey) == "gage"] <- "age"
names(health_survey)[names(health_survey) == "ghealth"] <- "health"
names(health_survey)[names(health_survey) == "ggbstr"] <- "street"
names(health_survey)[names(health_survey) == "ggbnbh"] <- "nghbrhd"
names(health_survey)[names(health_survey) == "ggbview"] <- "houseview"

#drop unwanted columns
results$X <- NULL
results$cohort1 <- NULL
results$gedate <- NULL
results$qc2023 <- NULL


#rename 
names(health_survey)[names(health_survey) == "bsex"] <- "sex"
names(health_survey)[names(health_survey) == "gage"] <- "age"
names(health_survey)[names(health_survey) == "ghealth"] <- "health"

names(results)[names(results) == "bsex"] <- "sex"
names(results)[names(results) == "gage"] <- "age"
names(results)[names(results) == "ghealth"] <- "health"


#merge datasets


merged_data <- results %>%
  left_join(health_survey, by = "geoid")

head(merged_data)

##############################################################################################
##CALCULATE THE STATISTICS

# Fit proportional odds model
model_D_allgrn <- polr(
  outcome ~ sex + education + street + nghbrhd + houseview + age + D_allgrn_bl,
  data = your_data,
  Hess = TRUE
)

# Extract coefficient and standard error
coefs <- coef(summary(model_D_allgrn))
beta  <- coefs["D_allgrn_bl", "Value"]
se    <- coefs["D_allgrn_bl", "Std. Error"]

# Compute OR and 95% CI
OR      <- exp(beta)
CI_low  <- exp(beta - 1.96 * se)
CI_high <- exp(beta + 1.96 * se)

# Compute AIC
model_AIC <- AIC(model_D_allgrn)

# Print results
list(
  OR = OR,
  CI_low = CI_low,
  CI_high = CI_high,
  AIC = model_AIC
)



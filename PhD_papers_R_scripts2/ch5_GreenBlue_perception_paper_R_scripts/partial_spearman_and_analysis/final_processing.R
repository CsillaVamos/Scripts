###########################################################
########FINAL PROCESSESING


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


##################################
###UPLOAD Data

#almost complete results
results <- read.csv("Data/model_results_geoid_22042025.csv")

#park_bl_600m
park_bl_600m <- read.csv("Euclidean_buffer_results/parksblue_percent_of_greenblue_space_within_600mbuffer.csv")

#rec_bl_600m
rec_bl_600m <- read.csv("Euclidean_buffer_results/landuse_recreation_percent_of_greenblue_space_within_600mbuffer.csv")

#Treeheight_bl_600m
TH_bl_600m <- read.csv("Euclidean_buffer_results/treeheightblue_ave_per_buffer600.csv")


##############clean data


###parks_bl
park_bl_600m <- park_bl_600m %>%
  group_by(geoid) %>%
  summarise(E_parks_bl_600m = sum(parks_and_water_pcnt, na.rm = TRUE))

park_bl_600m[4453, "E_parks_bl_600m"] <- 100

###rec_bl
rec_bl_600m <- rec_bl_600m %>%
  group_by(geoid) %>%
  summarise(E_rec_bl_600m = sum(LU_rec_and_water_pcnt, na.rm = TRUE))

###treeheight_bl
TH_bl_600m <- TH_bl_600m %>%
  group_by(geoid) %>%
  summarise(E_TH_bl_600m = sum(treeheightblue_val, na.rm = TRUE))



#########merge together all datasets
E_600m_parks_rec <- merge(park_bl_600m, rec_bl_600m, by = "geoid")
E_600m_parks_rec_TH <- merge(E_600m_parks_rec, TH_bl_600m, by = "geoid")
nrow(E_600m_parks_rec_TH)
head(E_600m_parks_rec_TH)

allresults <- merge(results, E_600m_parks_rec_TH, by = "geoid")

allresults2 <- allresults

#################organize all results

head(allresults2)
colnames(allresults2)

#delete unnecessary columns
allresults2 <- allresults2[ , !(names(allresults2) %in% c("X", "NB_area", "visible_pcnt_20m", "visible_pcnt_50m", "visible_pcnt_150m"   )) ]

write.csv(allresults2, "final_results/final_results_raw.csv")


##########################move columns as needed


###############################merge in VS_20m data

model_results <- read.csv("final_results/final_results.csv", sep = ";")

VS_20m <- read.csv("Data/VS_20m_allresults_geoid.csv")

model_results <- merge(model_results, VS_20m, by = "geoid")

model_results
write.csv(model_results, "final_results/final_results2.csv")


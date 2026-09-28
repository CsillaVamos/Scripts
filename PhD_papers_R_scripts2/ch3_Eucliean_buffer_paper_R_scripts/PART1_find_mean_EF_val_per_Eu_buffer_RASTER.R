
#########################################################################################################
###Script for creating Euclidean buffers, adapated from Tian's script############################################

#NOTE will need to change buffer size. Currently radius size is set to 1000 meters. 

.libPaths("")

#setwd("C://Users/vamos003/Desktop/Data_to_use_for_PhD/PhD_data_ALL_THE_ENV_FACTORS/buffer_calcs_from_R/Buffer_1000m/NO2_buf_1000m")


#install packages
install.packages("RSQLite")
install.packages("dplyr")
install.packages("raster")
install.packages("sf")
install.packages("rgdal")
install.packages("tidyverse")
install.packages("rgeos")
install.packages("sp")
install.packages("tmap")
install.packages("rnaturalearth")
install.packages("adehabitatMA")
install.packages("sfheaders")
install.packages("terra")
install.packages("mvmeta")
install.packages("tiff")
install.packages("stars")
install.packages("devtools")
install.packages("maptools")
install.packages("knitr")



library(mvmeta)
library(sp)
library(raster)
library(terra)
library(sf)
library(tiff)
library(stars)
library(units)
library(terra)
library(maptools)
library(devtools)
library(readr)
library(rgdal)
library(RSQLite)
library(dplyr)
library(tidyverse)
library(rgeos)
library(tmap) 
library(sfheaders)
library(knitr)



########################################################################################################################################
###################################################################################################################################
############upload all datasets


### Read the BAG file to get the coordinates for each residential address
BAGdata_2019 <- readr::read_delim()



######### Read the raster layers of exposures.

### group 1: air pollution
NO2 <-read_stars() 
NO2 <-rast(NO2)
PM25 <- read_stars()
PM25 <- rast(PM25)
PM10 <- read_stars()
PM10 <- rast(PM10)
O3 <- read_stars()
O3 <- rast(O3)
UFP <- read_stars()
UFP <- rast(UFP)
BC <- read_stars()
BC <- rast(BC) 


### group 2: urban and grey space
Imperviousness_300m_buffer <- read_stars()
Imperviousness_300m_buffer <- rast(Imperviousness_300m_buffer)
soundmapallsources <- read_stars()
soundmapallsources <- rast(soundmapallsources)
res(soundmapallsources)
trafficnoise <- read_stars()
trafficnoise <- rast(trafficnoise)
res(trafficnoise)
UHI <- read_stars()
UHI <- rast(UHI)
night_light <- read_stars()
night_light <- rast(night_light)
LAN_2020_300m <- read_stars()
LAN_2020_300m  <- rast(LAN_2020_300m)

###group 3: land use
compact_midrise <- read_stars()
compact_midrise <- rast(compact_midrise)
compact_lowrise <- read_stars()
compact_lowrise <- rast(compact_lowrise)
open_highrise <- read_stars()
open_highrise <- rast(open_highrise)
open_midrise <- read_stars()
open_midrise <- rast(open_midrise)
open_lowrise <- read_stars()
open_lowrise <- rast(open_lowrise)
large_lowrise <- read_stars()
large_lowrise <- rast(large_lowrise)
sparsely_built  <- read_stars()
sparsely_built <- rast(sparsely_built)
dense_trees <- read_stars()
dense_trees <- rast(dense_trees)
scattered_trees <- read_stars()
scattered_trees <- rast(scattered_trees)
low_plants <- read_stars()
low_plants <- rast(low_plants)
bare_soil_or_sand <- read_stars()
bare_soil_or_sand <- rast(bare_soil_or_sand)
water <- read_stars()
water <- rast(water)

### group 4: education level
education_level_low <- read_stars()
education_level_low <- rast(education_level_low)
education_level_secondary <- read_stars()
education_level_secondary <- rast(education_level_secondary)
education_level_high <- read_stars()
education_level_high <- rast(education_level_high)

### group 5: social security
SS_PersonsByTypeBenefitAO_84 <- read_stars()
SS_PersonsByTypeBenefitAO_84 <- rast(SS_PersonsByTypeBenefitAO_84)
SS_Personsbytypebenefitassistance_83 <- read_stars()
SS_Personsbytypebenefitassistance_83 <- rast(SS_Personsbytypebenefitassistance_83)
SS_PersonsByTypeBenefitWW_85 <- read_stars()
SS_PersonsByTypeBenefitWW_85 <- rast(SS_PersonsByTypeBenefitWW_85)
SS_PersonsPerTypeBenefitAOW_86 <- read_stars()
SS_PersonsPerTypeBenefitAOW_86 <- rast(SS_PersonsPerTypeBenefitAOW_86)
SS_Young_People_With_Youth_Care_In_Kind_87 <- read_stars()
SS_Young_People_With_Youth_Care_In_Kind_87 <- rast(SS_Young_People_With_Youth_Care_In_Kind_87)

### group 6: income
number_income_residents <- read_stars()
number_income_residents <- rast(number_income_residents)
Average_Income_Per_Income_Recipient <- read_stars()
Average_Income_Per_Income_Recipient <- rast(Average_Income_Per_Income_Recipient)
Average_income_per_inhabitant <- read_stars()
Average_income_per_inhabitant  <- rast(Average_income_per_inhabitant )
person_with_lowest_income_percent <- read_stars()
person_with_lowest_income_percent <- rast(person_with_lowest_income_percent)
person_with_highest_income_percent <- read_stars()
person_with_highest_income_percent <- rast(person_with_highest_income_percent)

### group 7: home energy use
heating_percentage_of_homes_with_individual_cv <- read_stars()
heating_percentage_of_homes_with_individual_cv <- rast(heating_percentage_of_homes_with_individual_cv)

### group 8: livability
livability_score <- read_stars()
livability_score <- rast(livability_score)
phy_env <- read_stars()
phy_env <- rast(phy_env)
nuisance_insecurity <- read_stars()
nuisance_insecurity <- rast(nuisance_insecurity)
social_cohesion <- read_stars()
social_cohesion <- rast(social_cohesion)
facilities <- read_stars()
facilities <- rast(facilities)
housing_stock <- read_stars()
housing_stock <- rast(housing_stock)

### group 9:roads and railroads
major_roads <- read_stars()
major_roads <-rast(major_roads)
highways <- read_stars()
highways <- rast(highways)
main_railroad <- read_stars()
main_railroad <- rast(main_railroad)
railroad_lightrail_tram<- read_stars()
railroad_lightrail_tram <- rast(railroad_lightrail_tram)

### group 10: 8 elements in air pollution RF
pm25_cu_rf <- read_stars()
pm25_cu_rf <- rast(pm25_cu_rf)
pm25_fe_rf <- read_stars()
pm25_fe_rf <- rast(pm25_fe_rf)
pm25_k_rf <- read_stars()
pm25_k_rf <- rast(pm25_k_rf)
pm25_ni_rf <- read_stars()
pm25_ni_rf <- rast(pm25_ni_rf)
pm25_s_rf <- read_stars()
pm25_s_rf <- rast(pm25_s_rf)
pm25_si_rf <- read_stars()
pm25_si_rf <- rast(pm25_si_rf)
pm25_v_rf <- read_stars()
pm25_v_rf <- rast(pm25_v_rf)
pm25_zn_rf <- read_stars()
pm25_zn_rf <- rast(pm25_zn_rf)
pmc_zn_rf <- read_stars()
pmc_zn_rf <- rast(pmc_zn_rf ) 
pmc_si_rf <- read_stars()
pmc_si_rf <- rast(pmc_si_rf )
pmc_k_rf <- read_stars()
pmc_k_rf <- rast(pmc_k_rf )
pmc_fe_rf <- read_stars()
pmc_fe_rf <- rast(pmc_fe_rf )
pmc_cu_rf <- read_stars()
pmc_cu_rf <- rast(pmc_cu_rf)
pm25_mass_rf <- read_stars()
pm25_mass_rf <- rast(pm25_mass_rf)


### group 11: 8 elements in air pollution SLR
pm25_cu_slr <- read_stars()
pm25_cu_slr <- rast(pm25_cu_slr)
pm25_fe_slr<- read_stars()
pm25_fe_slr <- rast(pm25_fe_slr)
pm25_k_slr <- read_stars()
pm25_k_slr <- rast(pm25_k_slr)
pm25_mass_slr <- read_stars()
pm25_mass_slr <- rast(pm25_mass_slr)
pm25_ni_slr <- read_stars()
pm25_ni_slr <- rast(pm25_ni_slr)
pm25_s_slr <- read_stars()
pm25_s_slr <- rast(pm25_s_slr)
pm25_si_slr <- read_stars()
pm25_si_slr <- rast(pm25_si_slr)
pm25_v_slr <- read_stars()
pm25_v_slr <- rast(pm25_v_slr)
pm25_zn_slr <- read_stars()
pm25_zn_slr <- rast(pm25_zn_slr)
pmc_cu_slr <- read_stars()
pmc_cu_slr <- rast(pmc_cu_slr)
pmc_fe_slr <- read_stars()
pmc_fe_slr <- rast(pmc_fe_slr)
pmc_k_slr <- read_stars()
pmc_k_slr <- rast(pmc_k_slr)
pmc_si_slr <- read_stars()
pmc_si_slr <- rast(pmc_si_slr)
pmc_zn_slr <- read_stars()
pmc_zn_slr <- rast(pmc_zn_slr)

####group 12: miscellanious
urbanity <- read_stars()
urbanity <- rast(urbanity)
pop_den <- read_stars()
pop_den <- rast(pop_den)

####group 13: crime
Total_Destruction_And_Violence <- read_stars() 
Total_Destruction_And_Violence <- rast(Total_Destruction_And_Violence)
Total_Property_Crimes <- read_stars() 
Total_Property_Crimes <- rast(Total_Property_Crimes )
Total_Theft <- read_stars() 
Total_Theft <- rast(Total_Theft)

####group 14: crops and more landuse
artificial_land <- read_stars()
artificial_land <- rast(artificial_land)
cereals <- read_stars()
cereals <- rast(cereals)
root_crops<- read_stars()
root_crops <- rast(root_crops)
non_permanent_industrial_crops<- read_stars()
non_permanent_industrial_crops <- rast(non_permanent_industrial_crops)
dry_pulses_vegetables_flowers<- read_stars()
dry_pulses_vegetables_flowers <- rast(dry_pulses_vegetables_flowers)
fodder<- read_stars()
fodder <- rast(fodder)
bare_arable_land<- read_stars()
bare_arable_land <- rast(bare_arable_land)
woodland_shrubland<- read_stars()
woodland_shrubland <- rast(woodland_shrubland)
grassland<- read_stars()
grassland <- rast(grassland)
bare_land_lichensmoss<- read_stars()
bare_land_lichensmoss <- rast(bare_land_lichensmoss)


####group 15: greenery
NDVI_YODA <- read_stars()
NDVI_YODA <- rast(NDVI_YODA)
corine_GS <- read_stars()
corine_GS <- rast(corine_GS)
urban_atlas_GS <- read_stars()
urban_atlas_GS <- rast(urban_atlas_GS)
MSAVI_ME300 <- read_stars()
MSAVI_ME300 <- rast(MSAVI_ME300)
MSAVI_MD300 <- read_stars()
MSAVI_MD300 <- rast(MSAVI_MD300)
MSAVI_ST300 <- read_stars()
MSAVI_ST300 <- rast(MSAVI_ST300)
NDVI_ME300 <- read_stars()
NDVI_ME300 <- rast(NDVI_ME300)
NDVI_MD300 <- read_stars()
NDVI_MD300 <- rast(NDVI_MD300)
NDVI_ST300 <- read_stars()
NDVI_ST300 <- rast(NDVI_ST300)
treemap <- read_stars()
treemap <- rast(treemap)
greenmap <- read_stars()
greenmap <- rast(greenmap)
parks <- read_stars()
parks <- rast(parks)

###group 16: crops
maize <- read_stars()
maize <- rast(maize)
grains <- read_stars()
grains <- rast(grains)
sugarbeets <- read_stars()
sugarbeets <- rast(sugarbeets)
potatoes <- read_stars()
potatoes <- rast(potatoes)
fruittrees <- read_stars()
fruittrees <- rast(fruittrees)
flowerbulbs <- read_stars()
flowerbulbs <- rast(flowerbulbs)
othercrops <- read_stars()
othercrops <- rast(othercrops)

#group 17: quarterly temperature
temp_feb_2019 <- read_stars()
temp_feb_2019 <- rast(temp_feb_2019)
temp_may_2019 <- read_stars()
temp_may_2019 <- rast(temp_may_2019)
temp_aug_2019 <- read_stars()
temp_aug_2019 <- rast(temp_aug_2019)
temp_nov_2019 <- read_stars()
temp_nov_2019 <- rast(temp_nov_2019)


#Use for setting coordinates
NDVI2010 <- read_stars()
NDVI2010 <-rast(NDVI2010)







### Split the big file BAGdata_2019 to small chunks, each chunk has 10000 address
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

nrow(BAGdata_2019)
colnames(BAGdata_2019)
head(BAGdata_2019)






#########################################################################################################################################
########################################################################################################################################
######################################################################################################################################
###compute the mean value of each Environmental factor within the buffer of defined size



##########################################################
####################GROUP 1: AIR POLLUTION

###buffer NO2

setwd("buffer_calcs_from_R/Buffer_1000m/NO2_buf_1000m")

IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010) #use the crs from the ndvi
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NO2))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =10000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = NO2,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


## buffer PM25
setwd("buffer_calcs_from_R/Buffer_1000m/PM25_buf_1000m")

IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010) #use the crs from the ndvi
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NO2))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =10000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = NO2,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


## buffer PM10
setwd("buffer_calcs_from_R/Buffer_1000m/PM10_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(PM10))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =10000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = PM10,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


##buffer O3
setwd("buffer_calcs_from_R/Buffer_1000m/O3_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(O3))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = O3,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#UFP
setwd("buffer_calcs_from_R/Buffer_1000m/UFP_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(UFP))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = UFP,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#BC
setwd("buffer_calcs_from_R/Buffer_1000m/BC_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(BC))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = BC,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



###################################################################
####################GROUP 2: urban and grey space


#Imperviousness_300m_buffer
setwd("buffer_calcs_from_R/Buffer_1000m/imp300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(Imperviousness_300m_buffer))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = Imperviousness_300m_buffer,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



##buffer soundmapallsources
setwd("buffer_calcs_from_R/Buffer_1000m/soundmapallsources_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(soundmapallsources))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = soundmapallsources,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

##buffer traffic noise
setwd("buffer_calcs_from_R/Buffer_1000m/trafficnoise_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(trafficnoise))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = trafficnoise,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

##buffer UHI
setwd("buffer_calcs_from_R/Buffer_1000m/UHI_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(UHI))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = UHI,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





#light at night
setwd("buffer_calcs_from_R/Buffer_1000m/nightlight_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(night_light))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = night_light,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


##LAN 2020 300M (light at night)
setwd("buffer_calcs_from_R/Buffer_1000m/LAN_2020_300m_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(LAN_2020_300m))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = LAN_2020_300m,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#############################################################################
################### GROUP 3: LAND USE

## buffer water
setwd("buffer_calcs_from_R/Buffer_1000m/water_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(water))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = water,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




########################################################################
#####################GROUP 4: EDUCATION LEVEL

##buffer education_level_low
setwd("buffer_calcs_from_R/Buffer_1000m/education_level_low_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(education_level_low))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = education_level_low,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

##education_level_secondary
setwd("buffer_calcs_from_R/Buffer_1000m/education_level_secondary_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(education_level_secondary))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = education_level_secondary,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

##education_level_high
setwd("buffer_calcs_from_R/Buffer_1000m/education_level_high_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(education_level_high))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = education_level_high,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



######################################################################
#######################GROUP 5: SOCIAL SECURITY

## SS_PersonsByTypeBenefitAO_84 
setwd("buffer_calcs_from_R/Buffer_1000m/SS_PersonsByTypeBenefitAO_84_buf_1000m")

nrow(BAGdata_2019)

IDS <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(SS_PersonsByTypeBenefitAO_84))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = SS_PersonsByTypeBenefitAO_84,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

## SS_Personsbytypebenefitassistance_83
setwd("buffer_calcs_from_R/Buffer_1000m/SS_Personsbytypebenefitassistance_83_buf_1000m")

IDS <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(SS_Personsbytypebenefitassistance_83))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = SS_Personsbytypebenefitassistance_83,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

## SS_PersonsByTypeBenefitWW_85
setwd("buffer_calcs_from_R/Buffer_1000m/SS_PersonsByTypeBenefitWW_85_buf_1000m")

IDS <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(SS_PersonsByTypeBenefitWW_85))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = SS_PersonsByTypeBenefitWW_85,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

## SS_PersonsPerTypeBenefitAOW_86
setwd("buffer_calcs_from_R/Buffer_1000m/SS_PersonsPerTypeBenefitAOW_86_buf_1000m")

IDS <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(SS_PersonsPerTypeBenefitAOW_86))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = SS_PersonsPerTypeBenefitAOW_86,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

## SS_Young_People_With_Youth_Care_In_Kind_87
setwd("buffer_calcs_from_R/Buffer_500m/SS_Young_People_With_Youth_Care_In_Kind_87_buf_500m")

IDS <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(SS_Young_People_With_Youth_Care_In_Kind_87))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =500)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = SS_Young_People_With_Youth_Care_In_Kind_87,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




#################################################################33
#####################GROUP 7 INCOME 



#Average_Income_Per_Income_Recipient
setwd("buffer_calcs_from_R/Buffer_1000m/Average_Income_Per_Income_Recipient_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(Average_Income_Per_Income_Recipient))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = Average_Income_Per_Income_Recipient,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#person_with_lowest_income_percent
setwd("buffer_calcs_from_R/Buffer_1000m/person_with_lowest_income_percent_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(person_with_lowest_income_percent))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = person_with_lowest_income_percent,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#person_with_highest_income_percent
setwd("buffer_calcs_from_R/Buffer_1000m/person_with_highest_income_percent_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(person_with_highest_income_percent))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = person_with_highest_income_percent,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



########################################################################
######################GROUP 9 LIVABILITY

#livability_score
setwd("buffer_calcs_from_R/Buffer_1000m/livability_score_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(livability_score))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = livability_score,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#phy_env
setwd("buffer_calcs_from_R/Buffer_1000m/phy_env_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(phy_env))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = phy_env,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#nuisance_insecurity
setwd("buffer_calcs_from_R/Buffer_1000m/nuisance_insecurity_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(nuisance_insecurity))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = nuisance_insecurity,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#social_cohesion
setwd("buffer_calcs_from_R/Buffer_1000m/social_cohesion_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(social_cohesion))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = social_cohesion,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#facilities
setwd("buffer_calcs_from_R/Buffer_1000m/facilities_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(facilities))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = facilities,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#housing_stock
setwd("buffer_calcs_from_R/Buffer_1000m/housing_stock_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(housing_stock))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = housing_stock,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




###########################################################################
###################GROUP 10  roads and railroads
#major_roads
setwd("buffer_calcs_from_R/Buffer_1000m/major_roads_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(major_roads))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = major_roads,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#highways
setwd("buffer_calcs_from_R/Buffer_1000m/highways_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(highways))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = highways,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#main_railroad
setwd("buffer_calcs_from_R/Buffer_1000m/main_railroads_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(main_railroad))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = main_railroad,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#railroad_lightrail_tram
setwd("buffer_calcs_from_R/Buffer_1000m/railroad_lightrail_tram_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(railroad_lightrail_tram))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = railroad_lightrail_tram,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





###########################################################################
###################GROUP 12 MISCELLANEOUS

#degree of urbanity

setwd("buffer_calcs_from_R/Buffer_1000m/urbanity_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(urbanity))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = urbanity,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#####population density

setwd("buffer_calcs_from_R/Buffer_1000m/pop_den_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pop_den))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pop_den,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




###########################################################################
###################group 13: crime

#Total_Destruction_And_Violence 
setwd("buffer_calcs_from_R/Buffer_1000m/T_dest_vio_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(Total_Destruction_And_Violence))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = Total_Destruction_And_Violence,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#Total_Property_Crimes  
setwd("buffer_calcs_from_R/Buffer_1000m/T_prpty_crm_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(Total_Property_Crimes))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = Total_Property_Crimes,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#Total_Theft 
setwd("buffer_calcs_from_R/Buffer_1000m/T_theft_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(Total_Theft))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = Total_Theft,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




###########################################################################
###################group 14: crops and more land use

#artificial_land
setwd("buffer_calcs_from_R/Buffer_1000m/artificial_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(artificial_land))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = artificial_land,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#cereals
setwd("buffer_calcs_from_R/Buffer_1000m/cereals_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(cereals))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = cereals,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#root_crops
setwd("buffer_calcs_from_R/Buffer_1000m/root_crops_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(root_crops))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = root_crops,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#non_permanent_industrial_crops
setwd("buffer_calcs_from_R/Buffer_1000m/np_ind_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(non_permanent_industrial_crops))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = non_permanent_industrial_crops,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#dry_pulses_vegetables_flowers
setwd("buffer_calcs_from_R/Buffer_1000m/dp_v_f_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(dry_pulses_vegetables_flowers))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = dry_pulses_vegetables_flowers,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#fodder
setwd("buffer_calcs_from_R/Buffer_1000m/fodder_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(fodder))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = fodder,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#bare_arable_land
setwd("buffer_calcs_from_R/Buffer_1000m/b_arble_Ind_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(bare_arable_land))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = bare_arable_land,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#woodland_shrubland
setwd("buffer_calcs_from_R/Buffer_1000m/woodshrub_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(woodland_shrubland))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = woodland_shrubland,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#grassland
setwd("buffer_calcs_from_R/Buffer_1000m/grassland_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(grassland))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = grassland,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#bare_land_lichensmoss
setwd("buffer_calcs_from_R/Buffer_1000m/b_ld_lcn_ms_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(bare_land_lichensmoss))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = bare_land_lichensmoss,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




################################################################################
###########GROUP 15: GREENERY

setwd("buffer_calcs_from_R/Buffer_1000m/parks_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(parks))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = parks,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


##NDVI YODA
setwd("buffer_calcs_from_R/Buffer_1000m/NDVI_YODA_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NDVI_YODA))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = NDVI_YODA,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



##buffer treemap
setwd("buffer_calcs_from_R/Buffer_1000m/treemap_buf_1000m")

IDs <- 1:11
idCALCULATION =function (id)
  for (id in IDs) {
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(treemap))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = treemap,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#corine_GS
setwd("buffer_calcs_from_R/Buffer_1000m/corine_GS_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(corine_GS))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = corine_GS,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#urban_atlas_GS
setwd("buffer_calcs_from_R/Buffer_1000m/urban_atlas_GS_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(urban_atlas_GS))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = urban_atlas_GS,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#MSAVI_ME300
setwd("buffer_calcs_from_R/Buffer_1000m/MSAVI_ME300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(MSAVI_ME300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = MSAVI_ME300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#MSAVI_MD300
setwd("buffer_calcs_from_R/Buffer_1000m/MSAVI_MD300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(MSAVI_MD300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = MSAVI_MD300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#MSAVI_ST300  
setwd("buffer_calcs_from_R/Buffer_1000m/MSAVI_ST300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(MSAVI_ST300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = MSAVI_ST300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#NDVI_ME300
setwd("buffer_calcs_from_R/Buffer_1000m/NDVI_ME300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NDVI_ME300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = NDVI_ME300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#NDVI_MD300
setwd("buffer_calcs_from_R/Buffer_1000m/NDVI_MD300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NDVI_MD300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = NDVI_MD300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#NDVI_ST300 
setwd("buffer_calcs_from_R/Buffer_1000m/NDVI_ST300_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(NDVI_ST300))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 400 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = NDVI_ST300,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



############GROUP 16: CROPS

#maize
setwd("buffer_calcs_from_R/Buffer_1000m/maize_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(maize))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = maize,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#grains
setwd("buffer_calcs_from_R/Buffer_1000m/grains_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(grains))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = grains,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#potatoes
setwd("buffer_calcs_from_R/Buffer_1000m/potatoes_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(potatoes))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = potatoes,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#sugarbeets
setwd("buffer_calcs_from_R/Buffer_1000m/sugarbeets_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(sugarbeets))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = sugarbeets,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#fruit trees
setwd("buffer_calcs_from_R/Buffer_1000m/fruittrees_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(fruittrees))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = fruittrees,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#flowerbulbs
setwd("buffer_calcs_from_R/Buffer_1000m/flowerbulbs_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(flowerbulbs))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = flowerbulbs,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#othercrops
setwd("buffer_calcs_from_R/Buffer_1000m/othercrops_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(othercrops))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = othercrops,y = v, fun = sum,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




#####################################
############group 17: Quarterly temperature

#temp_feb_2019
setwd("buffer_calcs_from_R/Buffer_1000m/temp_feb_2019_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(temp_feb_2019))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = temp_feb_2019,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#temp_may_2019
setwd("buffer_calcs_from_R/Buffer_1000m/temp_may_2019_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(temp_may_2019))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = temp_may_2019,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#temp_aug_2019
setwd("buffer_calcs_from_R/Buffer_1000m/temp_aug_2019_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(temp_aug_2019))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = temp_aug_2019,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#temp_nov_2019
setwd("buffer_calcs_from_R/Buffer_1000m/temp_nov_2019_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(temp_nov_2019))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = temp_nov_2019,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




################################################################33
#########################GROUP 8 HOME ENERGY USE

#average_electricity_consumption
setwd("buffer_calcs_from_R/Buffer_1000m/average_electricity_consumption_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(average_electricity_consumption))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = average_electricity_consumption,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




#average_natural_gas_consumption
setwd("buffer_calcs_from_R/Buffer_1000m/average_natural_gas_consumption_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(average_natural_gas_consumption))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = average_natural_gas_consumption,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#heating_percentage_of_homes_with_individual_cv
setwd("buffer_calcs_from_R/Buffer_1000m/heating_percent_of_homes_with_ind_cv_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(heating_percentage_of_homes_with_individual_cv))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    mean_buffer<- terra::extract(x = heating_percentage_of_homes_with_individual_cv,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#########################



############################################################################
########################GROUP 11: 8 elements in air pollution RF

#pm25_ni_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_ni_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_ni_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_ni_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_cu_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_cu_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_cu_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_cu_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_fe_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_fe_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_cu_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_cu_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_k_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_k_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_k_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_k_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_s_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_s_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_s_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_s_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_si_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_si_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_si_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_si_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_v_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_v_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_v_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_v_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_zn_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_zn_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_v_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_v_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pmc_zn_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_zn_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_zn_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_zn_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_si_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_si_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_si_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_si_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_k_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_k_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_k_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_k_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_fe_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_fe_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_fe_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_fe_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_cu_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_cu_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_cu_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_cu_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pm25_mass_rf
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_mass_rf_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_mass_rf))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 100 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_mass_rf,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




############################################################################
########################GROUP 12: 8 elements in air pollution SLR


#pm25_ni_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_ni_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_ni_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_ni_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_cu_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_cu_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_cu_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_cu_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_fe_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_fe_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_cu_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_cu_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_k_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_k_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_k_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_k_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_s_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_s_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_s_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_s_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_si_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_si_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_si_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_si_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_v_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_v_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_v_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_v_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pm25_zn_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_zn_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_v_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_v_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


#pmc_zn_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_zn_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_zn_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_zn_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_si_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_si_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_si_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_si_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_k_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_k_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_k_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_k_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_fe_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_fe_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_fe_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_fe_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pmc_cu_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pmc_cu_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pmc_cu_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pmc_cu_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

#pm25_mass_slr
setwd("buffer_calcs_from_R/Buffer_1000m/pm25_mass_slr_buf_1000m")

IDs <- 1:11
#IDs <- 1:927 ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    BAGdata_2019 <-data.frame(d[id])## select the chuck 
    sf_BAGdata_2019 <-st_as_sf(BAGdata_2019,coords=c(17,18))##, 16,17 is the xcoordinate and ycoordinate
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(pm25_mass_slr))##the crs should be same between the coordinates and raster
    v <- st_buffer(sf_BAGdata_2019,dist =1000)## create the buffer with distance 500 meter.
    v <- st_as_sf(v)## ensure it is a sf object
    sum_buffer<- terra::extract(x = pm25_mass_slr,y = v, fun = mean,df=TRUE,na.rm=TRUE)## calculate the mean value with each buffer.
    write.csv(sum_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



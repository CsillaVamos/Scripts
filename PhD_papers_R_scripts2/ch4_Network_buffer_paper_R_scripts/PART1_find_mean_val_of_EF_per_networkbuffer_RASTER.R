#####################################################################################33
#############NETWORK BUFFER MODEL 


.libPaths()

library(raster)
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




## Read buffers
#buffers <- st_read("NB_polygons_500m 1.shp")

nb_500m <- st_read("network_buffer_polygons/NB_polygons_500m.shp")


###Use for setting coordinates
NDVI2010 <- read_stars("buffer_calcs_from_R/NDVI2010.tif")
NDVI2010 <-rast(NDVI2010)


## Read the raster layers of exposures.
#NDVI2010 <- read_stars("NDVI2010.tif")
#NDVI2010[NDVI2010<0] <- 0
#NDVI2010 <-rast(NDVI2010)


### group 1: air pollution
NO2 <-read_stars("Physicochem_env/Air_pollution/NO2_Ex_NL_yoda/NO2_AAV_XX_XX_19_v2.tif") 
NO2 <-rast(NO2)
PM25 <- read_stars("Physicochem_env/Air_pollution/PM25_Ex_NL_yoda/P25_AAV_XX_XX_19_v2.tif")
PM25 <- rast(PM25)
PM10 <- read_stars("Physicochem_env/Air_pollution/PM10_Ex_NL_yoda/P10_AAV_XX_XX_19_v2.tif")
PM10 <- rast(PM10)
O3 <- read_stars("Physicochem_env/Air_pollution/O3_Ex_NL_yoda/OZO_AAV_XX_XX_19_v2.tif")
O3 <- rast(O3)
UFP <- read_stars("Physicochem_env/Air_pollution/UFP/RUN,national model/NL-UFP_Grid_1km2/UFP_RUN_1km2_Raster.tif")
UFP <- rast(UFP)
BC <- read_stars("Physicochem_env/Air_pollution/bc_from_ELAPSE/bc2010.tif")
BC <- rast(BC) 


### group 2: urban and grey space
Imperviousness_300m_buffer <- read_stars("Built_env/Imp_surface_expanse_archives/IMP_B03_XX_XX_18_v2.tif")
Imperviousness_300m_buffer <- rast(Imperviousness_300m_buffer)
soundmapallsources <- read_stars("Physicochem_env/Noise/rivm_20210201_soundmapallsources/rivm_20210201_g_geluidkaart_lden_alle_bronnen_v3.tif")
soundmapallsources <- rast(soundmapallsources)
res(soundmapallsources)
trafficnoise <- read_stars("Physicochem_env/Noise/Traffic_Noise/Wegverkeer_2017_Lden_Ex_NL_yoda.tif")
trafficnoise <- rast(trafficnoise)
res(trafficnoise)
UHI <- read_stars("Physicochem_env/RIVM_R88_20170621_gm_actueelUHI/RIVM_R88_20170621_gm_actueelUHI.tif")
UHI <- rast(UHI)
night_light <- read_stars("Physicochem_env/Light_intensity_at_night/RIVM/rivm_20220101_gm_light_emission_2020/rivm_20220101_gm_lichtemissie2020.tif")
night_light <- rast(night_light)
LAN_2020_300m <- read_stars("Physicochem_env/Light_intensity_at_night/EXPANSE/LAN_B03_XX_XX_20_v2.tif")
LAN_2020_300m  <- rast(LAN_2020_300m)

###group 3: land use
water <- read_stars("Physicochem_env/local_climate_zone_land_use/rasters/raster_final/water_17_r.tif")
water <- rast(water)


### group 4: education level
education_level_low <- read_stars("Social_env/Income_and_edu_attainment/final_raster_data/edu_level_low_wijk.tif")
education_level_low <- rast(education_level_low)
education_level_secondary <- read_stars("Social_env/Income_and_edu_attainment/final_raster_data/edu_level_secondary_wijk.tif")
education_level_secondary <- rast(education_level_secondary)
education_level_high <- read_stars("Social_env/Income_and_edu_attainment/final_raster_data/edu_level_high_wijk.tif")
education_level_high <- rast(education_level_high)


### group 5: social security
SS_PersonsByTypeBenefitAO_84 <- read_stars("Social_env/Social_security_and_concerns/final_rasters/PersonsByTypeBenefitAO_84_wijk.tif")
SS_PersonsByTypeBenefitAO_84 <- rast(SS_PersonsByTypeBenefitAO_84)
SS_Personsbytypebenefitassistance_83 <- read_stars("Social_env/Social_security_and_concerns/final_rasters/Personsbytypebenefitassistance_83_wijk.tif")
SS_Personsbytypebenefitassistance_83 <- rast(SS_Personsbytypebenefitassistance_83)
SS_PersonsByTypeBenefitWW_85 <- read_stars("Social_env/Social_security_and_concerns/final_rasters/PersonsByTypeBenefitWW_85_wijk.tif")
SS_PersonsByTypeBenefitWW_85 <- rast(SS_PersonsByTypeBenefitWW_85)
SS_PersonsPerTypeBenefitAOW_86 <- read_stars("Social_env/Social_security_and_concerns/final_rasters/PersonsPerTypeBenefitAOW_86_wijk2.tif")
SS_PersonsPerTypeBenefitAOW_86 <- rast(SS_PersonsPerTypeBenefitAOW_86)


### group 7: income
Average_Income_Per_Income_Recipient <- read_stars("Social_env/Income_and_edu_attainment/income/income_raster/average_income_per_income_recipient_wijken.tif")
Average_Income_Per_Income_Recipient <- rast(Average_Income_Per_Income_Recipient)
person_with_lowest_income_percent <- read_stars("Social_env/Income_and_edu_attainment/income/income_raster/person_with_lowest_income_percent_wijken.tif")
person_with_lowest_income_percent <- rast(person_with_lowest_income_percent)
person_with_highest_income_percent <- read_stars("Social_env/Income_and_edu_attainment/income/income_raster/person_with_highest_income_percent_wijken2.tif")
person_with_highest_income_percent <- rast(person_with_highest_income_percent)


### group 9: livability
livability_score <- read_stars("Social_env/mental_health/liveability_rasters/liveability_score_wijk.tif")
livability_score <- rast(livability_score)
phy_env <- read_stars("Social_env/mental_health/liveability_rasters/phy_env_wijk.tif")
phy_env <- rast(phy_env)
nuisance_insecurity <- read_stars("Social_env/mental_health/liveability_rasters/nuisance_insecurity_wijk.tif")
nuisance_insecurity <- rast(nuisance_insecurity)
social_cohesion <- read_stars("Social_env/mental_health/liveability_rasters/social_cohesion_wijk.tif")
social_cohesion <- rast(social_cohesion)
facilities <- read_stars("Social_env/mental_health/liveability_rasters/facilities_wijk.tif")
facilities <- rast(facilities)


### group 10:roads and railroads
major_roads <- read_stars("Built_env/railways/from_o_drive/raster_tifs_roads_railways/FINALS/mjr_rds3/mjr_rds3.tif")
major_roads <-rast(major_roads)
highways <- read_stars("Built_env/railways/from_o_drive/raster_tifs_roads_railways/FINALS/hghwys3/hghwys3.tif")
highways <- rast(highways)
main_railroad <- read_stars("Built_env/railways/from_o_drive/raster_tifs_roads_railways/FINALS/mainrlwys2/mainrlwys2.tif")
main_railroad <- rast(main_railroad)
railroad_lightrail_tram<- read_stars("Built_env/railways/from_o_drive/raster_tifs_roads_railways/rlwys_trms5/rlwys_trms5.tif")
railroad_lightrail_tram <- rast(railroad_lightrail_tram)



### group 11: 8 elements in air pollution
pm25_cu_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_cu_slr.tif")
pm25_cu_slr <- rast(pm25_cu_slr)
pm25_fe_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_fe_slr.tif")
pm25_fe_slr <- rast(pm25_fe_slr)
pm25_k_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_k_slr.tif")
pm25_k_slr <- rast(pm25_k_slr)
pm25_ni_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_ni_slr.tif")
pm25_ni_slr <- rast(pm25_ni_slr)
pm25_s_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_s_slr.tif")
pm25_s_slr <- rast(pm25_s_slr)
pm25_si_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_si_slr.tif")
pm25_si_slr <- rast(pm25_si_slr)
pm25_v_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_v_slr.tif")
pm25_v_slr <- rast(pm25_v_slr)
pm25_zn_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_zn_slr.tif")
pm25_zn_slr <- rast(pm25_zn_slr)
pmc_zn_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pmc_zn_slr.tif")
pmc_zn_slr <- rast(pmc_zn_slr ) 
pmc_si_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pmc_si_slr.tif")
pmc_si_slr <- rast(pmc_si_slr )
pmc_k_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pmc_k_slr.tif")
pmc_k_slr <- rast(pmc_k_slr )
pmc_fe_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pmc_fe_slr.tif")
pmc_fe_slr <- rast(pmc_fe_slr )
pmc_cu_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pmc_cu_slr.tif")
pmc_cu_slr <- rast(pmc_cu_slr)
pm25_mass_slr <- read_stars("Physicochem_env/Air_pollution/long_term_exposure_to_eight_elements/rasters/rasters_slr/pm25_mass_slr.tif")
pm25_mass_slr <- rast(pm25_mass_slr)


####group 12: miscellanious
urbanity <- read_stars("Built_env/urbanity_CBS/degree_of_urbanity_raster.tif")
urbanity <- rast(urbanity)
pop_den <- read_stars("Built_env/urbanity_CBS/population_density_raster.tif")
pop_den <- rast(pop_den)



####group 13: crime
Total_Destruction_And_Violence <- read_stars("Social_env/crime/rasters_2018/TotalDestructionAndViolence.tif") 
Total_Destruction_And_Violence <- rast(Total_Destruction_And_Violence)
Total_Property_Crimes <- read_stars("Social_env/crime/rasters_2018/TotalPropertyCrimes.tif") 
Total_Property_Crimes <- rast(Total_Property_Crimes )
Total_Theft <- read_stars("Social_env/crime/rasters_2018/TotalTheft.tif") 
Total_Theft <- rast(Total_Theft)



####group 14: crops and more landuse
artificial_land <- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/artificial.tif")
artificial_land <- rast(artificial_land)
cereals <- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/cereals.tif")
cereals <- rast(cereals)
root_crops<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/root_crops.tif")
root_crops <- rast(root_crops)
non_permanent_industrial_crops<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/n_pt_ind.tif")
non_permanent_industrial_crops <- rast(non_permanent_industrial_crops)
dry_pulses_vegetables_flowers<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/dp_v_f.tif")
dry_pulses_vegetables_flowers <- rast(dry_pulses_vegetables_flowers)
fodder<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/fodder.tif")
fodder <- rast(fodder)
bare_arable_land<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/b_arbl_ld.tif")
bare_arable_land <- rast(bare_arable_land)
woodland_shrubland<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/wood_shrub.tif")
woodland_shrubland <- rast(woodland_shrubland)
grassland<- read_stars("Physicochem_env/Pesticides_crop_maps/rasters/grassland.tif")
grassland <- rast(grassland)


####GROUP 15 GREENERY
#NDVI_YODA <- read_stars("Built_env/Natural_env/NDVI_Expanse_archives/ndvi_2019.tif")
#NDVI_YODA <- rast(NDVI_YODA)
MSAVI_ME300 <- read_stars("Built_env/green_space_EXPANSE/MSAVI/mean_MSAVI/300m/MVI_ME3_XX_XX_20_v2.tif")
MSAVI_ME300 <- rast(MSAVI_ME300)
NDVI_ME300 <- read_stars("Built_env/green_space_EXPANSE/NDVI/mean_NDVI/300m/NDV_ME3_XX_XX_20_v2.tif")
NDVI_ME300 <- rast(NDVI_ME300)
treemap <- read_stars("Built_env/Natural_env/Tree_height/treeheight/treeheight.tif")
treemap <- rast(treemap)
greenmap <- read_stars("Built_env/rivm_20170415_g_greenmap_10m/rivm_20170415_g_groenkaart_10m.tif")
greenmap <- rast(greenmap)
parks <- read_stars("Built_env/parks/nl_parks_raster2.tif")
parks <- rast(parks)


###GROUP 16: CROPS
maize <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/maize/maize.tif")
maize <- rast(maize)
grains <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/grains/grains.tif")
grains <- rast(grains)
sugarbeets <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/sugarbeets/sugarbeets.tif")
sugarbeets <- rast(sugarbeets)
potatoes <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/potatoes/potatoes.tif")
potatoes <- rast(potatoes)
fruittrees <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/fruittrees/fruittrees.tif")
fruittrees <- rast(fruittrees)
flowerbulbs <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/flowerbulbs/flowerbulbs.tif")
flowerbulbs <- rast(flowerbulbs)
othercrops <- read_stars("Physicochem_env/Pesticides_crop_maps/CROPS/raster_final/FINALS/othercrops/othercrops.tif")
othercrops <- rast(othercrops)

#group 17: quarterly temperature
temp_feb_2019 <- read_stars("Physicochem_env/temperature/Average_monthly_temp_rasters/Avg_temp_Feb_2019.tif")
temp_feb_2019 <- rast(temp_feb_2019)
temp_may_2019 <- read_stars("Physicochem_env/temperature/Average_monthly_temp_rasters/Avg_temp_May_2019.tif")
temp_may_2019 <- rast(temp_may_2019)
temp_aug_2019 <- read_stars("Physicochem_env/temperature/Average_monthly_temp_rasters/Avg_temp_Aug_2019.tif")
temp_aug_2019 <- rast(temp_aug_2019)
temp_nov_2019 <- read_stars("Physicochem_env/temperature/Average_monthly_temp_rasters/Avg_temp_Nov_2019.tif")
temp_nov_2019 <- rast(temp_nov_2019)


nb_500m <- nb_500m

## Split buffers, each chunck has 10000 buffers
chunk <- 10000
n <- nrow(nb_500m)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(nb_500m,r)


## Write a loop for compute the mean value within the buffer of defined size

############GROUP 1: AIR POLLUTION

###NO2
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/NO2_buf_500m_2")
##it would be better you firstly to create a folder in
##your laptop to sava the results. For example, if you want to run buffer of 100 meters. You can create it a folder named
## bufnivi100

IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(NO2))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = NO2,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###PM2.5
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/PM25_buf_500m_2")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(PM25))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = PM25,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###PM10
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/PM10_buf_500m_2")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(PM10))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = PM10,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###O3
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/O3_buf_500m_2")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(O3))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = O3,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###UFP
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/UFP_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(UFP))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = UFP,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###BC
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/BC_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(BC))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = BC,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



##########GROUP2: URBAN AND GREY SPACE


###Imperviousness_300m_buffer
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/imp300_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(Imperviousness_300m_buffer))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = Imperviousness_300m_buffer,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###soundmapallsources
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/soundmapallsources_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(soundmapallsources))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = soundmapallsources,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###trafficnoise
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/trafficnoise_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(trafficnoise))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = trafficnoise,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###UHI
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/UHI_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(UHI))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = UHI,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###night_light
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/nightlight_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(night_light))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = night_light,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###LAN_2020_300m
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/LAN_2020_300m_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(LAN_2020_300m))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = LAN_2020_300m,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




########################GROUP3: Landuse

###water
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/water_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(water))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = water,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




#########################GROUP 4: education level

###education_level_low
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/education_level_low_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(education_level_low))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = education_level_low,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###education_level_secondary
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/education_level_secondary_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(education_level_secondary))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = education_level_secondary,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###education_level_high
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/education_level_high_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(education_level_high))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = education_level_high,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



##################GROUP5: social security

###SS_PersonsByTypeBenefitAO_84 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/SS_PersonsByTypeBenefitAO_84_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(SS_PersonsByTypeBenefitAO_84))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = SS_PersonsByTypeBenefitAO_84,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###SS_Personsbytypebenefitassistance_83 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/SS_Personsbytypebenefitassistance_83_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(SS_Personsbytypebenefitassistance_83))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = SS_Personsbytypebenefitassistance_83,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###SS_PersonsByTypeBenefitWW_85
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/SS_PersonsByTypeBenefitWW_85_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(SS_PersonsByTypeBenefitWW_85))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = SS_PersonsByTypeBenefitWW_85,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###SS_PersonsPerTypeBenefitAOW_86
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/SS_PersonsPerTypeBenefitAOW_86_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(SS_PersonsPerTypeBenefitAOW_86))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = SS_PersonsPerTypeBenefitAOW_86,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




#######################3GROUP7: income

###Average_Income_Per_Income_Recipient
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/Average_Income_Per_Income_Recipient_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(Average_Income_Per_Income_Recipient))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = Average_Income_Per_Income_Recipient,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



###person_with_lowest_income_percent
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/person_with_lowest_income_percent_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(person_with_lowest_income_percent))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = person_with_lowest_income_percent,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###person_with_highest_income_percent
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/person_with_highest_income_percent_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(person_with_highest_income_percent))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = person_with_highest_income_percent,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





######################GROUP 9:livability
###livability_score 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/livability_score_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(livability_score))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = livability_score,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###phy_env 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/phy_env_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(phy_env))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = phy_env,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###nuisance_insecurity 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/nuisance_insecurity_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(nuisance_insecurity))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = nuisance_insecurity,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###social_cohesion
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/social_cohesion_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(social_cohesion))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = social_cohesion,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###facilities 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/facilities_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(facilities))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = facilities,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




###########################GROUP 10: roads and railroads

###major_roads 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/major_roads_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(major_roads))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = major_roads,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



###highways
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/highways_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(highways))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = highways,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###main_railroad 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/main_railroads_buf_500m") 

IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(main_railroad))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = main_railroad,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###railroad_lightrail_tram
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/railroad_lightrail_tram_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(railroad_lightrail_tram))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = railroad_lightrail_tram,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




###########################GROUP11: 8 elements in air pollution

###pm25_cu_slr 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_cu_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_cu_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_cu_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_fe_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_fe_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_fe_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_fe_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_k_slr 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_k_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_k_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_k_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_ni_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_ni_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_ni_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_ni_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_s_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_s_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_s_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_s_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_si_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_si_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_si_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_si_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_v_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_v_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_v_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_v_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_zn_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_zn_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_zn_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_zn_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pmc_zn_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pmc_zn_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pmc_zn_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pmc_zn_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pmc_si_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pmc_si_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pmc_si_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pmc_si_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pmc_k_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pmc_k_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pmc_k_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pmc_k_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pmc_fe_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pmc_fe_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pmc_fe_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pmc_fe_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pmc_cu_slr
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pmc_cu_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pmc_cu_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pmc_cu_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pm25_mass_slr 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pm25_mass_slr_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pm25_mass_slr))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pm25_mass_slr,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




############################group 12: miscellanious

###urbanity
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/urbanity_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(urbanity))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = urbanity,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###pop_den 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/pop_den_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(pop_den))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = pop_den,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




########################################group 13: crime

###Total_Destruction_And_Violence
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/T_dest_vio_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(Total_Destruction_And_Violence))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = Total_Destruction_And_Violence,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###Total_Property_Crimes
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/T_prpty_crm_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(Total_Property_Crimes))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = Total_Property_Crimes,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###Total_Theft
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/T_theft_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(Total_Theft))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = Total_Theft,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



############################################group 14: crops and more landuse

###artificial_land
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/artificial_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(artificial_land))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = artificial_land,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###cereals
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/cereals_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(cereals))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = cereals,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###root_crops
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/root_crops_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(root_crops))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = root_crops,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###non_permanent_industrial_crops
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/np_ind_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(non_permanent_industrial_crops))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = non_permanent_industrial_crops,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###dry_pulses_vegetables_flowers
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/dp_v_f_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(dry_pulses_vegetables_flowers))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = dry_pulses_vegetables_flowers,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###fodder
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/fodder_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(fodder))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = fodder,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###bare_arable_land
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/b_arble_Ind_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(bare_arable_land))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = bare_arable_land,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###grassland
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/grassland_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(grassland))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = grassland,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



###########################################GROUP 15 GREENERY

###MSAVI_ME300 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/MSAVI_ME300_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(MSAVI_ME300))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = MSAVI_ME300,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###NDVI_ME300 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/NDVI_ME300_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(NDVI_ME300))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = NDVI_ME300,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###treemap 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/treemap_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(treemap))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = treemap,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###greenmap 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/greenmap_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(greenmap))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = greenmap,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###parks 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/parks_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(parks))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = parks,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



#######################################GROUP 16: CROPS

###maize 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/maize_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(maize))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = maize,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###grains
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/grains_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(grains))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = grains,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

###sugarbeets
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/sugarbeets_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(sugarbeets))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = sugarbeets,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###potatoes 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/potatoes_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(potatoes))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = potatoes,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###fruittrees
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/fruittrees_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(fruittrees))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = fruittrees,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###flowerbulbs
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/flowerbulbs_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(flowerbulbs))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = flowerbulbs,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


##othercrops
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/othercrops_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(othercrops))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = othercrops,y = nb_500m, fun = sum)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




##################################group 17: quarterly temperature

###temp_feb_2019
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/temp_feb_2019_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(temp_feb_2019))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = temp_feb_2019,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###temp_may_2019 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/temp_may_2019_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(temp_may_2019))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = temp_may_2019,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###temp_aug_2019 
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/temp_aug_2019_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(temp_aug_2019))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = temp_aug_2019,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###temp_nov_2019
setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/temp_nov_2019_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(temp_nov_2019))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = temp_nov_2019,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


###HERE AND CHECK RAILROAD DATA

library(stars)
library(sp)
library(rgdal)
library(sf)
library(terra)



## Split buffers, each chunck has 5000 buffers
chunk <- 5000
n <- nrow(nb_500m)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(nb_500m,r)




##################33POINT DATA

setwd("Social_env/schools/alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
primary_schools <- readOGR(".","alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
primary_schools <- primary_schools[,c("Postal","X","Y")]

setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/primaryschools_buf_500m/")

IDs <- 1:length(d)
idCALCULATION =function (id)
for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    nb_500m <- d[[id]]
    #colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    #sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    #st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    nb_500m <-st_transform(nb_500m, st_crs(primary_schools))
    #v <- st_buffer(sf_BAGdata_2019,dist =500)
    ## create the buffer with distance 100 meter.
    #v <- st_as_sf(v)
    points_terra <- st_as_sf(primary_schools)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(nb_500m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






setwd("buffer_calcs_from_R/Network_buffers/Buffer_500m/INSERT_buf_500m")
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    nb_500m <- d[[id]]# select the chuck 
    nb_500m <-st_transform(nb_500m,st_crs(INSERT))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = INSERT,y = nb_500m, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


######################TEMPLATE




#####ORIGIONAL
## Split buffers, each chunck has 5000 buffers
chunk <- 5000
n <- nrow(buffers)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(buffers,r)
## Write a loop for compute the mean value within the buffer of defined size
setwd("~/Desktop/DATA_PAPER1/nl_airpollution_2010/GIS/bufndvi100")##it would be better you firstly to create a folder in
##your laptop to sava the results. For example, if you want to run buffer of 100 meters. You can create it a folder named
## bufnivi100
IDs <- 1:length(d) ##if you can 9270000 addresses in total, then you would have 927 chuncks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    netbuffers <- d[[id]]# select the chuck 
    netbuffers <-st_transform(netbuffers,st_crs(NDVI2010))##the crs should be same between the coordinates and raster
    mean_buffer<- terra::extract(x = NDVI2010,y = netbuffers, fun = mean)## calculate the mean value with each buffer.
    write.csv(mean_buffer,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }

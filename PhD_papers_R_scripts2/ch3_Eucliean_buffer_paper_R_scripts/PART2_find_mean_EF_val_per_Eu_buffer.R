#########################################################################################################
###Script for creating buffers, adapated from Tian's script############################################


#####################PART 2###########################################

###NOTE: make sure you are using hte right buffer size


##########1000m buffer######################################
 
###Combine the results
###Read the buffers
library(data.table)

.libPaths()


BAGdata_2019 <- readr::read_delim()
BAGdata_2019_EnvFactors <- BAGdata_2019




##################################################################
##################################################################
##################################################################
#PHYSICO-CHEMICAL ENVIRONMENT

#change IDs number if needed
IDs <- 1:11

##################################################################
###########GROUP 1: AIR POLLUTION

##NO2
setwd("NO2_buf_1000m")
tablelisNO2_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisNO2_1000m <-lapply(tablelisNO2_1000m,fread) ## lapply all of then
finaltablelisNO2_1000m <- rbindlist(tablelisNO2_1000m)##rbind all the segments
colnames(finaltablelisNO2_1000m)[3] ="NO2"
buf_NO2_1000m <- finaltablelisNO2_1000m[,c("NO2")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_NO2_1000m)##cbind with your original file.

##PM25
setwd("PM25_buf_1000m")
tablelisPM25_1000m = paste(IDs,".csv",sep="")
tablelisPM25_1000m <-lapply(tablelisPM25_1000m,fread)
finaltablelisPM25_1000m <- rbindlist(tablelisPM25_1000m)
colnames(finaltablelisPM25_1000m)[3] ="PM2.5"
buf_PM25_1000m <- finaltablelisPM25_1000m[,c("PM2.5")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_PM25_1000m)

##PM10
setwd("PM10_buf_1000m")
tablelisPM10_1000m = paste(IDs,".csv",sep="")
tablelisPM10_1000m <-lapply(tablelisPM10_1000m,fread)
finaltablelisPM10_1000m <- rbindlist(tablelisPM10_1000m)
colnames(finaltablelisPM10_1000m)[3] ="PM10"
buf_PM10_1000m <- finaltablelisPM10_1000m[,c("PM10")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_PM10_1000m)

##O3
setwd("O3_buf_1000m")
tablelisO3_1000m = paste(IDs,".csv",sep="")
tablelisO3_1000m <-lapply(tablelisO3_1000m,fread)
finaltablelisO3_1000m <- rbindlist(tablelisO3_1000m)
colnames(finaltablelisO3_1000m)[3] ="Ozone"
buf_O3_1000m <- finaltablelisO3_1000m[,c("Ozone")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_O3_1000m)

#UFP
setwd("UFP_buf_1000m")
tablelisUFP_1000m = paste(IDs,".csv",sep="")
tablelisUFP_1000m <-lapply(tablelisUFP_1000m,fread)
finaltablelisUFP_1000m <- rbindlist(tablelisUFP_1000m)
colnames(finaltablelisUFP_1000m)[3] ="UFP"
buf_UFP_1000m <- finaltablelisUFP_1000m[,c("UFP")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_UFP_1000m)

#BC
setwd("BC_buf_1000m")
tablelisBC_1000m = paste(IDs,".csv",sep="")
tablelisBC_1000m <-lapply(tablelisBC_1000m,fread)
finaltablelisBC_1000m <- rbindlist(tablelisBC_1000m)
colnames(finaltablelisBC_1000m)[3] ="BC"
buf_BC_1000m <- finaltablelisBC_1000m[,c("BC")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_BC_1000m)



#pm25_ni_slr
setwd("pm25_ni_slr_buf_1000m")
tablelispm25_ni_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_ni_slr_1000m <-lapply(tablelispm25_ni_slr_1000m,fread) ## lapply all of then
finaltablelispm25_ni_slr_1000m <- rbindlist(tablelispm25_ni_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_ni_slr_1000m)[3] = "pm25_ni_slr"
buf_pm25_ni_slr_1000m <- finaltablelispm25_ni_slr_1000m[,c("pm25_ni_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_ni_slr_1000m)##cbind with your original file.

#pm25_cu_slr
setwd("pm25_cu_slr_buf_1000m")
tablelispm25_cu_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_cu_slr_1000m <-lapply(tablelispm25_cu_slr_1000m,fread) ## lapply all of then
finaltablelispm25_cu_slr_1000m <- rbindlist(tablelispm25_cu_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_cu_slr_1000m)[3] = "pm25_cu_slr"
buf_pm25_cu_slr_1000m <- finaltablelispm25_cu_slr_1000m[,c("pm25_cu_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_cu_slr_1000m)##cbind with your original file.

#pm25_fe_slr
setwd("pm25_fe_slr_buf_1000m")
tablelispm25_fe_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_fe_slr_1000m <-lapply(tablelispm25_fe_slr_1000m,fread) ## lapply all of then
finaltablelispm25_fe_slr_1000m <- rbindlist(tablelispm25_fe_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_fe_slr_1000m)[3] = "pm25_fe_slr"
buf_pm25_fe_slr_1000m <- finaltablelispm25_fe_slr_1000m[,c("pm25_fe_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_fe_slr_1000m)##cbind with your original file.

#pm25_k_slr
setwd("pm25_k_slr_buf_1000m")
tablelispm25_k_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_k_slr_1000m <-lapply(tablelispm25_k_slr_1000m,fread) ## lapply all of then
finaltablelispm25_k_slr_1000m <- rbindlist(tablelispm25_k_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_k_slr_1000m)[3] = "pm25_k_slr"
buf_pm25_k_slr_1000m <- finaltablelispm25_k_slr_1000m[,c("pm25_k_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_k_slr_1000m)##cbind with your original file.

#pm25_s_slr
setwd("pm25_s_slr_buf_1000m")
tablelispm25_s_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_s_slr_1000m <-lapply(tablelispm25_s_slr_1000m,fread) ## lapply all of then
finaltablelispm25_s_slr_1000m <- rbindlist(tablelispm25_s_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_s_slr_1000m)[3] = "pm25_s_slr"
buf_pm25_s_slr_1000m <- finaltablelispm25_s_slr_1000m[,c("pm25_s_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_s_slr_1000m)##cbind with your original file.

#pm25_si_slr
setwd("pm25_si_slr_buf_1000m")
tablelispm25_si_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_si_slr_1000m <-lapply(tablelispm25_si_slr_1000m,fread) ## lapply all of then
finaltablelispm25_si_slr_1000m <- rbindlist(tablelispm25_si_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_si_slr_1000m)[3] = "pm25_si_slr"
buf_pm25_si_slr_1000m <- finaltablelispm25_si_slr_1000m[,c("pm25_si_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_si_slr_1000m)##cbind with your original file.

#pm25_v_slr
setwd("pm25_v_slr_buf_1000m")
tablelispm25_v_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_v_slr_1000m <-lapply(tablelispm25_v_slr_1000m,fread) ## lapply all of then
finaltablelispm25_v_slr_1000m <- rbindlist(tablelispm25_v_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_v_slr_1000m)[3] = "pm25_v_slr"
buf_pm25_v_slr_1000m <- finaltablelispm25_v_slr_1000m[,c("pm25_v_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_v_slr_1000m)##cbind with your original file.

#pm25_zn_slr
setwd("pm25_zn_slr_buf_1000m")
tablelispm25_zn_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_zn_slr_1000m <-lapply(tablelispm25_zn_slr_1000m,fread) ## lapply all of then
finaltablelispm25_zn_slr_1000m <- rbindlist(tablelispm25_zn_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_zn_slr_1000m)[3] = "pm25_zn_slr"
buf_pm25_zn_slr_1000m <- finaltablelispm25_zn_slr_1000m[,c("pm25_zn_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_zn_slr_1000m)##cbind with your original file.


#pmc_zn_slr
setwd("pmc_zn_slr_buf_1000m")
tablelispmc_zn_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispmc_zn_slr_1000m <-lapply(tablelispmc_zn_slr_1000m,fread) ## lapply all of then
finaltablelispmc_zn_slr_1000m <- rbindlist(tablelispmc_zn_slr_1000m)##rbind all the segments
colnames(finaltablelispmc_zn_slr_1000m)[3] = "pmc_zn_slr"
buf_pmc_zn_slr_1000m <- finaltablelispmc_zn_slr_1000m[,c("pmc_zn_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pmc_zn_slr_1000m)##cbind with your original file.

#pmc_si_slr
setwd("pmc_si_slr_buf_1000m")
tablelispmc_si_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispmc_si_slr_1000m <-lapply(tablelispmc_si_slr_1000m,fread) ## lapply all of then
finaltablelispmc_si_slr_1000m <- rbindlist(tablelispmc_si_slr_1000m)##rbind all the segments
colnames(finaltablelispmc_si_slr_1000m)[3] = "pmc_si_slr"
buf_pmc_si_slr_1000m <- finaltablelispmc_si_slr_1000m[,c("pmc_si_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pmc_si_slr_1000m)##cbind with your original file.

#pmc_k_slr
setwd("pmc_k_slr_buf_1000m")
tablelispmc_k_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispmc_k_slr_1000m <-lapply(tablelispmc_k_slr_1000m,fread) ## lapply all of then
finaltablelispmc_k_slr_1000m <- rbindlist(tablelispmc_k_slr_1000m)##rbind all the segments
colnames(finaltablelispmc_k_slr_1000m)[3] = "pmc_k_slr"
buf_pmc_k_slr_1000m <- finaltablelispmc_k_slr_1000m[,c("pmc_k_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pmc_k_slr_1000m)##cbind with your original file.

#pmc_fe_slr
setwd("pmc_fe_slr_buf_1000m")
tablelispmc_fe_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispmc_fe_slr_1000m <-lapply(tablelispmc_fe_slr_1000m,fread) ## lapply all of then
finaltablelispmc_fe_slr_1000m <- rbindlist(tablelispmc_fe_slr_1000m)##rbind all the segments
colnames(finaltablelispmc_fe_slr_1000m)[3] = "pmc_fe_slr"
buf_pmc_fe_slr_1000m <- finaltablelispmc_fe_slr_1000m[,c("pmc_fe_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pmc_fe_slr_1000m)##cbind with your original file.

#pmc_cu_slr
setwd("pmc_cu_slr_buf_1000m")
tablelispmc_cu_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispmc_cu_slr_1000m <-lapply(tablelispmc_cu_slr_1000m,fread) ## lapply all of then
finaltablelispmc_cu_slr_1000m <- rbindlist(tablelispmc_cu_slr_1000m)##rbind all the segments
colnames(finaltablelispmc_cu_slr_1000m)[3] = "pmc_cu_slr"
buf_pmc_cu_slr_1000m <- finaltablelispmc_cu_slr_1000m[,c("pmc_cu_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pmc_cu_slr_1000m)##cbind with your original file.

#pm25_mass_slr
setwd("pm25_mass_slr_buf_1000m")
tablelispm25_mass_slr_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispm25_mass_slr_1000m <-lapply(tablelispm25_mass_slr_1000m,fread) ## lapply all of then
finaltablelispm25_mass_slr_1000m <- rbindlist(tablelispm25_mass_slr_1000m)##rbind all the segments
colnames(finaltablelispm25_mass_slr_1000m)[3] = "pm25_mass_slr"
buf_pm25_mass_slr_1000m <- finaltablelispm25_mass_slr_1000m[,c("pm25_mass_slr")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_pm25_mass_slr_1000m)##cbind with your original file.




###########################################################
#############GROUP 2 quarterly temperatures

#temp_feb_2019
setwd("temp_feb_2019_buf_1000m")
tablelistemp_feb_2019_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelistemp_feb_2019_1000m <-lapply(tablelistemp_feb_2019_1000m,fread) ## lapply all of then
finaltablelistemp_feb_2019_1000m <- rbindlist(tablelistemp_feb_2019_1000m)##rbind all the segments
colnames(finaltablelistemp_feb_2019_1000m)[3] = "temp_feb_2019"
buf_temp_feb_2019_1000m <- finaltablelistemp_feb_2019_1000m[,c("temp_feb_2019")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_temp_feb_2019_1000m)##cbind with your original file.

#temp_may_2019
setwd("temp_may_2019_buf_1000m")
tablelistemp_may_2019_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelistemp_may_2019_1000m <-lapply(tablelistemp_may_2019_1000m,fread) ## lapply all of then
finaltablelistemp_may_2019_1000m <- rbindlist(tablelistemp_may_2019_1000m)##rbind all the segments
colnames(finaltablelistemp_may_2019_1000m)[3] = "temp_may_2019"
buf_temp_may_2019_1000m <- finaltablelistemp_may_2019_1000m[,c("temp_may_2019")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_temp_may_2019_1000m)##cbind with your original file.

#temp_aug_2019
setwd("temp_aug_2019_buf_1000m")
tablelistemp_aug_2019_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelistemp_aug_2019_1000m <-lapply(tablelistemp_aug_2019_1000m,fread) ## lapply all of then
finaltablelistemp_aug_2019_1000m <- rbindlist(tablelistemp_aug_2019_1000m)##rbind all the segments
colnames(finaltablelistemp_aug_2019_1000m)[3] = "temp_aug_2019"
buf_temp_aug_2019_1000m <- finaltablelistemp_aug_2019_1000m[,c("temp_aug_2019")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_temp_aug_2019_1000m)##cbind with your original file.

#temp_nov_2019
setwd("temp_nov_2019_buf_1000m")
tablelistemp_nov_2019_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelistemp_nov_2019_1000m <-lapply(tablelistemp_nov_2019_1000m,fread) ## lapply all of then
finaltablelistemp_nov_2019_1000m <- rbindlist(tablelistemp_nov_2019_1000m)##rbind all the segments
colnames(finaltablelistemp_nov_2019_1000m)[3] = "temp_nov_2019"
buf_temp_nov_2019_1000m <- finaltablelistemp_nov_2019_1000m[,c("temp_nov_2019")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_temp_nov_2019_1000m)##cbind with your original file.



###########################################################
#############GROUP 3 urban exposures

##soundmapallsources
setwd("soundmapallsources_buf_1000m")
tablelissoundmapallsources_1000m = paste(IDs,".csv",sep="")
tablelissoundmapallsources_1000m <-lapply(tablelissoundmapallsources_1000m,fread)
finaltablelissoundmapallsources_1000m <- rbindlist(tablelissoundmapallsources_1000m)
colnames(finaltablelissoundmapallsources_1000m)[3] ="AllSound"
buf_soundmapallsources_1000m <- finaltablelissoundmapallsources_1000m[,c("AllSound")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_soundmapallsources_1000m)

##trafficnoise 
setwd("trafficnoise_buf_1000m")
tablelistrafficnoise_1000m = paste(IDs,".csv",sep="")
tablelistrafficnoise_1000m <-lapply(tablelistrafficnoise_1000m,fread)
finaltablelistrafficnoise_1000m <- rbindlist(tablelistrafficnoise_1000m)
colnames(finaltablelistrafficnoise_1000m)[3] ="TrafficNoise"
buf_trafficnoise_1000m <- finaltablelistrafficnoise_1000m[,c("TrafficNoise")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_trafficnoise_1000m)

##UHI 
setwd("UHI_buf_1000m")
tablelisUHI_1000m = paste(IDs,".csv",sep="")
tablelisUHI_1000m <-lapply(tablelisUHI_1000m,fread)
finaltablelisUHI_1000m <- rbindlist(tablelisUHI_1000m)
colnames(finaltablelisUHI_1000m )[3] ="UHI"
buf_UHI_1000m <- finaltablelisUHI_1000m[,c("UHI")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_UHI_1000m)

#nightlight
#LAN 2020 300M (light at night)
setwd("LAN_2020_300m_buf_1000m")
tablelisnightlight_1000m = paste(IDs,".csv",sep="")
tablelisnightlight_1000m <-lapply(tablelisnightlight_1000m,fread)
finaltablelisnightlight_1000m <- rbindlist(tablelisnightlight_1000m)
colnames(finaltablelisnightlight_1000m)[3] ="NightLightExpanse"
buf_nightlight_1000m <- finaltablelisnightlight_1000m[,c("NightLightExpanse")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_nightlight_1000m)

#light at night
#setwd("nightlight_buf_1000m")
#tablelisnightlight_1000m = paste(IDs,".csv",sep="")
#tablelisnightlight_1000m <-lapply(tablelisnightlight_1000m,fread)
#finaltablelisnightlight_1000m <- rbindlist(tablelisnightlight_1000m)
#colnames(finaltablelisnightlight_1000m)[3] ="NightLight"
#buf_nightlight_1000m <- finaltablelisnightlight_1000m[,c("NightLight")]
#BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_nightlight_1000m)




###########################################################################
###########################################################################
##############BUILT ENVIRONMENT



######################################################################
###################GROUP 4 CROPS 

#cereals
setwd("cereals_buf_1000m")
tableliscereals_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliscereals_1000m <-lapply(tableliscereals_1000m,fread) ## lapply all of then
finaltableliscereals_1000m <- rbindlist(tableliscereals_1000m)##rbind all the segments
colnames(finaltableliscereals_1000m)[3] = "cereals"
buf_cereals_1000m <- finaltableliscereals_1000m[,c("cereals")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_cereals_1000m)##cbind with your original file.


#artificial_land
setwd("artificial_buf_1000m")
tablelisartificial_land_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisartificial_land_1000m <-lapply(tablelisartificial_land_1000m,fread) ## lapply all of then
finaltablelisartificial_land_1000m <- rbindlist(tablelisartificial_land_1000m)##rbind all the segments
colnames(finaltablelisartificial_land_1000m)[3] = "artificial_land"
buf_artificial_land_1000m <- finaltablelisartificial_land_1000m[,c("artificial_land")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_artificial_land_1000m)##cbind with your original file.


#grassland
setwd("grassland_buf_1000m")
tablelisgrassland_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisgrassland_1000m <-lapply(tablelisgrassland_1000m,fread) ## lapply all of then
finaltablelisgrassland_1000m <- rbindlist(tablelisgrassland_1000m)##rbind all the segments
colnames(finaltablelisgrassland_1000m)[3] = "grassland"
buf_grassland_1000m <- finaltablelisgrassland_1000m[,c("grassland")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_grassland_1000m)##cbind with your original file.

#root_crops
setwd("root_crops_buf_1000m")
tablelisroot_crops_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisroot_crops_1000m <-lapply(tablelisroot_crops_1000m,fread) ## lapply all of then
finaltablelisroot_crops_1000m <- rbindlist(tablelisroot_crops_1000m)##rbind all the segments
colnames(finaltablelisroot_crops_1000m)[3] = "root_crops"
buf_root_crops_1000m <- finaltablelisroot_crops_1000m[,c("root_crops")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_root_crops_1000m)##cbind with your original file.

#non_permanent_industrial_crops 
setwd("np_ind_buf_1000m")
tablelisnon_permanent_industrial_crops_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisnon_permanent_industrial_crops_1000m <-lapply(tablelisnon_permanent_industrial_crops_1000m,fread) ## lapply all of then
finaltablelisnon_permanent_industrial_crops_1000m <- rbindlist(tablelisnon_permanent_industrial_crops_1000m)##rbind all the segments
colnames(finaltablelisnon_permanent_industrial_crops_1000m)[3] = "np_ind_crops"
buf_non_permanent_industrial_crops_1000m <- finaltablelisnon_permanent_industrial_crops_1000m[,c("np_ind_crops")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_non_permanent_industrial_crops_1000m)##cbind with your original file.

#dry_pulses_vegetables_flowers
setwd("dp_v_f_buf_1000m")
tablelisdry_pulses_vegetables_flowers_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisdry_pulses_vegetables_flowers_1000m <-lapply(tablelisdry_pulses_vegetables_flowers_1000m,fread) ## lapply all of then
finaltablelisdry_pulses_vegetables_flowers_1000m <- rbindlist(tablelisdry_pulses_vegetables_flowers_1000m)##rbind all the segments
colnames(finaltablelisdry_pulses_vegetables_flowers_1000m)[3] = "dp_v_f"
buf_dry_pulses_vegetables_flowers_1000m <- finaltablelisdry_pulses_vegetables_flowers_1000m[,c("dp_v_f")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_dry_pulses_vegetables_flowers_1000m)##cbind with your original file.

#fodder
setwd("fodder_buf_1000m")
tablelisfodder_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisfodder_1000m <-lapply(tablelisfodder_1000m,fread) ## lapply all of then
finaltablelisfodder_1000m <- rbindlist(tablelisfodder_1000m)##rbind all the segments
colnames(finaltablelisfodder_1000m)[3] = "fodder"
buf_fodder_1000m <- finaltablelisfodder_1000m[,c("fodder")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_fodder_1000m)##cbind with your original file.

#bare arable land
setwd("b_arble_Ind_buf_1000m")
tablelisbare_arable_land_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisbare_arable_land_1000m <-lapply(tablelisbare_arable_land_1000m,fread) ## lapply all of then
finaltablelisbare_arable_land_1000m <- rbindlist(tablelisbare_arable_land_1000m)##rbind all the segments
colnames(finaltablelisbare_arable_land_1000m)[3] = "b_arable"
buf_bare_arable_land_1000m <- finaltablelisbare_arable_land_1000m[,c("b_arable")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_bare_arable_land_1000m)##cbind with your original file.



#flowerbulbs
setwd("flowerbulbs_buf_1000m")
tablelisflowerbulbs_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisflowerbulbs_1000m <-lapply(tablelisflowerbulbs_1000m,fread) ## lapply all of then
finaltablelisflowerbulbs_1000m <- rbindlist(tablelisflowerbulbs_1000m)##rbind all the segments
colnames(finaltablelisflowerbulbs_1000m)[3] = "flowerbulbs"
buf_flowerbulbs_1000m <- finaltablelisflowerbulbs_1000m[,c("flowerbulbs")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_flowerbulbs_1000m)##cbind with your original file.

#fruittrees
setwd("fruittrees_buf_1000m")
tablelisfruittrees_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisfruittrees_1000m <-lapply(tablelisfruittrees_1000m,fread) ## lapply all of then
finaltablelisfruittrees_1000m <- rbindlist(tablelisfruittrees_1000m)##rbind all the segments
colnames(finaltablelisfruittrees_1000m)[3] = "fruittrees"
buf_fruittrees_1000m <- finaltablelisfruittrees_1000m[,c("fruittrees")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_fruittrees_1000m)##cbind with your original file.

#grains
setwd("grains_buf_1000m")
tablelisgrains_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisgrains_1000m <-lapply(tablelisgrains_1000m,fread) ## lapply all of then
finaltablelisgrains_1000m <- rbindlist(tablelisgrains_1000m)##rbind all the segments
colnames(finaltablelisgrains_1000m)[3] = "grains"
buf_grains_1000m <- finaltablelisgrains_1000m[,c("grains")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_grains_1000m)##cbind with your original file.

#maize
setwd("maize_buf_1000m")
tablelismaize_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelismaize_1000m <-lapply(tablelismaize_1000m,fread) ## lapply all of then
finaltablelismaize_1000m <- rbindlist(tablelismaize_1000m)##rbind all the segments
colnames(finaltablelismaize_1000m)[3] = "maize"
buf_maize_1000m <- finaltablelismaize_1000m[,c("maize")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_maize_1000m)##cbind with your original file.

#othercrops
setwd("othercrops_buf_1000m")
tablelisothercrops_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisothercrops_1000m <-lapply(tablelisothercrops_1000m,fread) ## lapply all of then
finaltablelisothercrops_1000m <- rbindlist(tablelisothercrops_1000m)##rbind all the segments
colnames(finaltablelisothercrops_1000m)[3] = "othercrops"
buf_othercrops_1000m <- finaltablelisothercrops_1000m[,c("othercrops")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_othercrops_1000m)##cbind with your original file.

#potatoes
setwd("potatoes_buf_1000m")
tablelispotatoes_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispotatoes_1000m <-lapply(tablelispotatoes_1000m,fread) ## lapply all of then
finaltablelispotatoes_1000m <- rbindlist(tablelispotatoes_1000m)##rbind all the segments
colnames(finaltablelispotatoes_1000m)[3] = "potatoes"
buf_potatoes_1000m <- finaltablelispotatoes_1000m[,c("potatoes")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_potatoes_1000m)##cbind with your original file.

#sugarbeets
setwd("sugarbeets_buf_1000m")
tablelissugarbeets_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelissugarbeets_1000m <-lapply(tablelissugarbeets_1000m,fread) ## lapply all of then
finaltablelissugarbeets_1000m <- rbindlist(tablelissugarbeets_1000m)##rbind all the segments
colnames(finaltablelissugarbeets_1000m)[3] = "sugarbeets"
buf_sugarbeets_1000m <- finaltablelissugarbeets_1000m[,c("sugarbeets")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_sugarbeets_1000m)##cbind with your original file.



###################################################
###########GROUP 5: GREENERY

#MSAVI_ME300
setwd("MSAVI_ME300_buf_1000m")
tablelisMSAVI_ME300_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisMSAVI_ME300_1000m <-lapply(tablelisMSAVI_ME300_1000m,fread) ## lapply all of then
finaltablelisMSAVI_ME300_1000m <- rbindlist(tablelisMSAVI_ME300_1000m)##rbind all the segments
colnames(finaltablelisMSAVI_ME300_1000m)[3] = "MSAVI_ME300"
buf_MSAVI_ME300_1000m <- finaltablelisMSAVI_ME300_1000m[,c("MSAVI_ME300")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_MSAVI_ME300_1000m)##cbind with your original file.


#NDVI_ME300
setwd("NDVI_ME300_buf_1000m")
tablelisNDVI_ME300_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisNDVI_ME300_1000m <-lapply(tablelisNDVI_ME300_1000m,fread) ## lapply all of then
finaltablelisNDVI_ME300_1000m <- rbindlist(tablelisNDVI_ME300_1000m)##rbind all the segments
colnames(finaltablelisNDVI_ME300_1000m)[3] = "NDVI_ME300"
buf_NDVI_ME300_1000m <- finaltablelisNDVI_ME300_1000m[,c("NDVI_ME300")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_NDVI_ME300_1000m)##cbind with your original file.


##treemap 
setwd("treemap_buf_1000m")
tablelistreemap_1000m = paste(IDs,".csv",sep="")
tablelistreemap_1000m <-lapply(tablelistreemap_1000m,fread)
finaltablelistreemap_1000m <- rbindlist(tablelistreemap_1000m)
colnames(finaltablelistreemap_1000m )[3] ="Trees"
buf_treemap_1000m <- finaltablelistreemap_1000m[,c("Trees")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_treemap_1000m)

##parks
setwd("parks_buf_1000m")
tablelisparks_1000m = paste(IDs,".csv",sep="")
tablelisparks_1000m <-lapply(tablelisparks_1000m,fread)
finaltablelisparks_1000m <- rbindlist(tablelisparks_1000m)
colnames(finaltablelisparks_1000m )[3] ="Parks"
buf_parks_1000m <- finaltablelisparks_1000m[,c("Parks")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_parks_1000m)



###################################################################################
###########GROUP 6: BLUE SPACE


##water
setwd("water_buf_1000m")
tableliswater_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliswater_1000m <-lapply(tableliswater_1000m,fread) ## lapply all of then
finaltableliswater_1000m <- rbindlist(tableliswater_1000m)##rbind all the segments
colnames(finaltableliswater_1000m)[3] ="water"
buf_water_1000m <- finaltableliswater_1000m[,c("water")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_water_1000m)##cbind with your original file.




###########################################
#####################GROUP 7: GREY SPACE


#urbanity
setwd("urbanity_buf_1000m")
tablelisurbanity_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisurbanity_1000m <-lapply(tablelisurbanity_1000m,fread) ## lapply all of then
finaltablelisurbanity_1000m <- rbindlist(tablelisurbanity_1000m)##rbind all the segments
colnames(finaltablelisurbanity_1000m)[3] = "urbanity"
buf_urbanity_1000m <- finaltablelisurbanity_1000m[,c("urbanity")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_urbanity_1000m)##cbind with your original file.

#population density
setwd("pop_den_buf_1000m")
tablelispopden_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelispopden_1000m <-lapply(tablelispopden_1000m,fread) ## lapply all of then
finaltablelispopden_1000m <- rbindlist(tablelispopden_1000m)##rbind all the segments
colnames(finaltablelispopden_1000m)[3] = "popdensity"
buf_popden_1000m <- finaltablelispopden_1000m[,c("popdensity")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_popden_1000m)##cbind with your original file.


#Imperviousness_300m_buffer
setwd("imp300_buf_1000m")
tablelisImperviousness_300m_buffer_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisImperviousness_300m_buffer_1000m <-lapply(tablelisImperviousness_300m_buffer_1000m,fread) ## lapply all of then
finaltablelisImperviousness_300m_buffer_1000m <- rbindlist(tablelisImperviousness_300m_buffer_1000m)##rbind all the segments
colnames(finaltablelisImperviousness_300m_buffer_1000m)[3] ="Imp300m"
buf_Imperviousness_300m_buffer_1000m <- finaltablelisImperviousness_300m_buffer_1000m[,c("Imp300m")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_Imperviousness_300m_buffer_1000m)##cbind with your original file.




##################################################################################
####################GROUP 8: ROADS AND RAILWAYS

#major_roads
setwd("major_roads_buf_1000m")
tablelismajor_roads_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelismajor_roads_1000m <-lapply(tablelismajor_roads_1000m,fread) ## lapply all of then
finaltablelismajor_roads_1000m <- rbindlist(tablelismajor_roads_1000m)##rbind all the segments
colnames(finaltablelismajor_roads_1000m)[3] = "major_roads"
buf_major_roads_1000m <- finaltablelismajor_roads_1000m[,c("major_roads")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_major_roads_1000m)##cbind with your original file.

#highways
setwd("highways_buf_1000m")
tablelishighways_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelishighways_1000m <-lapply(tablelishighways_1000m,fread) ## lapply all of then
finaltablelishighways_1000m <- rbindlist(tablelishighways_1000m)##rbind all the segments
colnames(finaltablelishighways_1000m)[3] = "highways"
buf_highways_1000m <- finaltablelishighways_1000m[,c("highways")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_highways_1000m)##cbind with your original file.

#main_railroad
setwd("main_railroads_buf_1000m")
tablelismain_railroad_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelismain_railroad_1000m <-lapply(tablelismain_railroad_1000m,fread) ## lapply all of then
finaltablelismain_railroad_1000m <- rbindlist(tablelismain_railroad_1000m)##rbind all the segments
colnames(finaltablelismain_railroad_1000m)[3] = "main_railroad"
buf_main_railroad_1000m <- finaltablelismain_railroad_1000m[,c("main_railroad")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_main_railroad_1000m)##cbind with your original file.

#railroad_lightrail_tram
setwd("railroad_lightrail_tram_buf_1000m")
tablelisrailroad_lightrail_tram_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisrailroad_lightrail_tram_1000m <-lapply(tablelisrailroad_lightrail_tram_1000m,fread) ## lapply all of then
finaltablelisrailroad_lightrail_tram_1000m <- rbindlist(tablelisrailroad_lightrail_tram_1000m)##rbind all the segments
colnames(finaltablelisrailroad_lightrail_tram_1000m)[3] = "railroad_lightrail_tram"
buf_railroad_lightrail_tram_1000m <- finaltablelisrailroad_lightrail_tram_1000m[,c("railroad_lightrail_tram")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_railroad_lightrail_tram_1000m)##cbind with your original file.





#####################################################################################
#####################################################################################
#####################################################################################
#SOCIAL ENVIRONMENT


#########################################################################3
#######################GROUP 9: SOCIAL SECURITY

##social security

#SS_PersonsByTypeBenefitAO_84 
setwd("SS_PersonsByTypeBenefitAO_84_buf_1000m")
tablelisSS_PersonsByTypeBenefitAO_84_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisSS_PersonsByTypeBenefitAO_84_1000m <-lapply(tablelisSS_PersonsByTypeBenefitAO_84_1000m,fread) ## lapply all of then
finaltablelisSS_PersonsByTypeBenefitAO_84_1000m <- rbindlist(tablelisSS_PersonsByTypeBenefitAO_84_1000m)##rbind all the segments
colnames(finaltablelisSS_PersonsByTypeBenefitAO_84_1000m )[3] ="SS84"
buf_SS_PersonsByTypeBenefitAO_84_1000m <- finaltablelisSS_PersonsByTypeBenefitAO_84_1000m[,c("SS84")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_SS_PersonsByTypeBenefitAO_84_1000m)##cbind with your original file.

#SS_Personsbytypebenefitassistance 83
setwd("SS_Personsbytypebenefitassistance_83_buf_1000m")
tablelisSS_Personsbytypebenefitassistance_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisSS_Personsbytypebenefitassistance_1000m <-lapply(tablelisSS_Personsbytypebenefitassistance_1000m,fread) ## lapply all of then
finaltablelisSS_Personsbytypebenefitassistance_1000m <- rbindlist(tablelisSS_Personsbytypebenefitassistance_1000m)##rbind all the segments
colnames(finaltablelisSS_Personsbytypebenefitassistance_1000m )[3] ="SS83"
buf_SS_Personsbytypebenefitassistance_1000m <- finaltablelisSS_Personsbytypebenefitassistance_1000m[,c("SS83")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_SS_Personsbytypebenefitassistance_1000m)##cbind with your original file.

#SS_PersonsByTypeBenefitWW_85 
setwd("SS_PersonsByTypeBenefitWW_85_buf_1000m")
tablelisSS_PersonsByTypeBenefitWW_85_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisSS_PersonsByTypeBenefitWW_85_1000m <-lapply(tablelisSS_PersonsByTypeBenefitWW_85_1000m,fread) ## lapply all of then
finaltablelisSS_PersonsByTypeBenefitWW_85_1000m <- rbindlist(tablelisSS_PersonsByTypeBenefitWW_85_1000m)##rbind all the segments
colnames(finaltablelisSS_PersonsByTypeBenefitWW_85_1000m)[3] ="SS85"
buf_SS_PersonsByTypeBenefitWW_85_1000m <- finaltablelisSS_PersonsByTypeBenefitWW_85_1000m[,c("SS85")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_SS_PersonsByTypeBenefitWW_85_1000m)##cbind with your original file.

#SS_PersonsPerTypeBenefitAOW_86 
setwd("SS_PersonsPerTypeBenefitAOW_86_buf_1000m")
tablelisSS_PersonsPerTypeBenefitAOW_86_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisSS_PersonsPerTypeBenefitAOW_86_1000m <-lapply(tablelisSS_PersonsPerTypeBenefitAOW_86_1000m,fread) ## lapply all of then
finaltablelisSS_PersonsPerTypeBenefitAOW_86_1000m <- rbindlist(tablelisSS_PersonsPerTypeBenefitAOW_86_1000m)##rbind all the segments
colnames(finaltablelisSS_PersonsPerTypeBenefitAOW_86_1000m)[3] ="SS86"
buf_SS_PersonsPerTypeBenefitAOW_86_1000m <- finaltablelisSS_PersonsPerTypeBenefitAOW_86_1000m[,c("SS86")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_SS_PersonsPerTypeBenefitAOW_86_1000m)##cbind with your original file.




##################################################################################
####################GROUP 10: EDUCATION LEVEL AND INCOME

##education_level_low
setwd("education_level_low_buf_1000m")
tableliseducation_level_low_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliseducation_level_low_1000m <-lapply(tableliseducation_level_low_1000m,fread) ## lapply all of then
finaltableliseducation_level_low_1000m <- rbindlist(tableliseducation_level_low_1000m)##rbind all the segments
colnames(finaltableliseducation_level_low_1000m)[3] ="EduLow"
buf_education_level_low_1000m <- finaltableliseducation_level_low_1000m[,c("EduLow")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_education_level_low_1000m)##cbind with your original file.


##education_level_secondary
setwd("education_level_secondary_buf_1000m")
tableliseducation_level_secondary_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliseducation_level_secondary_1000m <-lapply(tableliseducation_level_secondary_1000m,fread) ## lapply all of then
finaltableliseducation_level_secondary_1000m <- rbindlist(tableliseducation_level_secondary_1000m)##rbind all the segments
colnames(finaltableliseducation_level_secondary_1000m )[3] ="EduSec"
buf_education_level_secondary_1000m <- finaltableliseducation_level_secondary_1000m[,c("EduSec")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_education_level_secondary_1000m)##cbind with your original file.

##education_level_high
setwd("education_level_high_buf_1000m")
tableliseducation_level_high_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliseducation_level_high_1000m <-lapply(tableliseducation_level_high_1000m,fread) ## lapply all of then
finaltableliseducation_level_high_1000m <- rbindlist(tableliseducation_level_high_1000m)##rbind all the segments
colnames(finaltableliseducation_level_high_1000m)[3] ="EduHigh"
buf_education_level_high_1000m <- finaltableliseducation_level_high_1000m[,c("EduHigh")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_education_level_high_1000m)##cbind with your original file.



####INCOME 

#Average_Income_Per_Income_Recipient
setwd("Average_Income_Per_Income_Recipient_buf_1000m")
tablelisAverage_Income_Per_Income_Recipient_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisAverage_Income_Per_Income_Recipient_1000m <-lapply(tablelisAverage_Income_Per_Income_Recipient_1000m,fread) ## lapply all of then
finaltablelisAverage_Income_Per_Income_Recipient_1000m <- rbindlist(tablelisAverage_Income_Per_Income_Recipient_1000m)##rbind all the segments
colnames(finaltablelisAverage_Income_Per_Income_Recipient_1000m)[3] ="AvIncmPIncRec"
buf_Average_Income_Per_Income_Recipient_1000m <- finaltablelisAverage_Income_Per_Income_Recipient_1000m[,c("AvIncmPIncRec")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_Average_Income_Per_Income_Recipient_1000m)##cbind with your original file

#person_with_lowest_income_percent
setwd("person_with_lowest_income_percent_buf_1000m")
tablelisperson_with_lowest_income_percent_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisperson_with_lowest_income_percent_1000m <-lapply(tablelisperson_with_lowest_income_percent_1000m,fread) ## lapply all of then
finaltablelisperson_with_lowest_income_percent_1000m <- rbindlist(tablelisperson_with_lowest_income_percent_1000m)##rbind all the segments
colnames(finaltablelisperson_with_lowest_income_percent_1000m)[3] ="LowestIncmPcnt"
buf_person_with_lowest_income_percent_1000m <- finaltablelisperson_with_lowest_income_percent_1000m[,c("LowestIncmPcnt")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_person_with_lowest_income_percent_1000m)##cbind with your original file.

#person_with_highest_income_percent
setwd("person_with_highest_income_percent_buf_1000m")
tablelisperson_with_highest_income_percent_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisperson_with_highest_income_percent_1000m <-lapply(tablelisperson_with_highest_income_percent_1000m,fread) ## lapply all of then
finaltablelisperson_with_highest_income_percent_1000m <- rbindlist(tablelisperson_with_highest_income_percent_1000m)##rbind all the segments
colnames(finaltablelisperson_with_highest_income_percent_1000m)[3] ="HghstIncmPcnt"
buf_person_with_highest_income_percent_1000m <- finaltablelisperson_with_highest_income_percent_1000m[,c("HghstIncmPcnt")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_person_with_highest_income_percent_1000m)##cbind with your original file.





#########################################################################
######################GROUP 11: LIVABILITY


#livability_score
setwd("livability_score_buf_1000m")
tablelislivability_score_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelislivability_score_1000m <-lapply(tablelislivability_score_1000m,fread) ## lapply all of then
finaltablelislivability_score_1000m <- rbindlist(tablelislivability_score_1000m)##rbind all the segments
colnames(finaltablelislivability_score_1000m)[3] ="Lvblty"
buf_livability_score_1000m <- finaltablelislivability_score_1000m[,c("Lvblty")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_livability_score_1000m)##cbind with your original file.


#phy_env
setwd("phy_env_buf_1000m")
tablelisphy_env_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisphy_env_1000m <-lapply(tablelisphy_env_1000m,fread) ## lapply all of then
finaltablelisphy_env_1000m <- rbindlist(tablelisphy_env_1000m)##rbind all the segments
colnames(finaltablelisphy_env_1000m)[3] ="PhyEnv"
buf_phy_env_1000m <- finaltablelisphy_env_1000m[,c("PhyEnv")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_phy_env_1000m)##cbind with your original file.

#nuisance_insecurity
setwd("nuisance_insecurity_buf_1000m")
tablelisnuisance_insecurity_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisnuisance_insecurity_1000m <-lapply(tablelisnuisance_insecurity_1000m,fread) ## lapply all of then
finaltablelisnuisance_insecurity_1000m <- rbindlist(tablelisnuisance_insecurity_1000m)##rbind all the segments
colnames(finaltablelisnuisance_insecurity_1000m )[3] ="NsnceIncrty"
buf_nuisance_insecurity_1000m <- finaltablelisnuisance_insecurity_1000m[,c("NsnceIncrty")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_nuisance_insecurity_1000m)##cbind with your original file.

#social_cohesion
setwd("social_cohesion_buf_1000m")
tablelissocial_cohesion_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelissocial_cohesion_1000m <-lapply(tablelissocial_cohesion_1000m,fread) ## lapply all of then
finaltablelissocial_cohesion_1000m <- rbindlist(tablelissocial_cohesion_1000m)##rbind all the segments
colnames(finaltablelissocial_cohesion_1000m)[3] ="SoCoh"
buf_social_cohesion_1000m <- finaltablelissocial_cohesion_1000m[,c("SoCoh")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_social_cohesion_1000m)##cbind with your original file.

#facilities
setwd("facilities_buf_1000m")
tablelisfacilities_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisfacilities_1000m <-lapply(tablelisfacilities_1000m,fread) ## lapply all of then
finaltablelisfacilities_1000m <- rbindlist(tablelisfacilities_1000m)##rbind all the segments
colnames(finaltablelisfacilities_1000m )[3] ="Facilities"
buf_facilities_1000m <- finaltablelisfacilities_1000m[,c("Facilities")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_facilities_1000m)##cbind with your original file.




#########################################################################
######################GROUP 12: CRIME

#Total destruction and violence
setwd("T_dest_vio_buf_1000m")
tablelisT_dest_vio_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisT_dest_vio_1000m <-lapply(tablelisT_dest_vio_1000m,fread) ## lapply all of then
finaltablelisT_dest_vio_1000m <- rbindlist(tablelisT_dest_vio_1000m)##rbind all the segments
colnames(finaltablelisT_dest_vio_1000m )[3] ="T_dest_vio"
buf_T_dest_vio_1000m <- finaltablelisT_dest_vio_1000m[,c("T_dest_vio")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_T_dest_vio_1000m)##cbind with your original file.

#Total property crimes
setwd("T_prpty_crm_buf_1000m")
tablelisT_prpty_crm_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisT_prpty_crm_1000m <-lapply(tablelisT_prpty_crm_1000m,fread) ## lapply all of then
finaltablelisT_prpty_crm_1000m <- rbindlist(tablelisT_prpty_crm_1000m)##rbind all the segments
colnames(finaltablelisT_prpty_crm_1000m )[3] ="property_crm"
buf_T_prpty_crm_1000m <- finaltablelisT_prpty_crm_1000m[,c("property_crm")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_T_prpty_crm_1000m)##cbind with your original file.

#Total theft
setwd("T_theft_buf_1000m")
tablelisT_theft_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisT_theft_1000m <-lapply(tablelisT_theft_1000m,fread) ## lapply all of then
finaltablelisT_theft_1000m <- rbindlist(tablelisT_theft_1000m)##rbind all the segments
colnames(finaltablelisT_theft_1000m )[3] ="T_theft"
buf_T_theft_1000m <- finaltablelisT_theft_1000m[,c("T_theft")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_T_theft_1000m)##cbind with your original file.




#########################################################################
######################GROUP 13: SCHOOLS AND HOSPITALS

###primary schools
setwd("primaryschools_buf_1000m")
tablelisprimaryschools_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisprimaryschools_1000m <-lapply(tablelisprimaryschools_1000m,fread) ## lapply all of then
finaltablelisprimaryschools_1000m <- rbindlist(tablelisprimaryschools_1000m)##rbind all the segments
colnames(finaltablelisprimaryschools_1000m)[3] = "primaryschools"
buf_primaryschools_1000m <- finaltablelisprimaryschools_1000m[,c("primaryschools")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_primaryschools_1000m)##cbind with your original file.

###MBO schools
setwd("MBO_buf_1000m")
tablelisMBO_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisMBO_1000m <-lapply(tablelisMBO_1000m,fread) ## lapply all of then
finaltablelisMBO_1000m <- rbindlist(tablelisMBO_1000m)##rbind all the segments
colnames(finaltablelisMBO_1000m)[3] = "MBO"
buf_MBO_1000m <- finaltablelisMBO_1000m[,c("MBO")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_MBO_1000m)##cbind with your original file.

###colleges and universities
setwd("col_and_uni_buf_1000m")
tableliscol_and_uni_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliscol_and_uni_1000m <-lapply(tableliscol_and_uni_1000m,fread) ## lapply all of then
finaltableliscol_and_uni_1000m <- rbindlist(tableliscol_and_uni_1000m)##rbind all the segments
colnames(finaltableliscol_and_uni_1000m)[3] = "col_and_uni"
buf_col_and_uni_1000m <- finaltableliscol_and_uni_1000m[,c("col_and_uni")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_col_and_uni_1000m)##cbind with your original file.

#hospitals
setwd("hospitals_buf_1000m")
tablelishospitals_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelishospitals_1000m <-lapply(tablelishospitals_1000m,fread) ## lapply all of then
finaltablelishospitals_1000m <- rbindlist(tablelishospitals_1000m)##rbind all the segments
colnames(finaltablelishospitals_1000m)[3] = "hospitals"
buf_hospitals_1000m <- finaltablelishospitals_1000m[,c("hospitals")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_hospitals_1000m)##cbind with your original file.





#########################################################################
######################GROUP 14: FOOD ENVIRONMENT

###social_drinking
setwd("social_drinking_buf_1000m")
tablelissocial_drinking_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelissocial_drinking_1000m <-lapply(tablelissocial_drinking_1000m,fread) ## lapply all of then
finaltablelissocial_drinking_1000m <- rbindlist(tablelissocial_drinking_1000m)##rbind all the segments
colnames(finaltablelissocial_drinking_1000m)[3] = "social_drinking"
buf_social_drinking_1000m <- finaltablelissocial_drinking_1000m[,c("social_drinking")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_social_drinking_1000m)##cbind with your original file.

###fastfood
setwd("fastfood_buf_1000m")
tablelisfastfood_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisfastfood_1000m <-lapply(tablelisfastfood_1000m,fread) ## lapply all of then
finaltablelisfastfood_1000m <- rbindlist(tablelisfastfood_1000m)##rbind all the segments
colnames(finaltablelisfastfood_1000m)[3] = "fastfood"
buf_fastfood_1000m <- finaltablelisfastfood_1000m[,c("fastfood")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_fastfood_1000m)##cbind with your original file.

#coffee_and_desserts
setwd("coffee_and_desserts_buf_1000m")
tableliscoffee_and_desserts_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tableliscoffee_and_desserts_1000m <-lapply(tableliscoffee_and_desserts_1000m,fread) ## lapply all of then
finaltableliscoffee_and_desserts_1000m <- rbindlist(tableliscoffee_and_desserts_1000m)##rbind all the segments
colnames(finaltableliscoffee_and_desserts_1000m)[3] = "coffee_and_desserts"
buf_coffee_and_desserts_1000m <- finaltableliscoffee_and_desserts_1000m[,c("coffee_and_desserts")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_coffee_and_desserts_1000m)##cbind with your original file.

###fruit_vegstore 
setwd("fruit_vegstore_buf_1000m")
tablelisfruit_vegstore_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisfruit_vegstore_1000m <-lapply(tablelisfruit_vegstore_1000m,fread) ## lapply all of then
finaltablelisfruit_vegstore_1000m <- rbindlist(tablelisfruit_vegstore_1000m)##rbind all the segments
colnames(finaltablelisfruit_vegstore_1000m)[3] = "fruit_vegstore"
buf_fruit_vegstore_1000m <- finaltablelisfruit_vegstore_1000m[,c("fruit_vegstore")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_fruit_vegstore_1000m)##cbind with your original file.

###restaurant_bar_pub 
setwd("restaurant_bar_pub_buf_1000m")
tablelisrestaurant_bar_pub_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelisrestaurant_bar_pub_1000m <-lapply(tablelisrestaurant_bar_pub_1000m,fread) ## lapply all of then
finaltablelisrestaurant_bar_pub_1000m <- rbindlist(tablelisrestaurant_bar_pub_1000m)##rbind all the segments
colnames(finaltablelisrestaurant_bar_pub_1000m)[3] = "restaurant_bar_pub"
buf_restaurant_bar_pub_1000m <- finaltablelisrestaurant_bar_pub_1000m[,c("restaurant_bar_pub")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_restaurant_bar_pub_1000m)##cbind with your original file.

###tobacco_coffeeshop_shishalounge
setwd("tob_cofshp_shisha_buf_1000m")
tablelistob_cofshp_shisha_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelistob_cofshp_shisha_1000m <-lapply(tablelistob_cofshp_shisha_1000m,fread) ## lapply all of then
finaltablelistob_cofshp_shisha_1000m <- rbindlist(tablelistob_cofshp_shisha_1000m)##rbind all the segments
colnames(finaltablelistob_cofshp_shisha_1000m)[3] = "tob_cofshp_shisha"
buf_tob_cofshp_shisha_1000m <- finaltablelistob_cofshp_shisha_1000m[,c("tob_cofshp_shisha")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_tob_cofshp_shisha_1000m)##cbind with your original file.

#supermarket_and_minisupermarket
setwd("superandminimarket_buf_1000m")
tablelissuperandminimarket_1000m = paste(IDs,".csv",sep="")##read all the file in your folder
tablelissuperandminimarket_1000m <-lapply(tablelissuperandminimarket_1000m,fread) ## lapply all of then
finaltablelissuperandminimarket_1000m <- rbindlist(tablelissuperandminimarket_1000m)##rbind all the segments
colnames(finaltablelissuperandminimarket_1000m)[3] = "superandminimarket"
buf_superandminimarket_1000m <- finaltablelissuperandminimarket_1000m[,c("superandminimarket")]
BAGdata_2019_EnvFactors <- cbind(BAGdata_2019_EnvFactors,buf_superandminimarket_1000m)##cbind with your original file.







####################################################
##############SAVE DATA

#take out unnecessary columns
BAGdata_2019_EnvFactors2 <- BAGdata_2019_EnvFactors[,!(names(BAGdata_2019_EnvFactors) %in% c("...1", "postcode", "OID_", "identificatie","huisnummer", "huisletter", "huisnummertoevoeging", "openbareruimtenaam","woonplaatsnaam", "adrestype", "typeadresseerbaarobject", "adresseerbaarobjectstatus", "adresseerbaarobjectgeometrie", "adresseerbaarobjectid", "openbareruimteid", "woonplaatsid", "POINT_X", "POINT_Y", "POINT_Z"))]


#delete rows with NA
nrow(BAGdata_2019_EnvFactors2)
colSums(is.na(BAGdata_2019_EnvFactors2))
BAGdata_2019_EnvFactors3 <- na.omit(BAGdata_2019_EnvFactors2)
nrow(BAGdata_2019_EnvFactors3)
ncol(BAGdata_2019_EnvFactors3)
#BAGdata_2019_EnvFactors3 <- BAGdata_2019_EnvFactors2


write_csv(BAGdata_2019_EnvFactors3, "")





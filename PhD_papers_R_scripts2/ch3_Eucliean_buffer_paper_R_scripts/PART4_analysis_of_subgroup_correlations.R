########################creating subgroups


# 1 # Heatmaps ####
#library(huge)
#library(igraph)
#library(ggplot2)
#library(MASS) 
#library(reshape2) 
#library(reshape)
#library(circlize)
#library(itsadug)






#############100m

test1 <- read.csv("model_versions/buf100m_103690_addrss_5.csv")



airpollution <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr")

temp_quarterly <- dplyr::select(test1, "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

urban_exposures <- dplyr::select(test1, "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

crops <- dplyr::select(test1, "cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets")

green_blue_space <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

grey_space <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m")

roads_railways <- dplyr::select(test1, "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

social_security <- dplyr::select(test1, "SS84", "SS83", "SS85", "SS86")

edu_level <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh")

income <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt")

livability <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

crime <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft")

schools_hospitals <- dplyr::select(test1, "primaryschools", "MBO", "col_and_uni", "hospitals")

food_facilities <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")

###################################################################################

airpollutionANDcrime <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "T_dest_vio", "property_crm",  "T_theft")

airpollutionANDcrops<- dplyr::select(test1,"NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr","cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets")

airpollutionANDedu_level <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "EduLow", "EduSec", "EduHigh")

airpollutionANDfood_facilities <- dplyr::select(test1,"NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket" )

airpollutionANDgreen_blue_space <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water") 

airpollutionANDlivability <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

airpollutionANDroads_railways <- dplyr::select(test1,"NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram" )

airpollutionANDschools_hospitals <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "primaryschools", "MBO", "col_and_uni", "hospitals")

airpollutionANDsocial_security <- dplyr::select(test1,"NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr" , "SS84", "SS83", "SS85", "SS86")

airpollutionANDtemp_quarterly <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

airpollutionANDurban_exposures <- dplyr::select(test1, "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

crimeANDcrops <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets")

crimeANDedu_level <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "EduLow", "EduSec", "EduHigh")

crimeANDfood_facilities <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")

crimeANDgreen_blue_space <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

crimeANDlivability <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

crimeANDroads_railways <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

crimeANDschools_hospitals <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "primaryschools", "MBO", "col_and_uni", "hospitals")

crimeANDsocialsecurity <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "SS84", "SS83", "SS85", "SS86")

crimeANDtemp_quart <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

crimeANDurban_exposures <- dplyr::select(test1, "T_dest_vio", "property_crm",  "T_theft", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

cropsANDANDedu_level<- dplyr::select(test1, "cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "EduLow", "EduSec", "EduHigh")

cropsANDfood_facilities <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")
                                         
cropsANDgreen_blue_space <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")
                                          
cropsANDlivability <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")
                                    
cropsANDroads_railways <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "T_dest_vio", "property_crm",  "T_theft", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")
                                        
cropsANDschools_hospitals <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "primaryschools", "MBO", "col_and_uni", "hospitals")
                                           
cropsANDsocial_security <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "SS84", "SS83", "SS85", "SS86")
                                         
cropsANDtemp_quart <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")
                                    
cropsANDurban_exposures <- dplyr::select(test1,"cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")
                                    
edu_levelANDfood_facilities <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")

edu_levelANDgreen_blue_space <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

edu_levelANDlivability <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

edu_levelANDroads_railways <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

edu_levelANDschools_hospitals <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "primaryschools", "MBO", "col_and_uni", "hospitals")

edu_levelANDsocial_security <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "SS84", "SS83", "SS85", "SS86")

edu_levelANDtemp_quarterly <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

edu_levelANDurban_exposures <- dplyr::select(test1, "EduLow", "EduSec", "EduHigh", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

food_facilitiesANDgreen_blue_space <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

food_facilitiesANDlivability <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

food_facilitiesANDroads_railways <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

food_facilitiesANDschools_hospitals <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "primaryschools", "MBO", "col_and_uni", "hospitals")

food_facilitiesANDsocial_security <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "SS84", "SS83", "SS85", "SS86")

food_facilitiesANDtemp_quarterly <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

food_facilitiesANDurban_exposures <- dplyr::select(test1, "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

green_blue_spaceANDlivability <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

green_blue_spaceANDroads_railways <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

green_blue_spaceANDschools_hospitals <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "primaryschools", "MBO", "col_and_uni", "hospitals")

green_blue_spaceANDsocial_security <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "SS84", "SS83", "SS85", "SS86")

green_blue_spaceANDtemp_quart <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

green_blue_spaceANDurban_exposures <- dplyr::select(test1, "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

livabilityANDroads_railways <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

livabilityANDschools_hospitals <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities", "primaryschools", "MBO", "col_and_uni", "hospitals")

livabilityANDsocial_security <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities", "SS84", "SS83", "SS85", "SS86")

livabilityANDtemp_quart <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

livabilityANDurban_exposures <- dplyr::select(test1, "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

roads_railwaysANDschools_hospitals <- dplyr::select(test1, "major_roads", "highways", "main_railroad", "railroad_lightrail_tram", "primaryschools", "MBO", "col_and_uni", "hospitals")

roads_railwaysANDsocial_security <- dplyr::select(test1, "major_roads", "highways", "main_railroad", "railroad_lightrail_tram", "SS84", "SS83", "SS85", "SS86")

roads_railwaysANDtemp_quart <- dplyr::select(test1,"major_roads", "highways", "main_railroad", "railroad_lightrail_tram", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019" )

roads_railwaysANDurban_exposures <- dplyr::select(test1, "major_roads", "highways", "main_railroad", "railroad_lightrail_tram", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

schools_hospitalsANDsocial_security <- dplyr::select(test1, "primaryschools", "MBO", "col_and_uni", "hospitals", "SS84", "SS83", "SS85", "SS86")

schools_hospitalsANDtemp_quart <- dplyr::select(test1, "primaryschools", "MBO", "col_and_uni", "hospitals", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

schools_hospitalsANDurban_exposures <- dplyr::select(test1, "primaryschools", "MBO", "col_and_uni", "hospitals", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

social_securityANDtemp_quart <- dplyr::select(test1, "SS84", "SS83", "SS85", "SS86", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

social_securityANDurban_exposures <- dplyr::select(test1, "SS84", "SS83", "SS85", "SS86", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

temp_quarterlyANDurban_exposures <- dplyr::select(test1, "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

incomeANDairpollution <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt","NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr")

incomeANDtemp_quarterly <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

incomeANDurban_exposures <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

incomeANDcrops <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets")

incomeANDgreen_blue_space <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

incomeANDgrey_space <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "urbanity", "popdensity", "Imp300m")

incomeANDroads_railways <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

incomeANDsocialsecurity <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "SS84", "SS83", "SS85", "SS86")

incomeANDedu_level <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "EduLow", "EduSec", "EduHigh")

incomeANDlivability <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

incomeANDcrime <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "T_dest_vio", "property_crm",  "T_theft")

incomeANDschools_hospitals <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "primaryschools", "MBO", "col_and_uni", "hospitals")

incomeANDfood_facilities <- dplyr::select(test1, "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")

grey_spaceANDairpollution <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "NO2", "PM2.5", "PM10", "Ozone", "UFP", "BC", "pm25_ni_slr", "pm25_cu_slr", "pm25_fe_slr", "pm25_k_slr", "pm25_s_slr", "pm25_si_slr", "pm25_v_slr", "pm25_zn_slr", "pmc_zn_slr", "pmc_si_slr", "pmc_k_slr", "pmc_fe_slr", "pmc_cu_slr", "pm25_mass_slr")

grey_spaceANDtemp_quarterly <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "temp_feb_2019", "temp_may_2019", "temp_aug_2019", "temp_nov_2019")

grey_spaceANDurban_exposures <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "AllSound", "TrafficNoise", "UHI", "NightLightExpanse")

grey_spaceANDcrops <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "cereals", "artificial_land", "grassland", "root_crops", "np_ind_crops", "dp_v_f", "fodder", "b_arable", "flowerbulbs", "fruittrees", "grains", "maize", "othercrops", "potatoes", "sugarbeets")

grey_spaceANDgreen_blue_space <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "MSAVI_ME300", "NDVI_ME300", "Trees", "Parks", "water")

grey_spaceANDroads_railways <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "major_roads", "highways", "main_railroad", "railroad_lightrail_tram")

grey_spaceANDsocialsecurity <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "SS84", "SS83", "SS85", "SS86")

grey_spaceANDedu_level <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "EduLow", "EduSec", "EduHigh")

grey_spaceANDincome <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "AvIncmPIncRec", "LowestIncmPcnt", "HghstIncmPcnt")

grey_spaceANDlivability <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "Lvblty", "PhyEnv", "NsnceIncrty", "SoCoh", "Facilities")

grey_spaceANDcrime <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "T_dest_vio", "property_crm",  "T_theft")

grey_spaceANDschools_hospitals <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "primaryschools", "MBO", "col_and_uni", "hospitals")

grey_spaceANDfood_facilities <- dplyr::select(test1, "urbanity", "popdensity", "Imp300m", "social_drinking", "fastfood", "coffee_and_desserts", "fruit_vegstore", "restaurant_bar_pub", "tob_cofshp_shisha", "superandminimarket")




###############################################################################
###################################
#######creation of heatmaps 

.libPaths()
.libPaths()

setwd("results_from_model")


##First initiate some functions we need
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
} # Get lower triangle of the correlation matrix

get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
} # Get upper triangle of the correlation matrix

reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}


###############################################################################
####################airpollution 
mydata <- airpollution
mydata <- na.omit(mydata)

nrow(mydata)
ncol(mydata)

cormat <- cor(mydata)

upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollution_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollution/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollution_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("air pollution buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()



###############################################################################
######temp_quarterly

mydata <- temp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/temp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/temp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_temp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("temperature quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()



###############################################################################
######urban_exposures

mydata <- urban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/urban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/urban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_urban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("urban exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()



###############################################################################
######crops
mydata <- crops
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crops_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crops/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crops_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crops buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######green_blue_space 
mydata <- green_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green blue space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######grey_space 
mydata <- grey_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######roads_railways
mydata <- roads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/roads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/roads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_roads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("roads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######social_security
mydata <- social_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/social_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/social_security/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_social_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("social security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######edu_level
mydata <- edu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("education level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######income
mydata <- income
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/income_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/income/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_income_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("income buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######livability 
mydata <- livability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######crime 
mydata <- crime
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crime_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crime/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crime_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crime buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######school_hospitals
mydata <- schools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/schools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/schools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_schools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("schools and hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######food_facilities 
mydata <- food_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######airpollutionANDcrime
mydata <- airpollutionANDcrime
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDcrime_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDcrime/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDcrime_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDcrime buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######airpollutionANDcrops
mydata <- airpollutionANDcrops
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDcrops_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDcrops/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDcrops_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDcrops buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()



###############################################################################
######airpollutionANDedu_level 
mydata <- airpollutionANDedu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDedu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDedu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDedu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDedu_level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDfood_facilities
mydata <- airpollutionANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDgreen_blue_space
mydata <- airpollutionANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDlivability 
mydata <- airpollutionANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDroads_railways
mydata <- airpollutionANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDschools_hospitals 
mydata <- airpollutionANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDsocial_security
mydata <- airpollutionANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDtemp_quarterly 
mydata <- airpollutionANDtemp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDtemp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDtemp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDtemp_quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######airpollutionANDurban_exposures 
mydata <- airpollutionANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/airpollutionANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/airpollutionANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_airpollutionANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("airpollutionANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDcrops
mydata <- crimeANDcrops
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDcrops_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDcrops/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDcrops_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDcrops buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDedu_level
mydata <- crimeANDedu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDedu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDedu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDedu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDedu_level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDfood_facilities
mydata <- crimeANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDgreen_blue_space 
mydata <- crimeANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDlivability 
mydata <- crimeANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDroads_railways 
mydata <- crimeANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDschools_hospitals 
mydata <- crimeANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDsocialsecurity 
mydata <- crimeANDsocialsecurity 
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDsocialsecurity_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDsocialsecurity_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDsocialsecurity buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDtemp_quart 
mydata <- crimeANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######crimeANDurban_exposures 
mydata <- crimeANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/crimeANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/crimeANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_crimeANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("crimeANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDedu_level 
mydata <- cropsANDANDedu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDANDedu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDedu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDANDedu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDANDedu_level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDfood_facilities 
mydata <- cropsANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDgreen_blue_space 
mydata <- cropsANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDlivability 
mydata <- cropsANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDroads_railways 
mydata <- cropsANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDschools_hospitals 
mydata <- cropsANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDsocial_security 
mydata <- cropsANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDsocial_security/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDtemp_quart 
mydata <- cropsANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDtemp_quart/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######cropsANDurban_exposures 
mydata <- cropsANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/cropsANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/cropsANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_cropsANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("cropsANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDfood_facilities 
mydata <- edu_levelANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDgreen_blue_space 
mydata <- edu_levelANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDlivability 
mydata <- edu_levelANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDroads_railways 
mydata <- edu_levelANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDschools_hospitals
mydata <- edu_levelANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDsocial_security 
mydata <- edu_levelANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDtemp_quarterly 
mydata <- edu_levelANDtemp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDtemp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDtemp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDtemp_quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######edu_levelANDurban_exposures
mydata <- edu_levelANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/edu_levelANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/edu_levelANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_edu_levelANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("edu_levelANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDgreen_blue_space 
mydata <- food_facilitiesANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDlivability 
mydata <- food_facilitiesANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDroads_railways 
mydata <- food_facilitiesANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDschools_hospitals 
mydata <- food_facilitiesANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDsocial_security
mydata <- food_facilitiesANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDtemp_quarterly 
mydata <- food_facilitiesANDtemp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDtemp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDtemp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDtemp_quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######food_facilitiesANDurban_exposures 
mydata <- food_facilitiesANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/food_facilitiesANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/food_facilitiesANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_food_facilitiesANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("food_facilitiesANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDlivability
mydata <- green_blue_spaceANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDroads_railways 
mydata <- green_blue_spaceANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDschools_hospitals 
mydata <- green_blue_spaceANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDsocial_security
mydata <- green_blue_spaceANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDtemp_quart 
mydata <- green_blue_spaceANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######green_blue_spaceANDurban_exposures 
mydata <- green_blue_spaceANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/green_blue_spaceANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/green_blue_spaceANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_green_blue_spaceANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("green_blue_spaceANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######livabilityANDroads_railways 
mydata <- livabilityANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livabilityANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livabilityANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livabilityANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livabilityANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######livabilityANDschools_hospitals 
mydata <- livabilityANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livabilityANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livabilityANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livabilityANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livabilityANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######livabilityANDsocial_security
mydata <- livabilityANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livabilityANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livabilityANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livabilityANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livabilityANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######livabilityANDtemp_quart 
mydata <- livabilityANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livabilityANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livabilityANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livabilityANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livabilityANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######livabilityANDurban_exposures 
mydata <- livabilityANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/livabilityANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/livabilityANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_livabilityANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("livabilityANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######roads_railwaysANDschools_hospitals 
mydata <- roads_railwaysANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/roads_railwaysANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/roads_railwaysANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_roads_railwaysANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("roads_railwaysANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######roads_railwaysANDsocial_security 
mydata <- roads_railwaysANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/roads_railwaysANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/roads_railwaysANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_roads_railwaysANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("roads_railwaysANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######roads_railwaysANDtemp_quart 
mydata <- roads_railwaysANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/roads_railwaysANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/roads_railwaysANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_roads_railwaysANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("roads_railwaysANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######roads_railwaysANDurban_exposures
mydata <- roads_railwaysANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/roads_railwaysANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/roads_railwaysANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_roads_railwaysANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("roads_railwaysANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######schools_hospitalsANDsocial_security
mydata <- schools_hospitalsANDsocial_security
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/schools_hospitalsANDsocial_security_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/schools_hospitalsANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_schools_hospitalsANDsocial_security_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("schools_hospitalsANDsocial_security buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######schools_hospitalsANDtemp_quart
mydata <- schools_hospitalsANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/schools_hospitalsANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/schools_hospitalsANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_schools_hospitalsANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("schools_hospitalsANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######schools_hospitalsANDurban_exposures 
mydata <- schools_hospitalsANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/schools_hospitalsANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/schools_hospitalsANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_schools_hospitalsANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("schools_hospitalsANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######social_securityANDtemp_quart 
mydata <- social_securityANDtemp_quart
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/social_securityANDtemp_quart_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/socialsecurityANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_social_securityANDtemp_quart_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("social_securityANDtemp_quart buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######social_securityANDurban_exposures 
mydata <- social_securityANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/social_securityANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/socialsecurityANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_social_securityANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("social_securityANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######temp_quarterlyANDurban_exposures 
mydata <- temp_quarterlyANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/temp_quarterlyANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/temp_quarterlyANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_temp_quarterlyANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("temp_quarterlyANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()




###############################################################################
######incomeANDairpollution 

mydata <- incomeANDairpollution 
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDairpollution _buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDairpollution/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDairpollution_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDairpollution buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDtemp_quarterly 
mydata <- incomeANDtemp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDtemp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDtemp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDtemp_quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


###############################################################################
######incomeANDurban_exposures 
mydata <- incomeANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDcrops 
mydata <- incomeANDcrops
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDcrops_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDcrops/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDcrops_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDcrops buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDgreen_blue_space 
mydata <- incomeANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDgrey_space
mydata <- incomeANDgrey_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDgrey_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDgrey_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDgrey_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDgrey_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDroads_railways 
mydata <- incomeANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDsocialsecurity 
mydata <- incomeANDsocialsecurity
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDsocialsecurity_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDsocialsecurity_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDsocialsecurity buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDedu_level 
mydata <- incomeANDedu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDedu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDedu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDedu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDedu_level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDlivability 
mydata <- incomeANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDcrime 
mydata <- incomeANDcrime
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDcrime_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDcrime/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDcrime_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDcrime buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDschools_hospitals 
mydata <- incomeANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######incomeANDfood_facilities 
mydata <- incomeANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/incomeANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/incomeANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_incomeANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("incomeANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDairpollution 
mydata <- grey_spaceANDairpollution 
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDairpollution_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDairpollution/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDairpollution_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDairpollution buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDtemp_quarterly 
mydata <- grey_spaceANDtemp_quarterly
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDtemp_quarterly_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDtemp_quarterly/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDtemp_quarterly_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDtemp_quarterly buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDurban_exposures 
mydata <- grey_spaceANDurban_exposures
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDurban_exposures_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDurban_exposures/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDurban_exposures_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDurban_exposures buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDcrops 
mydata <- grey_spaceANDcrops
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDcrops_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDcrops/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDcrops_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDcrops buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDgreen_blue_space
mydata <- grey_spaceANDgreen_blue_space
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDgreen_blue_space_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDgreen_blue_space/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDgreen_blue_space_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDgreen_blue_space buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDroads_railways 
mydata <- grey_spaceANDroads_railways
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDroads_railways_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDroads_railways/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDroads_railways_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDroads_railways buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDsocialsecurity 
mydata <- grey_spaceANDsocialsecurity
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDsocialsecurity_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDsocialsecurity/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDsocialsecurity_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDsocialsecurity buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDedu_level 
mydata <- grey_spaceANDedu_level
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDedu_level_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDedu_level/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDedu_level_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDedu_level buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDincome 
mydata <- grey_spaceANDincome
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDincome_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDincome/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDincome_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDincome buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDlivability 
mydata <- grey_spaceANDlivability
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDlivability_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDlivability/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDlivability_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDlivability buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDcrime 
mydata <- grey_spaceANDcrime
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDcrime_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDcrime/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDcrime_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDcrime buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDschools_hospitals 
mydata <- grey_spaceANDschools_hospitals
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDschools_hospitals_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDschools_hospitals/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDschools_hospitals_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDschools_hospitals buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

###############################################################################
######grey_spaceANDfood_facilities
mydata <- grey_spaceANDfood_facilities
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/grey_spaceANDfood_facilities_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/grey_spaceANDfood_facilities/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_grey_spaceANDfood_facilities_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("grey_spaceANDfood_facilities buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()










###############################################################################
################TEMPLATE

mydata <- HERE
mydata <- na.omit(mydata)
nrow(mydata)
ncol(mydata)
cormat <- cor(mydata)
upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics
write.csv(melted_cormat, "model_versions/final_eu_analysis/pc_values/subgroups/HERE_buf_100m.csv")


setwd("model_versions/final_eu_analysis/heatmaps/subgroups/HERE/")

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Heatmap_HERE_buf_100m.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("HERE buffer size 100m")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()


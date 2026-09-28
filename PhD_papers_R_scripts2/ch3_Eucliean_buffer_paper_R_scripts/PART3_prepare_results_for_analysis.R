################### Preparation for Summary Statistics

#upload all p values from all euclidean buffer sizes

Eu_100m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_100m.csv")

Eu_250m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_250m.csv")

Eu_500m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_500m.csv")

Eu_1000m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_1000m.csv")


#upload network buffer values
NB_100m <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_100m.csv")

NB_250m <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_250m.csv")

NB_500m <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_500m.csv")

NB_1000m <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_1000m.csv")



##############TABLE WITH ALL P VALUES FROM ALL MODELS!

all_pvalues <- data.frame(NB_100m$Var1, NB_100m$Var2, NB_100m$value, NB_250m$value, NB_500m$value, NB_1000m$value)

names(all_pvalues)[names(all_pvalues) == "NB_100m.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "NB_100m.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "NB_100m.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "NB_250m.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "NB_500m.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "NB_1000m.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/networkbuffer_results/pc_values/ALL_NB_PCVALUES.csv")


#add environments and family to all_pvalues table

all_pvalues2 <- all_pvalues


#duplicate var 1 and var 2 columns and rename one column to "environmentvar1"and the other to "environmentvar2"
colnames(all_pvalues2)[colnames(all_pvalues2) == "NB_100m.Var1"] ="Var1"
colnames(all_pvalues2)[colnames(all_pvalues2) == "NB_100m.Var2"] ="Var2"

all_pvalues2$CategoryVar1 <- all_pvalues2$Var1
all_pvalues2$CategoryVar2 <- all_pvalues2$Var2

#replace values with appropiate catagory names for environmentvar1 and environmentvar2

#env1
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "NO2"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "PM2.5"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "PM10"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Ozone"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "BC"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "UFP"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_cu_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_fe_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_k_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_ni_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_s_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_si_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_v_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_zn_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_zn_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_si_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_k_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_fe_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_cu_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_mass_rf"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_cu_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_fe_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_k_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_ni_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_s_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_si_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_v_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_zn_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_zn_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_si_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_k_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_fe_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pmc_cu_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "pm25_mass_slr"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "temp_feb_2019"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "temp_may_2019"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "temp_aug_2019"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "temp_nov_2019"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "AllSound"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "TrafficNoise"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "UHI"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "NoghtLight"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "NightLightExpanse"] <- "physico_chem"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "cereals"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "artificial_land"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "root_crops"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "np_ind_crops"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "dp_v_f"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "fodder"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "b_arable"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "flowerbulbs"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "fruittrees"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "grains"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "maize"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "othercrops"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "potatoes"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "sugarbeets"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "MSAVI_ME300"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "NDVI_ME300"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Trees"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Parks"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "water"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "urbanity"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "popdensity"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Imp300m"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "major_roads"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "highways"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "main_railroad"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "railroad_lightrail_tram"] <- "built"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "SS84"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "SS83"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "SS85"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "SS86"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "EduLow"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "EduSec"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "EduHigh"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "AvIncmPIncRec"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "LowestIncmPcnt"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "HghstIncmPcnt"] <- "social" 
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Lvblty"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "PhyEnv"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "NsnceIncrty"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "SoCoh"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "Facilities"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "T_dest_vio"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "property_crm"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "T_theft"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "primaryschools"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "MBO"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "col_and_uni"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "hospitals"] <- "social"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "social_drinking"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "fastfood"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "coffee_and_desserts"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "fruit_vegstore"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "restaurant_bar_pub"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "tob_cofshp_shisha"] <- "food"
all_pvalues2$CategoryVar1[all_pvalues2$CategoryVar1 == "superandminimarket"] <- "food"



#env2
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "NO2"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "PM2.5"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "PM10"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Ozone"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "BC"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "UFP"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_cu_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_fe_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_k_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_ni_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_s_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_si_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_v_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_zn_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_zn_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_si_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_k_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_fe_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_cu_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_mass_rf"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_cu_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_fe_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_k_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_ni_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_s_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_si_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_v_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_zn_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_zn_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_si_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_k_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_fe_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pmc_cu_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "pm25_mass_slr"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "temp_feb_2019"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "temp_may_2019"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "temp_aug_2019"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "temp_nov_2019"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "AllSound"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "TrafficNoise"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "UHI"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "NoghtLight"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "NightLightExpanse"] <- "physico_chem"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "cereals"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "artificial_land"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "root_crops"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "np_ind_crops"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "dp_v_f"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "fodder"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "b_arable"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "flowerbulbs"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "fruittrees"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "grains"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "maize"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "othercrops"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "potatoes"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "sugarbeets"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "MSAVI_ME300"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "NDVI_ME300"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Trees"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Parks"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "water"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "urbanity"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "popdensity"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Imp300m"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "major_roads"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "highways"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "main_railroad"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "railroad_lightrail_tram"] <- "built"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "SS84"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "SS83"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "SS85"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "SS86"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "EduLow"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "EduSec"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "EduHigh"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "AvIncmPIncRec"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "LowestIncmPcnt"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "HghstIncmPcnt"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Lvblty"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "PhyEnv"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "NsnceIncrty"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "SoCoh"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "Facilities"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "T_dest_vio"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "property_crm"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "T_theft"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "primaryschools"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "MBO"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "col_and_uni"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "hospitals"] <- "social"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "social_drinking"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "fastfood"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "coffee_and_desserts"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "fruit_vegstore"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "restaurant_bar_pub"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "tob_cofshp_shisha"] <- "food"
all_pvalues2$CategoryVar2[all_pvalues2$CategoryVar2 == "superandminimarket"] <- "food"

head(all_pvalues2)

#add environments and family to all_pvalues table

all_pvalues3 <- all_pvalues2


#duplicate var 1 and var 2 columns and rename one column to "environmentvar1"and the other to "environmentvar2"
all_pvalues3$SubgroupVar1 <- all_pvalues3$CategoryVar1
all_pvalues3$SubgroupVar2 <- all_pvalues3$CategoryVar2

head(all_pvalues3)


############################################################
#subset all rows where enviroment1 == environment 2
#all_pvalues2_2 <- subset(all_pvalues2, env_var1 == env_var2)
#omit rows where var1 == var2
#all_pvalues2_3 <- all_pvalues2_2 %>% filter(env_var1 != env_var2)

#delete variable2
#all_pvalues2_4 <- subset(all_pvalues2_3, select = -env_var1)
#rename env_var1 to environment
#colnames(all_pvalues2_4)[5] = "environment"
###create family column
#create two columns: familyvar1 and familyvar2
#all_pvalues2_4$familyvar1 <- all_pvalues2_4$Var1
#all_pvalues2_4$familyvar2 <- all_pvalues2_4$Var2
#all_pvalues2_4 <- all_pvalues2
#all_pvalues2_4$familyvar1 <- all_pvalues2_4$variable1
#all_pvalues2_4$familyvar2 <- all_pvalues2_4$variable2
###################################################################

#run statements to fill them in

#var1
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NO2"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "PM2.5"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "PM10"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Ozone"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "BC"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "UFP"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_cu_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_fe_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_k_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_ni_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_s_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_si_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_v_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_zn_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_zn_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_si_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_k_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_fe_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_cu_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_mass_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_cu_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_fe_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_k_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_ni_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_s_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_si_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_v_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_zn_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_zn_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_si_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_k_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_fe_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pmc_cu_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "pm25_mass_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "temp_feb_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "temp_may_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "temp_aug_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "temp_nov_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "AllSound"] <- "urban_exposures"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "TrafficNoise"] <- "urban_exposures"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "UHI"] <- "urban_exposures"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NoghtLight"] <- "urban_exposures"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NightLightExpanse"] <- "urban_exposures"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "cereals"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "artificial_land"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "root_crops"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "np_ind_crops"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "dp_v_f"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "fodder"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "b_arable"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "flowerbulbs"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "fruittrees"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "grains"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "maize"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "othercrops"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "potatoes"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "sugarbeets"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "grassland"] <- "crops"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "MSAVI_ME300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "MSAVI_MD300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "MSAVI_ST300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NDVI_ME300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NDVI_MD300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NDVI_ST300"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Trees"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Parks"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "water"] <- "green_blue_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "urbanity"] <- "grey_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "popdensity"] <- "grey_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Imp300m"] <- "grey_space"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "major_roads"] <- "roads_railways"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "highways"] <- "roads_railways"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "main_railroad"] <- "roads_railways"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "railroad_lightrail_tram"] <- "roads_railways"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "SS84"] <- "social_security"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "SS83"] <- "social_security"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "SS85"] <- "social_security"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "SS86"] <- "social_security"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "EduLow"] <- "edu_level"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "EduSec"] <- "edu_level"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "EduHigh"] <- "edu_level"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "AvIncmPIncRec"] <- "income"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "LowestIncmPcnt"] <- "income"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "HghstIncmPcnt"] <- "income"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Lvblty"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "PhyEnv"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "NsnceIncrty"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "SoCoh"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "Facilities"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "HouseStock"] <- "livability"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "T_dest_vio"] <- "crime"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "property_crm"] <- "crime"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "T_theft"] <- "crime"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "primaryschools"] <- "schools_hospitals"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "MBO"] <- "schools_hospitals"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "col_and_uni"] <- "schools_hospitals"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "hospitals"] <- "schools_hospitals"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "social_drinking"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "fastfood"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "coffee_and_desserts"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "fruit_vegstore"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "restaurant_bar_pub"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "tob_cofshp_shisha"] <- "food"
all_pvalues3$SubgroupVar1[all_pvalues3$Var1 == "superandminimarket"] <- "food"



#var2
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NO2"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "PM2.5"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "PM10"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Ozone"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "BC"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "UFP"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_cu_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_fe_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_k_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_ni_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_s_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_si_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_v_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_zn_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_zn_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_si_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_k_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_fe_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_cu_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_mass_rf"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_cu_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_fe_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_k_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_ni_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_s_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_si_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_v_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_zn_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_zn_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_si_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_k_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_fe_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pmc_cu_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "pm25_mass_slr"] <- "air_pollution"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "temp_feb_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "temp_may_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "temp_aug_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "temp_nov_2019"] <- "quarterly_temp"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "AllSound"] <- "urban_exposures"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "TrafficNoise"] <- "urban_exposures"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "UHI"] <- "urban_exposures"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NoghtLight"] <- "urban_exposures"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NightLightExpanse"] <- "urban_exposures"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "cereals"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "artificial_land"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "root_crops"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "np_ind_crops"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "dp_v_f"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "fodder"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "b_arable"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "flowerbulbs"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "fruittrees"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "grains"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "maize"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "othercrops"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "potatoes"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "sugarbeets"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "grassland"] <- "crops"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "MSAVI_ME300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "MSAVI_MD300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "MSAVI_ST300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NDVI_ME300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NDVI_MD300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NDVI_ST300"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Trees"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Parks"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "water"] <- "green_blue_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "urbanity"] <- "grey_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "popdensity"] <- "grey_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Imp300m"] <- "grey_space"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "major_roads"] <- "roads_railways"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "highways"] <- "roads_railways"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "main_railroad"] <- "roads_railways"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "railroad_lightrail_tram"] <- "roads_railways"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "SS84"] <- "social_security"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "SS83"] <- "social_security"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "SS85"] <- "social_security"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "SS86"] <- "social_security"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "EduLow"] <- "edu_level"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "EduSec"] <- "edu_level"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "EduHigh"] <- "edu_level"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "AvIncmPIncRec"] <- "income"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "LowestIncmPcnt"] <- "income"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "HghstIncmPcnt"] <- "income"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Lvblty"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "PhyEnv"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "NsnceIncrty"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "SoCoh"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "Facilities"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "HouseStock"] <- "livability"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "T_dest_vio"] <- "crime"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "property_crm"] <- "crime"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "T_theft"] <- "crime"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "primaryschools"] <- "schools_hospitals"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "MBO"] <- "schools_hospitals"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "col_and_uni"] <- "schools_hospitals"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "hospitals"] <- "schools_hospitals"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "social_drinking"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "fastfood"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "coffee_and_desserts"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "fruit_vegstore"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "restaurant_bar_pub"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "tob_cofshp_shisha"] <- "food"
all_pvalues3$SubgroupVar2[all_pvalues3$Var2 == "superandminimarket"] <- "food"

head(all_pvalues3)

#save dataset
write.csv(all_pvalues3, "model_versions/networkbuffer_results/pc_values/NB_PCvalues_allsubgroups.csv")

all_pvalues4 <- all_pvalues3

#take out when variable1 == variable2
all_pvalues4 <- all_pvalues4 %>% filter(Var1 != Var2)

 

###subset to families
#will need to change:
# family_var = SubgroupVar

##air pollution
airpollution <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var2 == "air_pollution")
airpollution <- subset(airpollution, family_var1 == family_var2)
write.csv(airpollution, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/airpollution.csv")

##temperature quaterly
quarterly_temp <- subset(all_pvalues4, family_var1 == "quarterly_temp"|family_var2 == "quarterly_temp")
quarterly_temp <- subset(quarterly_temp, family_var1 == family_var2)
write.csv(quarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/quarterly_temp.csv")

##urban exposures
urban_exposures <- subset(all_pvalues4, family_var1 == "urban_exposures"| family_var2 == "urban_exposures")
urban_exposures <- subset(urban_exposures, family_var1 == family_var2)
write.csv(urban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/urban_exposures.csv")

##crops
crops<- subset(all_pvalues4, family_var1 == "crops"| family_var2 == "crops")
crops <- subset(crops, family_var1 == family_var2)
write.csv(crops, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/crops.csv")

##green and blue space
green_blue_space<- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var2 == "green_blue_space")
green_blue_space <- subset(green_blue_space, family_var1 == family_var2)
write.csv(green_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/green_blue_space.csv")

##grey space
grey_space <- subset(all_pvalues4, family_var1 == "grey_space"|family_var2 == "grey_space")
grey_space <- subset(grey_space, family_var1 == family_var2)
write.csv(grey_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/grey_space.csv")

##roads and railways
roads_railways<- subset(all_pvalues4, family_var1 == "roads_railways"| family_var2 == "roads_railways")
roads_railways <- subset(roads_railways, family_var1 == family_var2)
write.csv(roads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/roads_railways.csv")

##social security
social_security<- subset(all_pvalues4, family_var1 == "social_security"|family_var2 == "social_security")
social_security <- subset(social_security, family_var1 == family_var2)
write.csv(social_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/social_security.csv")

##education level
edu_level <- subset(all_pvalues4, family_var1 == "edu_level"|family_var2 == "edu_level")
edu_level <- subset(edu_level, family_var1 == family_var2)
write.csv(edu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/edu_level.csv")

##income
income <- subset(all_pvalues4, family_var1 == "income"|family_var2 == "income")
income <- subset(income, family_var1 == family_var2)
write.csv(income, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/income.csv")

##livability
livability <- subset(all_pvalues4, family_var1 == "livability"| family_var2 == "livability")
livability <- subset(livability, family_var1 == family_var2)
write.csv(livability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/livability.csv")

##crime
crime <- subset(all_pvalues4, family_var1 == "crime"|family_var2 == "crime")
crime <- subset(crime, family_var1 == family_var2)
write.csv(crime, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/crime.csv")

##schools and hospitals
schools_hospitals<- subset(all_pvalues4, family_var1 == "schools_hospitals"|family_var2 == "schools_hospitals")
schools_hospitals <- subset(schools_hospitals, family_var1 == family_var2)
write.csv(schools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/schools_hospitals.csv")

##food facilities
food <- subset(all_pvalues4, family_var1 == "food" | family_var2 == "food")
food <- subset(food, family_var1 == family_var2)
write.csv(food, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/within/food.csv")






###################################################################
##################################################################
##########BETWEEN

air_pollutionANDcrime <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "crime")
air_pollutionANDcrime <- subset(air_pollutionANDcrime, family_var2 == "air_pollution"|family_var2 == "crime")
write.csv(air_pollutionANDcrime, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDcrime.csv")


#air_pollutionANDcrops
air_pollutionANDcrops <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "crops")
air_pollutionANDcrops <- subset(air_pollutionANDcrops, family_var2 == "air_pollution"|family_var2 == "crops")
write.csv(air_pollutionANDcrops, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDcrops.csv")


#air_pollutionANDedu_level
air_pollutionANDedu_level <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "edu_level")
air_pollutionANDedu_level <- subset(air_pollutionANDedu_level, family_var2 == "air_pollution"|family_var2 == "edu_level")
write.csv(air_pollutionANDedu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDedu_level.csv")

#air_pollutionANDfood
air_pollutionANDfood <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "food")
air_pollutionANDfood <- subset(air_pollutionANDfood, family_var2 == "air_pollution"|family_var2 == "food")
write.csv(air_pollutionANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDfood.csv")

#air_pollutionANDgreen_blue_space
air_pollutionANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "green_blue_space")
air_pollutionANDgreen_blue_space <- subset(air_pollutionANDgreen_blue_space, family_var2 == "air_pollution"|family_var2 == "green_blue_space")
write.csv(air_pollutionANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDgreen_blue_space.csv")

#air_pollutionANDlivability
air_pollutionANDlivability <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "livability")
air_pollutionANDlivability <- subset(air_pollutionANDlivability, family_var2 == "air_pollution"|family_var2 == "livability")
write.csv(air_pollutionANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDlivability.csv")

#air_pollutionANDroads_railways
air_pollutionANDroads_railways <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "roads_railways")
air_pollutionANDroads_railways <- subset(air_pollutionANDroads_railways, family_var2 == "air_pollution"|family_var2 == "roads_railways")
write.csv(air_pollutionANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDroads_railways.csv")

#air_pollutionANDschools_hospitals
air_pollutionANDschools_hospitals <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "schools_hospitals")
air_pollutionANDschools_hospitals <- subset(air_pollutionANDschools_hospitals, family_var2 == "air_pollution"|family_var2 == "schools_hospitals")
write.csv(air_pollutionANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDschools_hospitals.csv")

#air_pollutionANDsocial_security
air_pollutionANDsocial_security <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "social_security")
air_pollutionANDsocial_security <- subset(air_pollutionANDsocial_security, family_var2 == "air_pollution"|family_var2 == "social_security")
write.csv(air_pollutionANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDsocial_security.csv")

#air_pollutionANDquarterly_temp
air_pollutionANDquarterly_temp <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "quarterly_temp")
air_pollutionANDquarterly_temp <- subset(air_pollutionANDquarterly_temp, family_var2 == "air_pollution"|family_var2 == "quarterly_temp")
write.csv(air_pollutionANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDquarterly_temp.csv")

#air_pollutionANDurban_exposures
air_pollutionANDurban_exposures <- subset(all_pvalues4, family_var1 == "air_pollution"|family_var1 == "urban_exposures")
air_pollutionANDurban_exposures <- subset(air_pollutionANDurban_exposures, family_var2 == "air_pollution"|family_var2 == "urban_exposures")
write.csv(air_pollutionANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/air_pollutionANDurban_exposures.csv")

#crimeANDcrops
crimeANDcrops <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "crops")
crimeANDcrops <- subset(crimeANDcrops, family_var2 == "crime"|family_var2 == "crops")
write.csv(crimeANDcrops, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDcrops.csv")

#crimeANDedu_level
crimeANDedu_level <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "edu_level")
crimeANDedu_level <- subset(crimeANDedu_level, family_var2 == "crime"|family_var2 == "edu_level")
write.csv(crimeANDedu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDedu_level.csv")

#crimeANDfood
crimeANDfood <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "food")
crimeANDfood <- subset(crimeANDfood, family_var2 == "crime"|family_var2 == "food")
write.csv(crimeANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDfood.csv")

#crimeANDgreen_blue_space
crimeANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "green_blue_space")
crimeANDgreen_blue_space <- subset(crimeANDgreen_blue_space, family_var2 == "crime"|family_var2 == "green_blue_space")
write.csv(crimeANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDgreen_blue_space.csv")

#crimeANDlivability
crimeANDlivability <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "livability")
crimeANDlivability <- subset(crimeANDlivability, family_var2 == "crime"|family_var2 == "livability")
write.csv(crimeANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDlivability.csv")

#crimeANDroads_railways
crimeANDroads_railways <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "roads_railways")
crimeANDroads_railways <- subset(crimeANDroads_railways, family_var2 == "crime"|family_var2 == "roads_railways")
write.csv(crimeANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDroads_railways.csv")

#crimeANDschools_hospitals
crimeANDschools_hospitals <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "schools_hospitals")
crimeANDschools_hospitals <- subset(crimeANDschools_hospitals, family_var2 == "crime"|family_var2 == "schools_hospitals")
write.csv(crimeANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDschools_hospitals.csv")

#crimeANDsocial_security
crimeANDsocial_security <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "social_security")
crimeANDsocial_security <- subset(crimeANDsocial_security, family_var2 == "crime"|family_var2 == "social_security")
write.csv(crimeANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDsocial_security.csv")

#crimeANDtemp_quart
crimeANDquarterly_temp <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "quarterly_temp")
crimeANDquarterly_temp <- subset(crimeANDquarterly_temp, family_var2 == "crime"|family_var2 == "quarterly_temp")
write.csv(crimeANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDquarterly_temp.csv")

#crimeANDurban_exposures
crimeANDurban_exposures <- subset(all_pvalues4, family_var1 == "crime"|family_var1 == "urban_exposures")
crimeANDurban_exposures <- subset(crimeANDurban_exposures, family_var2 == "crime"|family_var2 == "urban_exposures")
write.csv(crimeANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/crimeANDurban_exposures.csv")

#cropsANDANDedu_level
cropsANDedu_level <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "edu_level")
cropsANDedu_level <- subset(cropsANDedu_level, family_var2 == "crops"|family_var2 == "edu_level")
write.csv(cropsANDedu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDedu_level.csv")

#cropsANDfood
cropsANDfood <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "food")
cropsANDfood <- subset(cropsANDfood, family_var2 == "crops"|family_var2 == "food")
write.csv(cropsANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDfood.csv")

#cropsANDgreen_blue_space
cropsANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "green_blue_space")
cropsANDgreen_blue_space <- subset(cropsANDgreen_blue_space, family_var2 == "crops"|family_var2 == "green_blue_space")
write.csv(cropsANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDgreen_blue_space.csv")

#cropsANDlivability
cropsANDlivability <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "livability")
cropsANDlivability <- subset(cropsANDlivability, family_var2 == "crops"|family_var2 == "livability")
write.csv(cropsANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDlivability.csv")

#cropsANDroads_railways
cropsANDroads_railways <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "roads_railways")
cropsANDroads_railways <- subset(cropsANDroads_railways, family_var2 == "crops"|family_var2 == "roads_railways")
write.csv(cropsANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDroads_railways.csv")

#cropsANDschools_hospitals
cropsANDschool_hospitals <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "schools_hospitals")
cropsANDschool_hospitals <- subset(cropsANDschool_hospitals, family_var2 == "crops"|family_var2 == "schools_hospitals")
write.csv(cropsANDschool_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDschool_hospitals.csv")

#cropsANDsocial_security
cropsANDsocial_security <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "social_security")
cropsANDsocial_security <- subset(cropsANDsocial_security, family_var2 == "crops"|family_var2 == "social_security")
write.csv(cropsANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDsocial_security.csv")

#cropsANDtemp_quart
cropsANDquarterly_temp <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "quarterly_temp")
cropsANDquarterly_temp <- subset(cropsANDquarterly_temp, family_var2 == "crops"|family_var2 == "quarterly_temp")
write.csv(cropsANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDquarterly_temp.csv")

#cropsANDurban_exposures
cropsANDurban_exposures <- subset(all_pvalues4, family_var1 == "crops"|family_var1 == "urban_exposures")
cropsANDurban_exposures <- subset(cropsANDurban_exposures, family_var2 == "crops"|family_var2 == "urban_exposures")
write.csv(cropsANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/cropsANDurban_exposures.csv")

#edu_levelANDfood
edu_levelANDfood <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "food")
edu_levelANDfood <- subset(edu_levelANDfood, family_var2 == "edu_level"|family_var2 == "food")
write.csv(edu_levelANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDfood.csv")

#edu_levelANDgreen_blue_space
edu_levelANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "green_blue_space")
edu_levelANDgreen_blue_space <- subset(edu_levelANDgreen_blue_space, family_var2 == "edu_level"|family_var2 == "green_blue_space")
write.csv(edu_levelANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDgreen_blue_space.csv")

#edu_levelANDlivability
edu_levelANDlivability <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "livability")
edu_levelANDlivability <- subset(edu_levelANDlivability, family_var2 == "edu_level"|family_var2 == "livability")
write.csv(edu_levelANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDlivability.csv")

#edu_levelANDroads_railways
edu_levelANDroads_railways <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "roads_railways")
edu_levelANDroads_railways <- subset(edu_levelANDroads_railways, family_var2 == "edu_level"|family_var2 == "roads_railways")
write.csv(edu_levelANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDroads_railways.csv")

#edu_levelANDschools_hospitals
edu_levelANDschools_hospitals <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "schools_hospitals")
edu_levelANDschools_hospitals <- subset(edu_levelANDschools_hospitals, family_var2 == "edu_level"|family_var2 == "schools_hospitals")
write.csv(edu_levelANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDschools_hospitals.csv")

#edu_levelANDsocial_security
edu_levelANDsocial_security <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "social_security")
edu_levelANDsocial_security <- subset(edu_levelANDsocial_security, family_var2 == "edu_level"|family_var2 == "social_security")
write.csv(edu_levelANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDsocial_security.csv")

#edu_levelANDquarterly_temp
edu_levelANDquarterly_temp <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "quarterly_temp")
edu_levelANDquarterly_temp <- subset(edu_levelANDquarterly_temp, family_var2 == "edu_level"|family_var2 == "quarterly_temp")
write.csv(edu_levelANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDquarterly_temp.csv")

#edu_levelANDurban_exposures
edu_levelANDurban_exposures <- subset(all_pvalues4, family_var1 == "edu_level"|family_var1 == "urban_exposures")
edu_levelANDurban_exposures <- subset(edu_levelANDurban_exposures, family_var2 == "edu_level"|family_var2 == "urban_exposures")
write.csv(edu_levelANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/edu_levelANDurban_exposures.csv")

#foodANDgreen_blue_space
foodANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "green_blue_space")
foodANDgreen_blue_space <- subset(foodANDgreen_blue_space, family_var2 == "food"|family_var2 == "green_blue_space")
write.csv(foodANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDgreen_blue_space.csv")

#foodANDlivability
foodANDlivability <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "livability")
foodANDlivability <- subset(foodANDlivability, family_var2 == "food"|family_var2 == "livability")
write.csv(foodANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDlivability.csv")

#foodANDroads_railways
foodANDroads_railways <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "roads_railways")
foodANDroads_railways <- subset(foodANDroads_railways, family_var2 == "food"|family_var2 == "roads_railways")
write.csv(foodANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDroads_railways.csv")

#foodANDschools_hospitals
foodANDschools_hospitals <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "schools_hospitals")
foodANDschools_hospitals <- subset(foodANDschools_hospitals, family_var2 == "food"|family_var2 == "schools_hospitals")
write.csv(foodANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDschools_hospitals.csv")

#foodANDsocial_security
foodANDsocial_security <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "social_security")
foodANDsocial_security <- subset(foodANDsocial_security, family_var2 == "food"|family_var2 == "social_security")
write.csv(foodANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDsocial_security.csv")

#foodANDquarterly_temp
foodANDquarterly_temp <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "quarterly_temp")
foodANDquarterly_temp <- subset(foodANDquarterly_temp, family_var2 == "food"|family_var2 == "quarterly_temp")
write.csv(foodANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDquarterly_temp.csv")

#foodANDurban_exposures
foodANDurban_exposures <- subset(all_pvalues4, family_var1 == "food"|family_var1 == "urban_exposures")
foodANDurban_exposures <- subset(foodANDurban_exposures, family_var2 == "food"|family_var2 == "urban_exposures")
write.csv(foodANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/foodANDurban_exposures.csv")

#green_blue_spaceANDlivability
green_blue_spaceANDlivability <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "livability")
green_blue_spaceANDlivability <- subset(green_blue_spaceANDlivability, family_var2 == "green_blue_space"|family_var2 == "livability")
write.csv(green_blue_spaceANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDlivability.csv")

#green_blue_spaceANDroads_railways
green_blue_spaceANDroads_railways <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "roads_railways")
green_blue_spaceANDroads_railways <- subset(green_blue_spaceANDroads_railways, family_var2 == "green_blue_space"|family_var2 == "roads_railways")
write.csv(green_blue_spaceANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDroads_railways.csv")

#green_blue_spaceANDschools_hospitals
green_blue_spaceANDschools_hospitals <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "schools_hospitals")
green_blue_spaceANDschools_hospitals <- subset(green_blue_spaceANDschools_hospitals, family_var2 == "green_blue_space"|family_var2 == "schools_hospitals")
write.csv(green_blue_spaceANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDschools_hospitals.csv")

#green_blue_spaceANDsocial_security
green_blue_spaceANDsocial_security <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "social_security")
green_blue_spaceANDsocial_security <- subset(green_blue_spaceANDsocial_security, family_var2 == "green_blue_space"|family_var2 == "social_security")
write.csv(green_blue_spaceANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDsocial_security.csv")

#green_blue_spaceANDtemp_quart
green_blue_spaceANDquarterly_temp <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "quarterly_temp")
green_blue_spaceANDquarterly_temp <- subset(green_blue_spaceANDquarterly_temp, family_var2 == "green_blue_space"|family_var2 == "quarterly_temp")
write.csv(green_blue_spaceANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDquarterly_temp.csv")

#green_blue_spaceANDurban_exposures
green_blue_spaceANDurban_exposures <- subset(all_pvalues4, family_var1 == "green_blue_space"|family_var1 == "urban_exposures")
green_blue_spaceANDurban_exposures <- subset(green_blue_spaceANDurban_exposures, family_var2 == "green_blue_space"|family_var2 == "urban_exposures")
write.csv(green_blue_spaceANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/green_blue_spaceANDurban_exposures.csv")

#grey_spaceANDair_pollution
grey_spaceANDair_pollution <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "air_pollution")
grey_spaceANDair_pollution <- subset(grey_spaceANDair_pollution, family_var2 == "grey_space"|family_var2 == "air_pollution")
write.csv(grey_spaceANDair_pollution, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDair_pollution.csv")

#grey_spaceANDcrime
grey_spaceANDcrime <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "crime")
grey_spaceANDcrime <- subset(grey_spaceANDcrime, family_var2 == "grey_space"|family_var2 == "crime")
write.csv(grey_spaceANDcrime, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDcrime.csv")

#grey_spaceANDcrops
grey_spaceANDcrops <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "crops")
grey_spaceANDcrops <- subset(grey_spaceANDcrops, family_var2 == "grey_space"|family_var2 == "crops")
write.csv(grey_spaceANDcrops, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDcrops.csv")

#grey_spaceANDedu_level
grey_spaceANDedu_level <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "edu_level")
grey_spaceANDedu_level <- subset(grey_spaceANDedu_level, family_var2 == "grey_space"|family_var2 == "edu_level")
write.csv(grey_spaceANDedu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDedu_level.csv")

#grey_spaceANDfood
grey_spaceANDfood <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "food")
grey_spaceANDfood <- subset(grey_spaceANDfood, family_var2 == "grey_space"|family_var2 == "food")
write.csv(grey_spaceANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDfood.csv")

#grey_spaceANDgreen_blue_space
grey_spaceANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "green_blue_space")
grey_spaceANDgreen_blue_space <- subset(grey_spaceANDgreen_blue_space, family_var2 == "grey_space"|family_var2 == "green_blue_space")
write.csv(grey_spaceANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDgreen_blue_space.csv")

#grey_spaceANDincome
grey_spaceANDincome <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "income")
grey_spaceANDincome <- subset(grey_spaceANDincome, family_var2 == "grey_space"|family_var2 == "income")
write.csv(grey_spaceANDincome, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDincome.csv")

#grey_spaceANDlivability
grey_spaceANDlivability <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "livability")
grey_spaceANDlivability <- subset(grey_spaceANDlivability, family_var2 == "grey_space"|family_var2 == "livability")
write.csv(grey_spaceANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDlivability.csv")

#grey_spaceANDroads_railways
grey_spaceANDroads_railways <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "roads_railways")
grey_spaceANDroads_railways <- subset(grey_spaceANDroads_railways, family_var2 == "grey_space"|family_var2 == "roads_railways")
write.csv(grey_spaceANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDroads_railways.csv")

#grey_spaceANDschools_hospitals
grey_spaceANDschools_hospitals <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "schools_hospitals")
grey_spaceANDschools_hospitals <- subset(grey_spaceANDschools_hospitals, family_var2 == "grey_space"|family_var2 == "schools_hospitals")
write.csv(grey_spaceANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDschools_hospitals.csv")

#grey_spaceANDsocial_security
grey_spaceANDsocial_security <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "social_security")
grey_spaceANDsocial_security <- subset(grey_spaceANDsocial_security, family_var2 == "grey_space"|family_var2 == "social_security")
write.csv(grey_spaceANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDsocial_security.csv")

#grey_spaceANDquarterly_temp
grey_spaceANDquarterly_temp <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "quarterly_temp")
grey_spaceANDquarterly_temp <- subset(grey_spaceANDquarterly_temp, family_var2 == "grey_space"|family_var2 == "quarterly_temp")
write.csv(grey_spaceANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDquarterly_temp.csv")

#grey_spaceANDurban_exposures
grey_spaceANDurban_exposures <- subset(all_pvalues4, family_var1 == "grey_space"|family_var1 == "urban_exposures")
grey_spaceANDurban_exposures <- subset(grey_spaceANDurban_exposures, family_var2 == "grey_space"|family_var2 == "urban_exposures")
write.csv(grey_spaceANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/grey_spaceANDurban_exposures.csv")

#incomeANDair_pollution
incomeANDair_pollution <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "air_pollution")
incomeANDair_pollution <- subset(incomeANDair_pollution, family_var2 == "income"|family_var2 == "air_pollution")
write.csv(incomeANDair_pollution, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDair_pollution.csv")

#incomeANDcrime
incomeANDcrime <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "crime")
incomeANDcrime <- subset(incomeANDcrime, family_var2 == "income"|family_var2 == "crime")
write.csv(incomeANDcrime, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDcrime.csv")

#incomeANDcrops
incomeANDcrops <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "crops")
incomeANDcrops <- subset(incomeANDcrops, family_var2 == "income"|family_var2 == "crops")
write.csv(incomeANDcrops, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDcrops.csv")

#incomeANDedu_level
incomeANDedu_level <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "edu_level")
incomeANDedu_level <- subset(incomeANDedu_level, family_var2 == "income"|family_var2 == "edu_level")
write.csv(incomeANDedu_level, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDedu_level.csv")

#incomeANDfood
incomeANDfood <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "food")
incomeANDfood <- subset(incomeANDfood, family_var2 == "income"|family_var2 == "food")
write.csv(incomeANDfood, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDfood.csv")

#incomeANDgreen_blue_space
incomeANDgreen_blue_space <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "green_blue_space")
incomeANDgreen_blue_space <- subset(incomeANDgreen_blue_space, family_var2 == "income"|family_var2 == "green_blue_space")
write.csv(incomeANDgreen_blue_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDgreen_blue_space.csv")

#incomeANDgrey_space
incomeANDgrey_space <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "grey_space")
incomeANDgrey_space <- subset(incomeANDgrey_space, family_var2 == "income"|family_var2 == "grey_space")
write.csv(incomeANDgrey_space, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDgrey_space.csv")

#incomeANDlivability
incomeANDlivability <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "livability")
incomeANDlivability <- subset(incomeANDlivability, family_var2 == "income"|family_var2 == "livability")
write.csv(incomeANDlivability, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDlivability.csv")

#incomeANDroads_railways
incomeANDroads_railways <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "roads_railways")
incomeANDroads_railways <- subset(incomeANDroads_railways, family_var2 == "income"|family_var2 == "roads_railways")
write.csv(incomeANDroads_railways, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDroads_railways.csv")

#incomeANDschools_hospitals
incomeANDschools_hospitals <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "schools_hospitals")
incomeANDschools_hospitals <- subset(incomeANDschools_hospitals, family_var2 == "income"|family_var2 == "schools_hospitals")
write.csv(incomeANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDschools_hospitals.csv")

#incomeANDsocial_security
incomeANDsocial_security <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "social_security")
incomeANDsocial_security <- subset(incomeANDsocial_security, family_var2 == "income"|family_var2 == "social_security")
write.csv(incomeANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDsocial_security.csv")

#incomeANDquarterly_temp
incomeANDquarterly_temp <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "quarterly_temp")
incomeANDquarterly_temp <- subset(incomeANDquarterly_temp, family_var2 == "income"|family_var2 == "quarterly_temp")
write.csv(incomeANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDquarterly_temp.csv")

#incomeANDurban_exposures
incomeANDurban_exposures <- subset(all_pvalues4, family_var1 == "income"|family_var1 == "urban_exposures")
incomeANDurban_exposures <- subset(incomeANDurban_exposures, family_var2 == "income"|family_var2 == "urban_exposures")
write.csv(incomeANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/incomeANDurban_exposures.csv")

#livabilityANDroads_railways
livabilityANDroads_railroads <- subset(all_pvalues4, family_var1 == "livability"|family_var1 == "roads_railways")
livabilityANDroads_railroads <- subset(livabilityANDroads_railroads, family_var2 == "livability"|family_var2 == "roads_railways")
write.csv(livabilityANDroads_railroads, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/livabilityANDroads_railroads.csv")

#livabilityANDschools_hospitals
livabilityANDschools_hospitals <- subset(all_pvalues4, family_var1 == "livability"|family_var1 == "schools_hospitals")
livabilityANDschools_hospitals <- subset(livabilityANDschools_hospitals, family_var2 == "livability"|family_var2 == "schools_hospitals")
write.csv(livabilityANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/livabilityANDschools_hospitals.csv")

#livabilityANDsocial_security
livabilityANDsocial_security <- subset(all_pvalues4, family_var1 == "livability"|family_var1 == "social_security")
livabilityANDsocial_security <- subset(livabilityANDsocial_security, family_var2 == "livability"|family_var2 == "social_security")
write.csv(livabilityANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between_tables/livabilityANDsocial_security.csv")

#livabilityANDtemp_quart
livabilityANDquarterly_temp <- subset(all_pvalues4, family_var1 == "livability"|family_var1 == "quarterly_temp")
livabilityANDquarterly_temp <- subset(livabilityANDquarterly_temp, family_var2 == "livability"|family_var2 == "quarterly_temp")
write.csv(livabilityANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/livabilityANDquarterly_temp.csv")

#livabilityANDurban_exposures
livabilityANDurban_exposures <- subset(all_pvalues4, family_var1 == "livability"|family_var1 == "urban_exposures")
livabilityANDurban_exposures <- subset(livabilityANDurban_exposures, family_var2 == "livability"|family_var2 == "urban_exposures")
write.csv(livabilityANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/livabilityANDurban_exposures.csv")

#roads_railwaysANDschools_hospitals
roads_railwaysANDschools_hospitals <- subset(all_pvalues4, family_var1 == "roads_railways"|family_var1 == "schools_hospitals")
roads_railwaysANDschools_hospitals <- subset(roads_railwaysANDschools_hospitals, family_var2 == "roads_railways"|family_var2 == "schools_hospitals")
write.csv(roads_railwaysANDschools_hospitals, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/roads_railwaysANDschools_hospitals.csv")

#roads_railwaysANDsocial_security
roads_railwaysANDsocial_security <- subset(all_pvalues4, family_var1 == "roads_railways"|family_var1 == "social_security")
roads_railwaysANDsocial_security <- subset(roads_railwaysANDsocial_security, family_var2 == "roads_railways"|family_var2 == "social_security")
write.csv(roads_railwaysANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/roads_railwaysANDsocial_security.csv")

#roads_railwaysANDtemp_quart
roads_railwaysANDquarterly_temp <- subset(all_pvalues4, family_var1 == "roads_railways"|family_var1 == "quarterly_temp")
roads_railwaysANDquarterly_temp <- subset(roads_railwaysANDquarterly_temp, family_var2 == "roads_railways"|family_var2 == "quarterly_temp")
write.csv(roads_railwaysANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/roads_railwaysANDquarterly_temp.csv")

#roads_railwaysANDurban_exposures
roads_railwaysANDurban_exposures <- subset(all_pvalues4, family_var1 == "roads_railways"|family_var1 == "urban_exposures")
roads_railwaysANDurban_exposures <- subset(roads_railwaysANDurban_exposures, family_var2 == "roads_railways"|family_var2 == "urban_exposures")
write.csv(roads_railwaysANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/roads_railwaysANDurban_exposures.csv")

#schools_hospitalsANDsocial_security
schools_hospitalsANDsocial_security <- subset(all_pvalues4, family_var1 == "schools_hospitals"|family_var1 == "social_security")
schools_hospitalsANDsocial_security <- subset(schools_hospitalsANDsocial_security, family_var2 == "schools_hospitals"|family_var2 == "social_security")
write.csv(schools_hospitalsANDsocial_security, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/schools_hospitalsANDsocial_security.csv")

#schools_hospitalsANDtemp_quart
schools_hospitalsANDquarterly_temp <- subset(all_pvalues4, family_var1 == "schools_hospitals"|family_var1 == "quarterly_temp")
schools_hospitalsANDquarterly_temp <- subset(schools_hospitalsANDquarterly_temp, family_var2 == "schools_hospitals"|family_var2 == "quarterly_temp")
write.csv(schools_hospitalsANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/schools_hospitalsANDquarterly_temp.csv")

#schools_hospitalsANDurban_exposures
schools_hospitalsANDurban_exposures <- subset(all_pvalues4, family_var1 == "schools_hospitals"|family_var1 == "urban_exposures")
schools_hospitalsANDurban_exposures <- subset(schools_hospitalsANDurban_exposures, family_var2 == "schools_hospitals"|family_var2 == "urban_exposures")
write.csv(schools_hospitalsANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/schools_hospitalsANDurban_exposures.csv")

#social_securityANDtemp_quart
social_securityANDquarterly_temp <- subset(all_pvalues4, family_var1 == "social_security"|family_var1 == "quarterly_temp")
social_securityANDquarterly_temp <- subset(social_securityANDquarterly_temp, family_var2 == "social_security"|family_var2 == "quarterly_temp")
write.csv(social_securityANDquarterly_temp, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/social_securityANDquarterly_temp.csv")

#social_securityANDurban_exposures
social_securityANDurban_exposures <- subset(all_pvalues4, family_var1 == "social_security"|family_var1 == "urban_exposures")
social_securityANDurban_exposures <- subset(social_securityANDurban_exposures, family_var2 == "social_security"|family_var2 == "urban_exposures")
write.csv(social_securityANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/social_securityANDurban_exposures.csv")

#quarterly_tempANDurban_exposures
quarterly_tempANDurban_exposures <- subset(all_pvalues4, family_var1 == "quarterly_temp"|family_var1 == "urban_exposures")
quarterly_tempANDurban_exposures <- subset(quarterly_tempANDurban_exposures, family_var2 == "quarterly_temp"|family_var2 == "urban_exposures")
write.csv(quarterly_tempANDurban_exposures, "model_versions/final_eu_analysis/pc_values/subgroups_heatscales/between/quarterly_tempANDurban_exposures.csv")



###################################

#select all pc values over 0.7
all_pvalues_morethan_0.7 <- subset(all_pvalues4, all_pvalues4$`NB_100m.value` > 0.7| all_pvalues4$`NB_250m.value` > 0.7|all_pvalues4$`NB_500m.value` > 0.7|all_pvalues4$`NB_1000m.value` > 0.7)

write.csv(all_pvalues_morethan_0.7, "model_versions/networkbuffer_results/pc_values/morethan_0.7/NB_all_pvalues_morethan_0.7.csv")

#select all pc values less than -0.7
all_pvalues_lessthan_0.7 <- subset(all_pvalues4, all_pvalues4$`NB_100m.value` < -0.7| all_pvalues4$`NB_250m.value` < -0.7|all_pvalues4$`NB_500m.value` < -0.7|all_pvalues4$`NB_1000m.value` < -0.7)

write.csv(all_pvalues_lessthan_0.7, "model_versions/networkbuffer_results/pc_values/lessthan_neg0.7/NB_all_pvalues_lessthan_0.7.csv")


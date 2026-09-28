##################################Core concepts catagorization for PC values from euclidean buffer analysis

###upload PC data
PC_data <- read.csv("model_versions/final_eu_analysis/ALL_PCVALUES.csv")
nrow(PC_data)

###take out all EFs correlated with themselves
PC_data2 <-subset(PC_data, PC_data$variable1 != PC_data$variable2)
nrow(PC_data2)

##################add another column catagorizing the heatscale pattern

#a = always increasing
#b = always decreasing
#c = stays the same
#d = increases and then decreases
#e = decreases and then increases


###writing the code

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue')] <- "increasing"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue')]<- "decreasing"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') == abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') == abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') == abs(PC_data2$'X1000m_pvalue')] <- "no change"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue')] <- "increases and then decreases"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue')] <- "increases and then decreases"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue')] <- "decreases and then increases"

PC_data2$Pattern[abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue')] <- "decreases and then increases"


PC_data2

###another way?
PC_data2$Pattern<- with(PC_data2, ifelse(abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue'), "increasing",
                             ifelse(abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue'), "decreasing",
                             ifelse(abs(PC_data2$'X100m_pvalue') == abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') == abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') == abs(PC_data2$'X1000m_pvalue'), "no change", 
                             ifelse(abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue'), "increases and then decreases", 
                             ifelse(abs(PC_data2$'X100m_pvalue') < abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') > abs(PC_data2$'X1000m_pvalue'), "increases and then decreases",
                             ifelse(abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') > abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue'), "decreases and then increases",
                             ifelse(abs(PC_data2$'X100m_pvalue') > abs(PC_data2$'X250m_pvalue') |abs(PC_data2$'X250m_pvalue') < abs(PC_data2$'X500m_pvalue')| abs(PC_data2$'X500m_pvalue') < abs(PC_data2$'X1000m_pvalue'), "decreases and then increases", NA_character_ ))))))))


PC_data2


###list core concept type for each EF


##add two extra columns in dataframe, label core concept type

#for variable 1
PC_data2$SpatTemp_var1[PC_data2$variable1=="NO2"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="PM2.5"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="PM10"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Ozone"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="BC"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="UFP"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_cu_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_fe_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_k_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_ni_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_s_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_si_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_v_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_zn_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pmc_cu_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pmc_fe_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pmc_k_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pmc_si_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pmc_zn_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="pm25_mass_slr"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="temp_feb_2019"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="temp_may_2019"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="temp_aug_2019"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="temp_nov_2019"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="AllSound"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="TrafficNoise"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="UHI"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="NightLightExpanse"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="grassland"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="cereals"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="artificial_land"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="root_crops"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="np_ind_crops"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="dp_v_f"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="fodder"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="b_arable"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="flowerbulbs"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="fruittrees"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="grains"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="maize"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="othercrops"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="potatoes"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="sugarbeets"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="MSAVI_ME300"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="NDVI_ME300"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Trees"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="water"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Parks"] <- "coverage"
PC_data2$SpatTemp_var1[PC_data2$variable1=="urbanity"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="popdensity"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Imp300m"] <- "field_raster"
PC_data2$SpatTemp_var1[PC_data2$variable1=="major_roads"] <- "network"
PC_data2$SpatTemp_var1[PC_data2$variable1=="highways"] <- "network"
PC_data2$SpatTemp_var1[PC_data2$variable1=="main_railroad"] <- "network"
PC_data2$SpatTemp_var1[PC_data2$variable1=="railroad_lightrail_tram"] <- "network"
PC_data2$SpatTemp_var1[PC_data2$variable1=="SS84"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="SS83"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="SS85"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="SS86"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="EduLow"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="EduSec"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="EduHigh"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="AvIncmPIncRec"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="LowestIncmPcnt"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="HghstIncmPcnt"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Lvblty"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Nsncelncrty"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="SoCoh"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="Facilities"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="PhyEnv"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="T_dest_vio"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="property_crm"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="T_theft"] <- "lattice"
PC_data2$SpatTemp_var1[PC_data2$variable1=="primaryschools"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="MBO"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="col_and_uni"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="hospitals"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="social_drinking"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="fastfood"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="coffee_and_desserts"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="fruit_vegstore"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="restaurant_bar_pub"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="tob_cofshp_shisha"] <- "object_points"
PC_data2$SpatTemp_var1[PC_data2$variable1=="superandminimarket"] <- "object_points"

#for variable 2
PC_data2$SpatTemp_var2[PC_data2$variable2=="NO2"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="PM2.5"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="PM10"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Ozone"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="BC"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="UFP"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_cu_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_fe_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_k_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_ni_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_s_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_si_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_v_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_zn_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pmc_cu_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pmc_fe_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pmc_k_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pmc_si_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pmc_zn_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="pm25_mass_slr"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="temp_feb_2019"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="temp_may_2019"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="temp_aug_2019"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="temp_nov_2019"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="AllSound"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="TrafficNoise"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="UHI"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="NightLightExpanse"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="grassland"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="cereals"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="artificial_land"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="root_crops"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="np_ind_crops"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="dp_v_f"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="fodder"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="b_arable"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="flowerbulbs"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="fruittrees"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="grains"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="maize"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="othercrops"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="potatoes"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="sugarbeets"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="MSAVI_ME300"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="NDVI_ME300"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Trees"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="water"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Parks"] <- "coverage"
PC_data2$SpatTemp_var2[PC_data2$variable2=="urbanity"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="popdensity"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Imp300m"] <- "field_raster"
PC_data2$SpatTemp_var2[PC_data2$variable2=="major_roads"] <- "network"
PC_data2$SpatTemp_var2[PC_data2$variable2=="highways"] <- "network"
PC_data2$SpatTemp_var2[PC_data2$variable2=="main_railroad"] <- "network"
PC_data2$SpatTemp_var2[PC_data2$variable2=="railroad_lightrail_tram"] <- "network"
PC_data2$SpatTemp_var2[PC_data2$variable2=="SS84"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="SS83"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="SS85"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="SS86"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="EduLow"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="EduSec"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="EduHigh"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="AvIncmPIncRec"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="LowestIncmPcnt"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="HghstIncmPcnt"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Lvblty"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Nsncelncrty"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="SoCoh"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="Facilities"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="PhyEnv"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="T_dest_vio"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="property_crm"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="T_theft"] <- "lattice"
PC_data2$SpatTemp_var2[PC_data2$variable2=="primaryschools"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="MBO"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="col_and_uni"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="hospitals"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="social_drinking"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="fastfood"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="coffee_and_desserts"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="fruit_vegstore"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="restaurant_bar_pub"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="tob_cofshp_shisha"] <- "object_points"
PC_data2$SpatTemp_var2[PC_data2$variable2=="superandminimarket"] <- "object_points"

na.omit(PC_data2)
nrow(PC_data2)




##add columns spatial resolution of variables

PC_data2$spat_resolution_var1[PC_data2$variable1=="NO2"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="PM2.5"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="PM10"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Ozone"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="BC"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="UFP"] <- "1000x1000"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_cu_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_fe_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_k_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_ni_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_s_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_si_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_v_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_zn_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pmc_cu_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pmc_fe_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pmc_k_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pmc_si_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pmc_zn_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="pm25_mass_slr"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="temp_feb_2019"] <- "1000x1000"
PC_data2$spat_resolution_var1[PC_data2$variable1=="temp_may_2019"] <- "1000x1000"
PC_data2$spat_resolution_var1[PC_data2$variable1=="temp_aug_2019"] <- "1000x1000"
PC_data2$spat_resolution_var1[PC_data2$variable1=="temp_nov_2019"] <- "1000x1000"
PC_data2$spat_resolution_var1[PC_data2$variable1=="AllSound"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="TrafficNoise"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="UHI"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="NightLightExpanse"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="grassland"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="cereals"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="artificial_land"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="root_crops"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="np_ind_crops"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="dp_v_f"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="fodder"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="b_arable"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="flowerbulbs"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="fruittrees"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="grains"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="maize"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="othercrops"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="potatoes"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="sugarbeets"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="MSAVI_ME300"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="NDVI_ME300"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Trees"] <- "10x10"
PC_data2$spat_resolution_var1[PC_data2$variable1=="water"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Parks"] <- "27.366x27.366"
PC_data2$spat_resolution_var1[PC_data2$variable1=="urbanity"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="popdensity"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Imp300m"] <- "100x100"
PC_data2$spat_resolution_var1[PC_data2$variable1=="major_roads"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="highways"] <- "25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="main_railroad"] <- "27.366x27.366"
PC_data2$spat_resolution_var1[PC_data2$variable1=="railroad_lightrail_tram"] <- "27.366x27.366"
PC_data2$spat_resolution_var1[PC_data2$variable1=="SS84"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="SS83"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="SS85"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="SS86"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="EduLow"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="EduSec"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="EduHigh"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="AvIncmPIncRec"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="LowestIncmPcnt"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="HghstIncmPcnt"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Lvblty"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Nsncelncrty"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="SoCoh"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="Facilities"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="PhyEnv"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="T_dest_vio"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="property_crm"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="T_theft"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var1[PC_data2$variable1=="primaryschools"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="MBO"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="col_and_uni"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="hospitals"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="social_drinking"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="fastfood"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="coffee_and_desserts"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="fruit_vegstore"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="restaurant_bar_pub"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="tob_cofshp_shisha"] <- "NA"
PC_data2$spat_resolution_var1[PC_data2$variable1=="superandminimarket"] <- "NA"


#variable 2
PC_data2$spat_resolution_var2[PC_data2$variable2=="NO2"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="PM2.5"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="PM10"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Ozone"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="BC"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="UFP"] <- "1000x1000"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_cu_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_fe_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_k_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_ni_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_s_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_si_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_v_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_zn_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pmc_cu_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pmc_fe_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pmc_k_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pmc_si_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pmc_zn_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="pm25_mass_slr"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="temp_feb_2019"] <- "1000x1000"
PC_data2$spat_resolution_var2[PC_data2$variable2=="temp_may_2019"] <- "1000x1000"
PC_data2$spat_resolution_var2[PC_data2$variable2=="temp_aug_2019"] <- "1000x1000"
PC_data2$spat_resolution_var2[PC_data2$variable2=="temp_nov_2019"] <- "1000x1000"
PC_data2$spat_resolution_var2[PC_data2$variable2=="AllSound"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="TrafficNoise"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="UHI"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="NightLightExpanse"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="grassland"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="cereals"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="artificial_land"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="root_crops"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="np_ind_crops"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="dp_v_f"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="fodder"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="b_arable"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="flowerbulbs"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="fruittrees"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="grains"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="maize"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="othercrops"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="potatoes"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="sugarbeets"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="MSAVI_ME300"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="NDVI_ME300"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Trees"] <- "10x10"
PC_data2$spat_resolution_var2[PC_data2$variable2=="water"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Parks"] <- "27.366x27.366"
PC_data2$spat_resolution_var2[PC_data2$variable2=="urbanity"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="popdensity"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Imp300m"] <- "100x100"
PC_data2$spat_resolution_var2[PC_data2$variable2=="major_roads"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="highways"] <- "25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="main_railroad"] <- "27.366x27.366"
PC_data2$spat_resolution_var2[PC_data2$variable2=="railroad_lightrail_tram"] <- "27.366x27.366"
PC_data2$spat_resolution_var2[PC_data2$variable2=="SS84"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="SS83"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="SS85"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="SS86"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="EduLow"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="EduSec"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="EduHigh"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="AvIncmPIncRec"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="LowestIncmPcnt"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="HghstIncmPcnt"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Lvblty"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Nsncelncrty"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="SoCoh"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="Facilities"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="PhyEnv"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="T_dest_vio"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="property_crm"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="T_theft"] <- "vector:wijk,raster25x25"
PC_data2$spat_resolution_var2[PC_data2$variable2=="primaryschools"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="MBO"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="col_and_uni"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="hospitals"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="social_drinking"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="fastfood"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="coffee_and_desserts"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="fruit_vegstore"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="restaurant_bar_pub"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="tob_cofshp_shisha"] <- "NA"
PC_data2$spat_resolution_var2[PC_data2$variable2=="superandminimarket"] <- "NA"

na.omit(PC_data2)
nrow(PC_data2)

head(PC_data2)

###save data
write.csv(PC_data2, "model_versions/final_eu_analysis/All_PCVALUES2.csv")




###################################

#select all pc values over 0.7
all_pvalues_morethan_0.7 <- subset(PC_data2, PC_data2$'X100m_pvalue'> 0.7|PC_data2$'X250m_pvalue' > 0.7|PC_data2$'X500m_pvalue' > 0.7|PC_data2$'X1000m_pvalue' > 0.7)

write.csv(all_pvalues_morethan_0.7, "model_versions/final_eu_analysis/significant_pc_values/all_pc_values_morethan_0.7_2.csv")

#select all pc values less than -0.7
all_pvalues_lessthan_0.7 <- subset(PC_data2, PC_data2$'X100m_pvalue'< -0.7|PC_data2$'X250m_pvalue' < -0.7|PC_data2$'X500m_pvalue' < -0.7|PC_data2$'X1000m_pvalue' < -0.7)

write.csv(all_pvalues_lessthan_0.7, "model_versions/final_eu_analysis/significant_pc_values/all_pc_values_lessthan_neg0.7_2.csv")

head(all_pvalues_lessthan_0.7)


summary(all_pvalues_morethan_0.7)





##########################NEW VERSION 1##############################

pcdata <- read.csv("model_versions/final_eu_analysis/All_PCVALUES2.csv")

#little to no change = 0 - 0.1
#increase = increase of at least 0.1 between 100 and 1000 m 
#decrease = decrease of at least -0.1 between  100m and 1000,
#sudden increase = increase of 0.2 or more between 100m and 250m 
#sudden decrease = decrease of 0.2 or more between 100m and 250m 


#little to no change = 0 - 0.1
pcdata$Pattern[(pcdata$'X1000m_pvalue' - pcdata$'X100m_pvalue' <= 0.1) |abs(pcdata$'X1000m_pvalue') - (abs(pcdata$'X100m_pvalue') <= 0.1)] <- "little to no change"


#increase = increase of at least 0.1 between 100 and 1000 m 

pcdata$Pattern[abs(pcdata$'X250m_pvalue' - pcdata$'X100m_pvalue' > 0.1) && abs(pcdata$'X500m_pvalue' - pcdata$'X250m_pvalue' > 0.1) && abs(pcdata$'X1000m_pvalue' - pcdata$'X500m_pvalue' > 0.1)] <- "increase"

#sudden increase = increase of 0.2 or more between 100m and 250m 
pcdata$Pattern[abs(pcdata$'X250m_pvalue' - pcdata$'X100m_pvalue' > 0.3) && abs(pcdata$'X500m_pvalue' - pcdata$'X250m_pvalue' >= 0.1) && abs(pcdata$'X1000m_pvalue' - pcdata$'X500m_pvalue' >= 0.1)] <- "sudden increase"

#sudden decrease = decrease of 0.2 or more between 100m and 250m 
pcdata$Pattern[abs(pcdata$'X250m_pvalue' - pcdata$'X100m_pvalue' > 0.1) && abs(pcdata$'X500m_pvalue' - pcdata$'X250m_pvalue' >= 0.3) && abs(pcdata$'X1000m_pvalue' - pcdata$'X500m_pvalue' >= 0.1)] <- "sudden increase"

head(pcdata)

write.csv(pcdata, "model_versions/final_eu_analysis/pcdata_and_patterns.csv")

#############




#########################################NEW VERSION##############################################3

sig_pc_values <- read.csv("model_versions/final_eu_analysis/significant_pc_values/table_version_of_results/significant_pc_values_r_version.csv", sep = ';')

head(sig_pc_values)

analysis <- 1:52

EF <- c("NO2","PM2.5","BC","pm25_cu_slr","pm25_fe_slr","pm25_k_slr", "pm25_s_slr", "pm25_ni_slr", "pm25_v_slr", "pm25_si_slr","pm25_zn_slr","pmc_si_slr","pmc_fe_slr","pmc_cu_slr","pm25_mass_slr","temp_may_2019","temp_feb_2019", "temp_aug_2019","temp_nov_2019", "AllSound", "TrafficNoise","UHI","NightLightExpanse","flowerbulbs", "fodder","grassland","MSAVI_ME300", "NDVI_ME300", "popdensity", "major_roads", "main_railroad","AvIncmPIncRec", "urbanity","NsnceIncrty","UFP","Imp300m","railroad_lightrail_tram","EduHigh","T_dest_vio","property_crm","T_theft","col_and_uni", "MBO","Ozone","EduLow","EduSec","EduHigh","HghstIncmPcnt", "LowestIncmPcnt","SS83","SoCoh","Facilities")


EF_var1 <- subset(sig_pc_values, sig_pc_values$?..variable1 == "PM2.5")
EF_var1 %>% count(EF_var1$Pattern)
EF_var2 <- subset(sig_pc_values, sig_pc_values$variable2 == "PM2.5")
EF_var2 %>% count(EF_var2$Pattern)


#############################################################################################3
###########MERGING TOGETHER ALL NEIGHBORHOOD MODEL RESULTS


###Upload parks and landuse results 

allgreen <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/allgreen_pcnt_buurt.csv")

allgreen_blue <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/allgreen_blue_pcnt_buurt.csv")

recreational <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/recreation_area_pcnt_buurt.csv")

recreational_blue <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/recreation_area_blue_pcnt_buurt.csv")

forestandnatural <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/forestandnatural_pcnt_buurt.csv")

forestandnatural_blue <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/forestandnatural_blue_pcnt_buurt.csv")

agricultural <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/agricultural_pcnt_buurt.csv")

agricultural_blue <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/agricultural_blue_pcnt_buurt.csv")

parks <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/parks_pcnt_buurt.csv")

parks_blue <- read.csv("neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/parks_blue_pcnt_buurt.csv")

#upload NDVI and treeheight results 

NDVI_treeheight <- st_read("neighborhood_model_results/neighborhoods_with_treeheight.shp")


head(NDVI_treeheight)

#select only relevant columns
NDVI_treeheight <- subset(NDVI_treeheight, select = c(buurtcd, buurtnm, wijkcod, gementc, gementn, jrsttcd, POLY_AR, men_ndv, mn_ndv_, mn_trh_, mn_trhg, geometry))

#rename columns
names(NDVI_treeheight)[names(NDVI_treeheight) == 'buurtcd'] <- 'neighborhood_id'
names(NDVI_treeheight)[names(NDVI_treeheight) == 'men_ndv'] <- 'NDVI_mean'
names(NDVI_treeheight)[names(NDVI_treeheight) == 'mn_ndv_'] <- 'NDVI_blue_mean'
names(NDVI_treeheight)[names(NDVI_treeheight) == 'mn_trh_'] <- 'treeheight_blue_mean'
names(NDVI_treeheight)[names(NDVI_treeheight) == 'mn_trhg'] <- 'treeheight_mean'

NDVI_treeheight$treeheight_blue_mean <- NDVI_treeheight$treeheight_blue_mean * 100

#rearrange column order
NDVI_treeheight <- NDVI_treeheight[,c(1,2,3,4,5,6,7,8,9,11,10,12)]

#round values
NDVI_treeheight$NDVI_mean <- round(NDVI_treeheight$NDVI_mean, 4)
NDVI_treeheight$NDVI_blue_mean <- round(NDVI_treeheight$NDVI_blue_mean, 4)
NDVI_treeheight$treeheight_mean <- round(NDVI_treeheight$treeheight_mean, 4)
NDVI_treeheight$treeheight_blue_mean <- round(NDVI_treeheight$treeheight_blue_mean, 4)

buurt_model_results <- NDVI_treeheight


###join datasets of All_NDVI_treeheight_meanvals

buurt_model_results<- buurt_model_results %>%
  left_join(allgreen %>% select(neighborhood_id, allgreen_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(allgreen_blue %>% select(neighborhood_id, allgreen_blue_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(recreational %>% select(neighborhood_id, recreation_area_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(recreational_blue %>% select(neighborhood_id, recreation_area_blue_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(forestandnatural %>% select(neighborhood_id, forestandnatural_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(forestandnatural_blue %>% select(neighborhood_id, forestandnatural_blue_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(agricultural %>% select(neighborhood_id, agricultural_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(agricultural_blue %>% select(neighborhood_id, agricultural_blue_pcnt), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(parks %>% select(neighborhood_id, parks_percentage), by = "neighborhood_id")

buurt_model_results<- buurt_model_results %>%
  left_join(parks_blue %>% select(neighborhood_id, parks_blue_pcnt), by = "neighborhood_id")

head(buurt_model_results)
colnames(buurt_model_results)

#rename columns
names(buurt_model_results)[names(buurt_model_results) == 'parks_percentage'] <- 'parks_pcnt'
#names(buurt_model_results)[names(buurt_model_results) == 'old'] <- 'NEW'


#create a code for shapefile column names
names(buurt_model_results)[names(buurt_model_results) == 'NDVI_mean'] <- 'rslt1'
names(buurt_model_results)[names(buurt_model_results) == 'NDVI_blue_mean'] <- 'rslt2'
names(buurt_model_results)[names(buurt_model_results) == 'treeheight_mean'] <- 'rslt3'
names(buurt_model_results)[names(buurt_model_results) == 'treeheight_blue_mean'] <- 'rslt4'
names(buurt_model_results)[names(buurt_model_results) == 'allgreen_pcnt'] <- 'rslt5'
names(buurt_model_results)[names(buurt_model_results) == 'allgreen_blue_pcnt'] <- 'rslt6'
names(buurt_model_results)[names(buurt_model_results) == 'recreation_area_pcnt'] <- 'rslt7'
names(buurt_model_results)[names(buurt_model_results) == 'recreation_area_blue_pcnt'] <- 'rslt8'
names(buurt_model_results)[names(buurt_model_results) == 'forestandnatural_pcnt'] <- 'rslt9'
names(buurt_model_results)[names(buurt_model_results) == 'forestandnatural_blue_pcnt'] <- 'rslt10'
names(buurt_model_results)[names(buurt_model_results) == 'agricultural_pcnt'] <- 'rslt11'
names(buurt_model_results)[names(buurt_model_results) == 'agricultural_blue_pcnt'] <- 'rslt12'
names(buurt_model_results)[names(buurt_model_results) == 'parks_pcnt'] <- 'rslt13'
names(buurt_model_results)[names(buurt_model_results) == 'parks_blue_pcnt'] <- 'rslt14'


#save data
st_write(buurt_model_results, "neighborhood_model_results_NEW/neighborhood_model_all_results3.shp")

#drop geometry
buurt_model_results_nogeo <- sf::st_drop_geometry(buurt_model_results)

write.csv(buurt_model_results_nogeo, "neighborhood_model_results_NEW/neighborhood_model_all_results.csv" )



###match BAG residential address to a neighborhood id with all the information from buurt_model_results

#upload neighborhood results

buurt_results <- st_read("neighborhood_model_results_NEW/neighborhood_model_all_results3.shp")

head(buurt_results)

#upload BAG data
BAG <- st_read("DATA/AMIGO_data/AMIGO_points_UPDATED.shp")





# Perform a spatial join (points inherit neighborhood attributes)
BAG_joined <- st_join(BAG, buurt_model_results)

head(BAG_joined)

# Optionally, save the new point shapefile with neighborhood attributes
st_write(BAG_joined, "neighborhood_model_results_NEW/FINAL_RESULTS/AMIGO_with_buurt_data.shp")

write.csv(BAG_joined, "neighborhood_model_results_NEW/FINAL_RESULTS/AMIGO_with_buurt_data.csv")



#############################################################################################################
###prepare final data


AMIGO_buurt <- read.csv("neighborhood_model_results_NEW/FINAL_RESULTS/AMIGO_with_buurt_data.csv")

#drop unwanted columns
AMIGO_buurt <- AMIGO_buurt[ , !(names(AMIGO_buurt) %in% c("neighborhood_id", "buurtnm", "wijkcod", "gementc")) ]

#rename columns
names(AMIGO_buurt)[names(AMIGO_buurt) == 'gementn'] <- 'brtcod'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'jrsttcd'] <- 'NB_area'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'POLY_AR'] <- 'N_NDVI_mean'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt1'] <-  'N_NDVI_bl_mean' 
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt2'] <-  'N_th_mean'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt3'] <-  'N_th_bl_mean'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt4'] <- 'N_allgreen_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt5'] <- 'N_allgreen_bl_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt6'] <- 'N_rctn_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt7'] <- 'N_rctn_bl_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt8'] <- 'N_fandn_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt9'] <- 'N_fandn_bl_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt10'] <- 'N_agri_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt11' ] <- 'N_agri_bl_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt12' ] <- 'N_parks_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt13'] <- 'N_parks_bl_pcnt'
names(AMIGO_buurt)[names(AMIGO_buurt) == 'rslt14'] <- 'geometry'

head(AMIGO_buurt)

#select relevant columns
AMIGO_buurt <- select(AMIGO_buurt, Field1,file_name, geoid, fid_, brtcod, NB_area, N_NDVI_mean, N_NDVI_bl_mean, N_th_mean, N_th_bl_mean, N_allgreen_pcnt, N_allgreen_bl_pcnt, N_rctn_pcnt, N_rctn_bl_pcnt, N_fandn_pcnt, N_fandn_bl_pcnt, N_agri_pcnt, N_agri_bl_pcnt, N_parks_pcnt, N_parks_bl_pcnt)

nrow(AMIGO_buurt)

###rounds results
colnames(AMIGO_buurt)
AMIGO_buurt[7:20] <- round(AMIGO_buurt[7:20], 2)

AMIGO_buurt$NB_area <- NULL


write.csv(AMIGO_buurt, "model_results/neighborhood_model/AMIGO_with_buurt_data.csv")



#########################################################################################################
######################################################################################################
#######SCRIPT FOR JOINING NEIGHBORHOOD MODEL RESULTS TO THE AMIGO RESIDENTIAL ADDRESS DATA



###upload data

#neighborhood results
buurt_results <- st_read("neighborhood_model_all_results3.shp")

#AMIGO data
AMIGO <- st_read("")



###Perform a spatial join (AMIGO points inherit neighborhood attributes)
AMIGO_joined <- st_join(AMIGO, buurt_results)


###rename columns containing results to clearer names
names(AMIGO_joined)[names(AMIGO_joined) == rslt1] <- 'NDVI_mean'
names(AMIGO_joined)[names(AMIGO_joined) == rslt2] <- 'NDVI_blue_mean'
names(AMIGO_joined)[names(AMIGO_joined) == rslt3] <- 'treeheight_mean'
names(AMIGO_joined)[names(AMIGO_joined) == rslt4] <- 'treeheight_blue_mean'
names(AMIGO_joined)[names(AMIGO_joined) == rslt5] <- 'allgreen_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt6] <- 'allgreen_blue_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt7] <- 'recreation_area_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt8] <- 'recreation_area_blue_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt9] <- 'forestandnatural_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt10] <- 'forestandnatural_blue_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt11] <- 'agricultural_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt12] <- 'agricultural_blue_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt13] <- 'parks_pcnt'
names(AMIGO_joined)[names(AMIGO_joined) == rslt14] <- 'parks_blue_pcnt'



#save as csv (geometry can be dropped but a fake ID for AMIGO points must be made/kept)
write.csv(AMIGO_joined, "")


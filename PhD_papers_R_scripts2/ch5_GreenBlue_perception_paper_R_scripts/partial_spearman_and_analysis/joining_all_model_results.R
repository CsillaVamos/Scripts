###############################################################################################
##########JOINING ALL MODEL RESULTS


######upload results

###viewshed 20m results
VS_20m_NDVI <- read.csv("exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI.csv")

VS_20m_NDVI_bl <- read.csv("exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI_blue.csv")

VS_20m_TH <- read.csv("exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight.csv")

VS_20m_TH_bl <- read.csv("exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight_blue.csv")


###viewshed 50m results
VS_50m_NDVI <- read.csv("exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_NDVI.csv")

VS_50m_NDVI_bl <- read.csv("exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_NDVI_blue.csv")

VS_50m_TH <- read.csv("exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_treeheight.csv")

VS_50m_TH_bl <- read.csv("exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_treeheight_blue.csv")

###viewshed 150m results 
VS_150m_NDVI <- read.csv("exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_NDVI.csv")

VS_150m_NDVI_bl <- read.csv("exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_NDVI_blue.csv")

VS_150m_TH <- read.csv("exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_treeheight.csv")

VS_150m_TH_bl <- read.csv("exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_treeheight_blue.csv")


###all neighborhood results
NB <- read.csv("model_results/neighborhood_model/AMIGO_with_buurt_data.csv")

###distance to the nearest allgreen space
D_allgreen <- read.csv("Distance_to_the_nearest_model_results/results/results_combined/D_allgreen.csv")

###distance to the nearest allgreen_blue space
D_allgreen_bl <- read.csv("Distance_to_the_nearest_model_results/results/results_combined/D_allgreen_bl.csv")



############################################################################################
######################COMBINE RESULTS


################################################################################################3
#####COMBINE VS_20m
###
###Subset VS_20m_NDVI_bl to only the necessary columns
VS_20m_NDVI_bl_subset <- VS_20m_NDVI_bl[c("file_name", "VS_20m_mean_NDVI_bl")]
head(VS_20m_NDVI_bl_subset)
VS_20m_NDVI_bl_subset <-  VS_20m_NDVI_bl_subset[!duplicated(VS_20m_NDVI_bl_subset), ]
nrow(VS_20m_NDVI_bl_subset)

###Merge with VS_20m_mean_NDVI
VS_20m_combined <- merge(VS_20m_NDVI, VS_20m_NDVI_bl_subset, by = "file_name", all.x = TRUE)
nrow(VS_20m_combined)
###
# Subset VS_20m_TH to only the necessary columns
VS_20m_TH_subset <- VS_20m_TH[c("file_name", "VS_20m_mean_TH")]

# Merge with final_results
VS_20m_combined <- merge(VS_20m_combined, VS_20m_TH_subset, by = "file_name", all.x = TRUE)

###
# Subset VS_20m_TH to only the necessary columns
VS_20m_TH_bl_subset <- VS_20m_TH_bl[c("file_name", "VS_20m_mean_TH_bl")]

# Merge with final_results
VS_20m_combined <- merge(VS_20m_combined, VS_20m_TH_bl_subset, by = "file_name", all.x = TRUE)

write.csv(VS_20m_combined, "VS_20m_results.csv")



##########################################################################
#####COMBINE VS_50m
###
###Subset VS_50m_NDVI_bl to only the necessary columns
VS_50m_NDVI_bl_subset <- VS_50m_NDVI_bl[c("file_name", "VS_50m_mean_NDVI_bl")]
head(VS_50m_NDVI_bl_subset)
VS_50m_NDVI_bl_subset <-  VS_50m_NDVI_bl_subset[!duplicated(VS_50m_NDVI_bl_subset), ]
nrow(VS_50m_NDVI_bl_subset)

###Merge with VS_50m_mean_NDVI
VS_50m_combined <- merge(VS_50m_NDVI, VS_50m_NDVI_bl_subset, by = "file_name", all.x = TRUE)
nrow(VS_50m_combined)
###
# Subset VS_50m_TH to only the necessary columns
VS_50m_TH_subset <- VS_50m_TH[c("file_name", "VS_50m_mean_TH")]

# Merge with final_results
VS_50m_combined <- merge(VS_50m_combined, VS_50m_TH_subset, by = "file_name", all.x = TRUE)

###
# Subset VS_50m_TH to only the necessary columns
VS_50m_TH_bl_subset <- VS_50m_TH_bl[c("file_name", "VS_50m_mean_TH_bl")]

# Merge with final_results
VS_50m_combined <- merge(VS_50m_combined, VS_50m_TH_bl_subset, by = "file_name", all.x = TRUE)

write.csv(VS_50m_combined, "VS_50m_results.csv")




#########################################################################################3
######VS_150m

###
# Subset VS_150m_NDVI_bl to only the necessary columns
VS_150m_NDVI_bl_subset <- VS_150m_NDVI_bl[c("file_name", "VS_150m_mean_NDVI_bl")]

# Merge with VS_150m_mean_NDVI
VS_150m_combined <- merge(VS_150m_NDVI, VS_150m_NDVI_bl_subset, by = "file_name", all.x = TRUE)

###
# Subset VS_150m_TH to only the necessary columns
VS_150m_TH_subset <- VS_150m_TH[c("file_name", "VS_150m_mean_TH")]

# Merge with final_results
VS_150m_combined <- merge(VS_150m_combined, VS_150m_TH_subset, by = "file_name", all.x = TRUE)

###
# Subset VS_150m_TH to only the necessary columns
VS_150m_TH_bl_subset <- VS_150m_TH_bl[c("file_name", "VS_150m_mean_TH_bl")]

# Merge with final_results
VS_150m_combined <- merge(VS_150m_combined, VS_150m_TH_bl_subset, by = "file_name", all.x = TRUE)

write.csv(VS_150m_combined, "VS_150m_results.csv")


#########################################################################################3
######Combine all distance to the nearest results

head(D_allgreen)

# Merge 
D_combined <- merge(D_allgreen, D_allgreen_bl, by = "geoid", all.x = TRUE)
head(D_combined)
nrow(D_combined)



write.csv(D_combined, "D_results.csv")


######################################################################################################
#######COMBINE ALL RESULTS VERSION 2

AMIGO <- read.csv("AMIGO_data/AMIGO_Updated.csv")

VS_50m <- read.csv("exposure_results/50m_buffer_results/50m_buffer_results_combined/All_results_combined.csv", sep = ";")
VS_150m <- read.csv("exposure_results/150m_buffer_results/150m_buffer_results_combined/all_results_combined.csv", sep = ";")

head(VS_150m)

#merge VS_50m and VS_150m
VS_50m_2 <- VS_50m[!duplicated(VS_50m$file_name), ]
nrow(VS_50m_2)
VS <- merge(VS_50m_2, VS_150m, by = "file_name")
VS_2 <-  VS[!duplicated(VS), ]
nrow(VS)
head(VS)

#merge VS and AMIGO
AMIGO_VS <- merge(AMIGO, VS, by = "file_name")
nrow(AMIGO_VS)
head(AMIGO_VS)



#merge AMIGO_VS and NB
NB2 <- subset(NB, select = -geoid)
head(NB2)
names(NB2)[names(NB2) == 'file_name'] <- 'geoid'
AMIGO_NB <- merge(AMIGO, NB2, by = "geoid")
nrow(AMIGO_NB)

#merge AMIGO_VS_NB and D
AMIGO_NB_D <- merge(AMIGO_NB, D_combined, by = "geoid")

head(AMIGO_NB_D)
nrow(AMIGO_NB_D)


###
#merge AMIGO and VS
AMIGO_VS_NB_D <- merge(AMIGO_NB_D, AMIGO_VS, by = "geoid")
nrow(AMIGO_VS_NB_D)
head(AMIGO_VS_NB_D)

#delete unwanted columns
final_results <- AMIGO_VS_NB_D[ , !(names(AMIGO_VS_NB_D) %in% c("X.1.x", "X.x", "Y.x", "X.y","brtcod", "Field1", "fid_", "file_name.y", "X.1.y", "fid.y", "hsn.y", "zip.y", "X", "Y.y" )) ]

head(final_results)
nrow(final_results)





###################MERGE WITH EUCLIDEAN BUFFER DATA
Eubuffer <- read.csv("Euclidean_buffer_model_results/All_Eu_buffer_results.csv")

nrow(Eubuffer)

nrow(final_results)

final_results2 <- merge(final_results, Eubuffer, by = "geoid")


nrow(final_results2)
head(final_results2)

#delete unwanted columns
final_results2 <- final_results2[ , !(names(final_results2) %in% c("X.x.x", "X.y.x", "X.x.y", "X.y.y")) ]

head(final_results2)
nrow(final_results2)

#rename column names
names(final_results2)[names(final_results2) == 'file_name.x'] <- 'file_name'
names(final_results2)[names(final_results2) == 'fid.x'] <- 'fid'
names(final_results2)[names(final_results2) == 'hsn.x'] <- 'hsn'
names(final_results2)[names(final_results2) == 'zip.x'] <- 'zip'


write.csv(final_results2, "RESULTS/model_results_AMIGO_VS_NB_D_E.csv")













################################################################################################
###############################################################################
#merge AMIGO and first part of Eu buffer data


results_AMIGO_VS_NB_D <- read.csv("C://Users/vamos003/OneDrive - Universiteit Utrecht/Data_to_use_for_PhD/PhD_data_ALL_THE_ENV_FACTORS/FOURTH_PAPER/RESULTS/model_results_AMIGO_VS_NB_D.csv")



E_600m_parks_bl_pnct <- read.csv("D://FOURTH_PAPER/Euclidean_buffer_model_results/600m/parks_bl_pcnt_600mbuffer.csv")

names(E_600m_parks_bl_pnct)[names(E_600m_parks_bl_pnct) == 'parks_and_water_pcnt'] <- 'E_600m_parks_bl_pnct'

results <- merge(results_AMIGO_VS_NB_D , E_600m_parks_bl_pnct, by = "geoid")
nrow(results)
head(results)

#delete unwanted columns
final_results <- results[ , !(names(results) %in% c("X.1.x", "X.x", "Y.x", "X.y","brtcod", "Field1", "fid_", "file_name.y", "X.1.y", "fid.y", "hsn.y", "zip.y", "X", "Y.y" )) ]

head(final_results)
nrow(final_results)

###
#merge AMIGO and first part of Eu buffer data
E_600m_rec_bl_pnct <- read.csv("D://FOURTH_PAPER/Euclidean_buffer_model_results/600m/rec_bl_pcnt_600mbuffer.csv")

head(E_600m_rec_bl_pnct)
nrow(E_600m_rec_bl_pnct)

names(E_600m_rec_bl_pnct)[names(E_600m_rec_bl_pnct) == 'LU_rec_and_water_pcnt'] <- 'E_600m_rec_bl_pnct'

results <- merge(final_results , E_600m_rec_bl_pnct, by = "geoid")
nrow(results)
head(results)

#delete unwanted columns
final_results <- results[ , !(names(results) %in% c("X.1.x", "X.x", "Y.x", "X.y","brtcod", "Field1", "fid_", "file_name.y", "X.1.y", "fid.y", "hsn.y", "zip.y", "X", "Y.y" )) ]


#merge AMIGO and first part of Eu buffer data
E_600m_TH_bl_pnct <- read.csv("D://FOURTH_PAPER/Euclidean_buffer_model_results/600m/rec_bl_pcnt_600mbuffer.csv")

head(E_600m_TH_bl_pnct)
nrow(E_600m_TH_bl_pnct)

names(E_600m_TH_bl_pnct)[names(E_600m_TH_bl_pnct) == 'treeheightblue_val'] <- 'E_600m_TH_bl_pnct'

results <- merge(results , E_600m_rec_bl_pnct, by = "geoid")
nrow(results)
head(results)

#delete unwanted columns
results <- results[ , !(names(results) %in% c("X.1.x", "X.x", "Y.x", "X.y","brtcod", "Field1", "fid_", "file_name.y", "X.1.y", "fid.y", "hsn.y", "zip.y", "X", "Y.y" )) ]




write.csv(results, "C://Users/vamos003/OneDrive - Universiteit Utrecht/Data_to_use_for_PhD/PhD_data_ALL_THE_ENV_FACTORS/FOURTH_PAPER/RESULTS/model_results_AMIGO_VS_NB_D_someE.csv")




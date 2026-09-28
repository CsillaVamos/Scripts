#########################################3


alleubuff <- read.csv("Data/All_Eu_buffer_results.csv")
D_allgreen <- read.csv("Distance_to_the_nearest_model_results/results/results_combined/D_allgreen.csv")

head(D_allgreen)
nrow(D_allgreen)

results <- merge(alleubuff , D_allgreen, by = "geoid")
nrow(results)
head(results)




D_allgreen <- read.csv("Distance_to_the_nearest_model_results/results/results_combined/D_allgreen_bl.csv")

head(D_allgreen)
nrow(D_allgreen)

results <- merge(results, D_allgreen, by = "geoid")
nrow(results)
head(results)



#delete unwanted columns
results <- results[ , !(names(results) %in% c("X.y","X.x", "X")) ]


names(results)[names(results) == 'E_50m_TH_bl.1'] <- 'E_50m_TH_bl'
names(results)[names(results) == 'E_150m_TH_bl.1'] <- 'E_150m_TH_bl'
names(results)[names(results) == 'E_300m_TH_bl.1'] <- 'E_300m_TH_bl'

write.csv(results,"Data/All_Eu_buffer_results.csv")



#####################add VS 20m buffer results

NDVI <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI.csv")

NDVI_blue <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI_blue.csv")

TH <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight.csv")

TH_blue <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight_blue.csv")

head(NDVI)
head(NDVI_blue)


results <- merge(NDVI, NDVI_blue, by = "file_name")
nrow(results)
head(results)

results <- merge(results, TH, by = "file_name")
nrow(results)
head(results)

results <- merge(results, TH_blue, by = "file_name")
nrow(results)
head(results)

#delete unwanted columns
results <- results[ , !(names(results) %in% c("X.x","X.y", "X", "visible_pcnt_20m.y")) ]
results <- results[ , !(names(results) %in% c("visible_pcnt_20m.x.1"))]


####merge with other results
other_results <- read.csv("Data/All_Eu_buffer_results.csv")
head(other_results)

AMIGO <- read.csv("DATA/AMIGO_data/AMIGO_Updated.csv")
head(AMIGO)
#merge AMIGO dataset and VS 
AMIGO_VS <- merge(AMIGO, results, by = "file_name")

results <- merge(other_results, AMIGO_VS, by = "geoid")
nrow(results)
head(results)


##################merging together VS 20m

VS_20m_NDVI <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI.csv")
VS_20m_NDVI_bl <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI_blue.csv")
VS_20m_TH <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight.csv")
VS_20m_TH_bl <- read.csv("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight_blue.csv")


VS_20m <- merge(VS_20m_NDVI, VS_20m_NDVI_bl, by = "file_name")
VS_20m <- merge(VS_20m, VS_20m_TH, by = "file_name")
VS_20m <- merge(VS_20m, VS_20m_TH_bl, by = "file_name")

#delete unnecessary columns
VS_20m <- VS_20m[ , !(names(VS_20m) %in% c("X.x", "X.y", "visible_pcnt_20m.x")) ]
head(VS_20m)
VS_20m <- VS_20m[ , !(names(VS_20m) %in% c("visible_pcnt_20m.y.1")) ]

#merge with AMIGO data

AMIGO <- read.csv("DATA/AMIGO_data/AMIGO_UPDATED.csv")

VS_20m_AMIGO <- merge(AMIGO, VS_20m, by = "file_name")
head(VS_20m_AMIGO)

write.csv(VS_20m_AMIGO, "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_allresults.csv")

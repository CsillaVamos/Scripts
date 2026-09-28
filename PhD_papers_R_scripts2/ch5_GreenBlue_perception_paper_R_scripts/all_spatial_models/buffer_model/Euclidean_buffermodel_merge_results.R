#######################################################################
####COMBINING ALL RESULTS



####UPLOAD RESULTS BY DATASET 

#allgreen
allgreen_20m <- read.csv("Euclidean_buffer_model_results/20m/allgrn_pcnt_20mbuffer.csv")
allgreen_50m <- read.csv("Euclidean_buffer_model_results/50m/allgrn_pcnt_50mbuffer.csv")
allgreen_150m <- read.csv("Euclidean_buffer_model_results/150m/allgrn_pcnt_150mbuffer.csv")
allgreen_300m <- read.csv("Euclidean_buffer_model_results/300m/allgrn_pcnt_300mbuffer.csv")
allgreen_600m <- read.csv("Euclidean_buffer_model_results/600m/allgrn_pcnt_600mbuffer.csv")

#fandn
fandn_20m <- read.csv("Euclidean_buffer_model_results/20m/fandn_pcnt_20mbuffer.csv")
fandn_50m <- read.csv("Euclidean_buffer_model_results/50m/fandn_pcnt_50mbuffer.csv")
fandn_150m <- read.csv("Euclidean_buffer_model_results/150m/fandn_pcnt_150mbuffer.csv")
fandn_300m <- read.csv("Euclidean_buffer_model_results/300m/fandn_pcnt_300mbuffer.csv")
fandn_600m <- read.csv("Euclidean_buffer_model_results/600m/fandn_pcnt_600mbuffer.csv")

#agri
agri_20m <- read.csv("Euclidean_buffer_model_results/20m/agri_pcnt_20mbuffer.csv")
agri_50m <- read.csv("Euclidean_buffer_model_results/50m/agri_pcnt_50mbuffer.csv")
agri_150m <- read.csv("Euclidean_buffer_model_results/150m/agri_pcnt_150mbuffer.csv")
agri_300m <- read.csv("Euclidean_buffer_model_results/300m/agri_pcnt_300mbuffer.csv")
agri_600m <- read.csv("Euclidean_buffer_model_results/600m/agri_pcnt_600mbuffer.csv")

#rec
rec_20m <- read.csv("Euclidean_buffer_model_results/20m/rec_pcnt_20mbuffer.csv")
rec_50m <- read.csv("Euclidean_buffer_model_results/50m/rec_pcnt_50mbuffer.csv")
rec_150m <- read.csv("Euclidean_buffer_model_results/150m/rec_pcnt_150mbuffer.csv")
rec_300m <- read.csv("Euclidean_buffer_model_results/300m/rec_pcnt_300mbuffer.csv")
rec_600m <- read.csv("Euclidean_buffer_model_results/600m/rec_pcnt_600mbuffer.csv")

#parks
parks_20m <- read.csv("Euclidean_buffer_model_results/20m/parks_pcnt_20mbuffer.csv")
parks_50m <- read.csv("Euclidean_buffer_model_results/50m/parks_pcnt_50mbuffer.csv")
parks_150m <- read.csv("Euclidean_buffer_model_results/150m/parks_pcnt_150mbuffer.csv")
parks_300m <- read.csv("Euclidean_buffer_model_results/300m/parks_pcnt_300mbuffer.csv")
parks_600m <- read.csv("Euclidean_buffer_model_results/600m/parks_pcnt_600mbuffer.csv")

#NDVI
NDVI_20m <- read.csv("Euclidean_buffer_model_results/20m/NDVI_mean_20mbuffer.csv")
NDVI_50m <- read.csv("Euclidean_buffer_model_results/50m/NDVI_mean_50mbuffer.csv")
NDVI_150m <- read.csv("Euclidean_buffer_model_results/150m/NDVI_mean_150mbuffer.csv")
NDVI_300m <- read.csv("Euclidean_buffer_model_results/300m/NDVI_mean_300mbuffer.csv")
NDVI_600m <- read.csv("Euclidean_buffer_model_results/600m/NDVI_mean_600mbuffer.csv")

#Treeheight
treeheight_20m <- read.csv("Euclidean_buffer_model_results/allresults_treeheight/E_treeheight_20m_allresults.csv")
treeheight_50m <- read.csv("Euclidean_buffer_model_results/allresults_treeheight/E_treeheight_50m_allresults.csv")
treeheight_150m <- read.csv("Euclidean_buffer_model_results/allresults_treeheight/E_treeheight_150m_allresults.csv")
treeheight_300m <- read.csv("Euclidean_buffer_model_results/allresults_treeheight/E_treeheight_300m_allresults.csv")
treeheight_600m <- read.csv("Euclidean_buffer_model_results/allresults_treeheight/E_treeheight_600m_allresults.csv")

#allgreen_bl
allgreen_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/allgrn_bl_pcnt_20mbuffer.csv")
allgreen_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/allgrn_bl_pcnt_50mbuffer.csv")
allgreen_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/allgrn_bl_pcnt_150mbuffer.csv")
allgreen_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/allgrn_bl_pcnt_300mbuffer.csv")
allgreen_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/allgrn_bl_pcnt_600mbuffer.csv")

#fandn_bl
fandn_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/fandn_bl_pcnt_20mbuffer.csv")
fandn_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/fandn_bl_pcnt_50mbuffer.csv")
fandn_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/fandn_bl_pcnt_150mbuffer.csv")
fandn_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/fandn_bl_pcnt_300mbuffer.csv")
fandn_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/fandn_bl_pcnt_600mbuffer.csv")

#agri_bl
agri_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/agri_bl_pcnt_20mbuffer.csv")
agri_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/agri_bl_pcnt_50mbuffer.csv")
agri_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/agri_bl_pcnt_150mbuffer.csv")
agri_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/agri_bl_pcnt_300mbuffer.csv")
agri_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/agri_bl_pcnt_600mbuffer.csv")

#rec_bl
rec_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/rec_bl_pcnt_20mbuffer.csv")
rec_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/rec_bl_pcnt_50mbuffer.csv")
rec_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/rec_bl_pcnt_150mbuffer.csv")
rec_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/rec_bl_pcnt_300mbuffer.csv")
rec_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/rec_bl_pcnt_600mbuffer.csv")

#parks_bl
parks_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/parks_bl_pcnt_20mbuffer.csv")
parks_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/parks_bl_pcnt_50mbuffer.csv")
parks_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/parks_bl_pcnt_150mbuffer.csv")
parks_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/parks_bl_pcnt_300mbuffer.csv")
parks_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/parks_bl_pcnt_600mbuffer.csv")

#NDVI_bl
NDVI_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/NDVI_bl_mean_20mbuffer.csv")
NDVI_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/NDVI_bl_mean_50mbuffer.csv")
NDVI_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/NDVI_bl_mean_150mbuffer.csv")
NDVI_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/NDVI_bl_mean_300mbuffer.csv")
NDVI_bl_600m <- read.csv("Euclidean_buffer_model_results/600m/NDVI_bl_mean_600mbuffer.csv")

#Treeheight_bl
treeheight_bl_20m <- read.csv("Euclidean_buffer_model_results/20m/Treeheight_bl_mean_20mbuffer.csv")
treeheight_bl_50m <- read.csv("Euclidean_buffer_model_results/50m/Treeheight_bl_mean_50mbuffer.csv")
treeheight_bl_150m <- read.csv("Euclidean_buffer_model_results/150m/Treeheight_bl_mean_150mbuffer.csv")
treeheight_bl_300m <- read.csv("Euclidean_buffer_model_results/300m/Treeheight_bl_mean_300mbuffer.csv")
treeheight_bl_600m <- read.csv("Euclidean_buffer_results/treeheightblue_ave_per_buffer600.csv")



###################################################################################################################################################
#Merge results by dataset

###allgreen
allgreen <- merge(allgreen_20m, allgreen_50m, by = "geoid")
allgreen <- merge(allgreen, allgreen_150m, by = "geoid")
allgreen <- merge(allgreen, allgreen_300m, by = "geoid")
allgreen <- merge(allgreen, allgreen_600m, by = "geoid")

nrow(allgreen)
head(allgreen)
#delete unwanted columns
allgreen <- allgreen[ , !(names(allgreen) %in% c("X.x", "X.y","X")) ]


###fandn
fandn <- merge(fandn_20m, fandn_50m, by = "geoid")
fandn <- merge(fandn, fandn_150m, by = "geoid")
fandn <- merge(fandn, fandn_300m, by = "geoid")
fandn <- merge(fandn, fandn_600m, by = "geoid")

nrow(fandn)
head(fandn)
#delete unwanted columns
fandn <- fandn[ , !(names(fandn) %in% c("X.x", "X.y", "X")) ]



###agri
agri <- merge(agri_20m, agri_50m, by = "geoid")
agri <- merge(agri, agri_150m, by = "geoid")
agri <- merge(agri, agri_300m, by = "geoid")
agri <- merge(agri, agri_600m, by = "geoid")

nrow(agri)
head(agri)
#delete unwanted columns
agri <- agri[ , !(names(agri) %in% c("X.x", "X.y","X")) ]



###rec
rec <- merge(rec_20m, rec_50m, by = "geoid")
rec <- merge(rec, rec_150m, by = "geoid")
rec <- merge(rec, rec_300m, by = "geoid")
rec <- merge(rec, rec_600m, by = "geoid")

nrow(rec)
head(rec)
#delete unwanted columns
rec <- rec[ , !(names(rec) %in% c("X.x", "X.y","X")) ]



###parks
parks <- merge(parks_20m, parks_50m, by = "geoid")
parks <- merge(parks, parks_150m, by = "geoid")
parks <- merge(parks, parks_300m, by = "geoid")
parks <- merge(parks, parks_600m, by = "geoid")

#delete unwanted columns
parks <- parks[ , !(names(parks) %in% c("X.x", "X.y","X")) ]

nrow(parks)
head(parks)


###NDVI
NDVI <- merge(NDVI_20m, NDVI_50m, by = "geoid")
NDVI <- merge(NDVI, NDVI_150m, by = "geoid")
NDVI <- merge(NDVI, NDVI_300m, by = "geoid")
NDVI <- merge(NDVI, NDVI_600m, by = "geoid")

#delete unwanted columns
NDVI <- NDVI[ , !(names(NDVI) %in% c("X.x", "X.y","X")) ]

nrow(NDVI)
head(NDVI)


###treeheight
treeheight <- merge(treeheight_20m, treeheight_50m, by = "geoid")
treeheight <- merge(treeheight, treeheight_150m, by = "geoid")
treeheight <- merge(treeheight, treeheight_300m, by = "geoid")
treeheight <- merge(treeheight, treeheight_600m, by = "geoid")

#delete unwanted columns
treeheight <- treeheight[ , !(names(treeheight) %in% c("X.x", "X.y","X")) ]

nrow(treeheight)
head(treeheight)



###allgreen_bl
allgreen_bl <- merge(allgreen_bl_20m, allgreen_bl_50m, by = "geoid")
allgreen_bl <- merge(allgreen_bl, allgreen_bl_150m, by = "geoid")
allgreen_bl <- merge(allgreen_bl, allgreen_bl_300m, by = "geoid")
allgreen_bl <- merge(allgreen_bl, allgreen_bl_600m, by = "geoid")

nrow(allgreen_bl)
head(allgreen_bl)

###fandn_bl
fandn_bl <- merge(fandn_bl_20m, fandn_bl_50m, by = "geoid")
fandn_bl <- merge(fandn_bl, fandn_bl_150m, by = "geoid")
fandn_bl <- merge(fandn_bl, fandn_bl_300m, by = "geoid")
fandn_bl <- merge(fandn_bl, fandn_bl_600m, by = "geoid")

nrow(fandn_bl)
head(fandn_bl)

###agri_bl
agri_bl <- merge(agri_bl_20m, agri_bl_50m, by = "geoid")
agri_bl <- merge(agri_bl, agri_bl_150m, by = "geoid")
agri_bl <- merge(agri_bl, agri_bl_300m, by = "geoid")
agri_bl <- merge(agri_bl, agri_bl_600m, by = "geoid")

nrow(agri_bl)
head(agri_bl)

###rec_bl
rec_bl <- merge(rec_bl_20m, rec_bl_50m, by = "geoid")
rec_bl <- merge(rec_bl, rec_bl_150m, by = "geoid")
rec_bl <- merge(rec_bl, rec_bl_300m, by = "geoid")
#rec_bl <- merge(rec_bl, rec_bl_600m, by = "geoid")

nrow(rec_bl_600m)
head(rec_bl)

###parks_bl
parks_bl <- merge(parks_bl_20m, parks_bl_50m, by = "geoid")
parks_bl <- merge(parks_bl, parks_bl_150m, by = "geoid")
parks_bl <- merge(parks_bl, parks_bl_300m, by = "geoid")
#parks_bl <- merge(parks_bl, parks_bl_600m, by = "geoid")

nrow(parks_bl)
head(parks_bl)

###NDVI_bl
NDVI_bl <- merge(NDVI_bl_20m, NDVI_bl_50m, by = "geoid")
NDVI_bl <- merge(NDVI_bl, NDVI_bl_150m, by = "geoid")
NDVI_bl <- merge(NDVI_bl, NDVI_bl_300m, by = "geoid")
NDVI_bl <- merge(NDVI_bl, NDVI_bl_600m, by = "geoid")

nrow(NDVI_bl)
head(NDVI_bl)


###treeheight_bl
treeheight_bl <- merge(treeheight_bl_20m, treeheight_bl_50m, by = "geoid")
treeheight_bl <- merge(treeheight_bl, treeheight_bl_150m, by = "geoid")
treeheight_bl <- merge(treeheight_bl, treeheight_bl_300m, by = "geoid")
#treeheight_bl <- merge(treeheight_bl, treeheight_bl_600m, by = "geoid")

nrow(treeheight_bl)
head(treeheight_bl)



###############################################################################################################################################
#####################################################
####MERGE ALL Euclidean model results together

Eu_results <- merge(allgreen, fandn, by = "geoid")
Eu_results <- merge(Eu_results, agri, by = "geoid")
Eu_results <- merge(Eu_results, rec, by = "geoid")
Eu_results <- merge(Eu_results, parks, by = "geoid")
Eu_results <- merge(Eu_results, NDVI, by = "geoid")
Eu_results <- merge(Eu_results, treeheight, by = "geoid")
Eu_results <- merge(Eu_results, allgreen_bl, by = "geoid")
Eu_results <- merge(Eu_results, fandn_bl, by = "geoid")
Eu_results <- merge(Eu_results, agri_bl, by = "geoid")
Eu_results <- merge(Eu_results, rec_bl, by = "geoid")
Eu_results <- merge(Eu_results, parks_bl, by = "geoid")
Eu_results <- merge(Eu_results, NDVI_bl, by = "geoid")
Eu_results <- merge(Eu_results, treeheight_bl, by = "geoid")


nrow(Eu_results)
head(Eu_results)

#take out unnecessary columns
Eu_results_2 <- Eu_results[,!(names(Eu_results) %in% c("X.x.x", "X.y.x", "X.y.y", "X.x.y", "X.x.1", "X.x.1", "X.y.1"))]

nrow(Eu_results_2)
head(Eu_results_2)

#remove x and y from column names
colnames(Eu_results_2) <- gsub("\\.x", "", colnames(Eu_results_2))
colnames(Eu_results_2) <- gsub("\\.y", "", colnames(Eu_results_2))

head(Eu_results_2)
nrow(Eu_results_2)

###round results
Eu_results_2[, 2:69] <- round(Eu_results_2[, 2:68], 2)
parks_bl_600m$X <- NULL
parks_bl_600m[,2] <- round(parks_bl_600m[,2], 2)


###add in E_parks_bl_600m
joined <- inner_join(parks_bl_600m, Eu_results_2, by = "geoid")
joined <- merge(parks_bl_600m, Eu_results_2, by = "geoid", all.x = TRUE)


head(joined)
nrow(joined)

write.csv(Eu_results_2, "Euclidean_buffer_model_results/All_Eu_buffer_results2.csv")




Eu_results_2






#########################################################################
######GRAVEYARD CODE

parks_bl <- read.csv("Euclidean_buffer_results/parksblue_percent_of_greenblue_space_within_600mbuffer.csv")

head(parks_bl)

parks_bl <- aggregate(parks_and_water_pcnt ~ geoid, data = parks_bl, FUN = sum, na.rm = TRUE)
nrow(parks_bl)

write.csv(parks_bl, "Euclidean_buffer_model_results/600m/parks_bl_pcnt_600mbuffer.csv")



###
rec_bl <- read.csv("Euclidean_buffer_results/landuse_recreation_percent_of_greenblue_space_within_600mbuffer.csv")

head(rec_bl)

rec_bl <- aggregate(LU_rec_and_water_pcnt ~ geoid, data = rec_bl, FUN = sum, na.rm = TRUE)
nrow(rec_bl)

write.csv(rec_bl, "Euclidean_buffer_model_results/600m/rec_bl_pcnt_600mbuffer.csv")


###
TH_bl <- read.csv("Euclidean_buffer_results/treeheightblue_ave_per_buffer600.csv")

head(TH_bl)

TH_bl <- aggregate(treeheightblue_val ~ geoid, data = rec_bl, FUN = sum, na.rm = TRUE)
nrow(TH_bl)

write.csv(TH_bl, "Euclidean_buffer_model_results/600m/rec_bl_pcnt_600mbuffer.csv")




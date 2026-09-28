#################################################################################################
##########SVI additional analysis

#####upload data
svi <- read.csv("O://DGK/IRAS/EEPI/Projects/Amigo-student/Csilla_Vamos/Data/Streetview_model_results_geoid.csv")

#omit trees and plants column
svi <- dplyr::select(svi, -SV_trees_and_plants)

#####separate into distance ranges
svi_60to75 <- svi[svi$svi_distance_to_RA_m >= 60 & svi$svi_distance_to_RA_m <= 75, ]

svi_45to60 <- svi[svi$svi_distance_to_RA_m >= 45 & svi$svi_distance_to_RA_m <= 60, ]

svi_30to45 <- svi[svi$svi_distance_to_RA_m >= 30 & svi$svi_distance_to_RA_m <= 45, ]

svi_15to30 <- svi[svi$svi_distance_to_RA_m >= 15 & svi$svi_distance_to_RA_m <= 30, ]

svi_0to15 <- svi[svi$svi_distance_to_RA_m >= 0 & svi$svi_distance_to_RA_m <= 15, ]


#####create summaries of each
summary_svi_0to15 <- svi_0to15 %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 6)))%>%
  mutate(group = "svi_0to15")

summary_svi_15to30 <- svi_15to30 %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 6)))%>%
  mutate(group = "svi_15to30")

summary_svi_30to45 <-svi_30to45 %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 6)))%>%
  mutate(group = "svi_30to45")

summary_svi_45to60 <-svi_45to60 %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 6)))%>%
  mutate(group = "svi_45to60")

summary_svi_60to75 <-svi_60to75 %>%
  summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 6)))%>%
  mutate(group = "svi_60to75")


#####Combine into one summary dataframe
summary_all <- bind_rows(summary_svi_0to15, summary_svi_15to30, summary_svi_30to45, summary_svi_45to60, summary_svi_60to75)

#move 'group' column to the front
summary_all <- summary_all %>%
  relocate(group)




###########################################################################################################3
####################Prepare data for Spearman correlations

#####upload data and prepare it
AMIGO <- read.csv("Data/Amigo_FUP2023.csv")
#omit NA rows
AMIGO <- AMIGO[complete.cases(AMIGO), ]
#rename rows for clarity
names(AMIGO)[names(AMIGO) == 'ggbstr'] <- 'street'
names(AMIGO)[names(AMIGO) == 'ggbnbh'] <- 'nghbrhd'
names(AMIGO)[names(AMIGO) == 'ggbview'] <- 'houseview'

AMIGO <- AMIGO[ , !(names(AMIGO) %in% c("cohort1", "gedate,qc2023","ggbcity","ggbarea","age","bsex","education"))]

#####join model_results to each svi dataframe
joined_svi_0to15 <- left_join(svi_0to15, AMIGO, by = "geoid")

joined_svi_15to30 <- left_join(svi_15to30, AMIGO, by = "geoid")

joined_svi_30to45 <- left_join(svi_30to45, AMIGO, by = "geoid")

joined_svi_45to60 <- left_join(svi_45to60, AMIGO, by = "geoid")

joined_svi_60to75 <- left_join(svi_60to75, AMIGO, by = "geoid")

#####delete unwanted columns and na values
joined_svi_0to15 <- joined_svi_0to15[ , !(names(joined_svi_0to15) %in% c("bsex", "cohort1", "education", "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m"))]
joined_svi_0to15 <- na.omit(joined_svi_0to15)

joined_svi_15to30 <- joined_svi_15to30[ , !(names(joined_svi_15to30) %in% c("bsex", "cohort1", "education", "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m"))]
joined_svi_15to30 <- na.omit(joined_svi_15to30)

joined_svi_30to45 <- joined_svi_30to45[ , !(names(joined_svi_30to45) %in% c("bsex", "cohort1", "education", "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m"))]
joined_svi_30to45 <- na.omit(joined_svi_30to45)

joined_svi_45to60 <- joined_svi_45to60[ , !(names(joined_svi_45to60) %in% c("bsex", "cohort1", "education", "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m"))]
joined_svi_45to60 <- na.omit(joined_svi_45to60)

joined_svi_60to75 <- joined_svi_60to75[ , !(names(joined_svi_60to75) %in% c("bsex", "cohort1", "education", "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m"))]
joined_svi_60to75 <- na.omit(joined_svi_60to75)







########################################################################################################
###########################SPEARMAN CORRELATIONS (redo for each distance range)

joined_data2 <- joined_svi_0to15

###separate dfs again
likert_df <- dplyr::select(joined_data2, geoid, street, nghbrhd, houseview)
exposure_df <- joined_data2[, !names(joined_data2) %in% c("street", "nghbrhd", "houseview")]


#separate each survey Q into a different df
likert_street <- dplyr::select(likert_df, geoid, street)
likert_nghbrhd <- dplyr::select(likert_df, geoid, nghbrhd)
likert_houseview <- dplyr::select(likert_df, geoid, houseview)

# Convert all columns in both dataframes to numeric (safely)
likert_street_num <- as.data.frame(lapply(likert_street, function(x) as.numeric(as.character(x))))
exposure_df_num <- as.data.frame(lapply(exposure_df, function(x) as.numeric(as.character(x))))



#save results!!!

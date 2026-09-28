####################################################################################################
#################################################################################################
###############SPEARMAN CORRELATION ANALYSIS

library(Hmisc)

#####upload data and prepare it
AMIGO <- read.csv("Data/Amigo_FUP2023.csv")


#omit NA rows
AMIGO <- AMIGO[complete.cases(AMIGO), ]

#rename rows for clarity
names(AMIGO)[names(AMIGO) == 'ggbstr'] <- 'street'
names(AMIGO)[names(AMIGO) == 'ggbnbh'] <- 'nghbrhd'
names(AMIGO)[names(AMIGO) == 'ggbview'] <- 'houseview'


model_results <- read.csv("final_results/final_results2.csv", sep = ";")

model_results <- model_results[!duplicated(model_results$geoid), ]

nrow(model_results)


##############extra analysis with street view image data
svi <- read.csv("Data/Streetview_model_results_geoid.csv")
head(svi)
#join svi to other model results
joined_data <- merge(svi, model_results, by = "geoid")

nrow(joined_data)

joined_data <- right_join(AMIGO, joined_data, by = "geoid")
joined_data <- joined_data[!duplicated(joined_data$geoid), ]

#delete unwanted columns
joined_data <- joined_data[ , !(names(joined_data) %in% c("X", "X.1","X.2","X.3", "X.4", "bsex", "cohort1", "education",     "gedate", "qc2023", "ggbcity", "ggbarea", "gage", "svi_distance_to_RA_m")) ]

head(joined_data)
nrow(joined_data)


#omit NA rows
joined_data2 <- joined_data[complete.cases(joined_data), ]

head(joined_data2)
nrow(joined_data2)


write.csv(joined_data2, "final_results/final_results_with_SVI.csv")



###separate dfs again
likert_df <- dplyr::select(joined_data2, geoid, street, nghbrhd, houseview)
exposure_df <- joined_data2[, !names(joined_data2) %in% c("street", "nghbrhd", "houseview")]


#separate each survey Q into a different df
likert_street <- dplyr::select(likert_df, geoid, street)
likert_nghbrhd <- dplyr::select(likert_df, geoid, nghbrhd)
likert_houseview <- dplyr::select(likert_df, geoid, houseview)

head(likert_street)


######################################################################################################
###########LIKERT_STREET


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_street), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_street)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_street)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_street[[i]], exposure_df[[j]], method = "spearman")
  }
}


SC_street <- cor_matrix

write.csv(SC_street, "RESULTS/spearman_correlations/spearman_correlation_street_with_SVI.csv")

#####get p-values

library(corrplot)

# Combine into one data frame again
all_data <- cbind(likert_street, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_street), (ncol(likert_street)+1):ncol(all_data)]
p_values_street <- res$P[1:ncol(likert_street), (ncol(likert_street)+1):ncol(all_data)]

write.csv(p_values_street, "RESULTS/spearman_correlations/pvalues_street.csv")




######################################################################################################
###########LIKERT_NEIGHBORHOOD


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_nghbrhd), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_nghbrhd)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_nghbrhd)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_nghbrhd[[i]], exposure_df[[j]], method = "spearman")
  }
}

SC_nghbrhd <- cor_matrix

write.csv(SC_nghbrhd, "RESULTS/spearman_correlations/spearman_correlation_nghbrhd_with_svi.csv")

#####get p-values
# Combine into one data frame again
all_data <- cbind(likert_nghbrhd, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_nghbrhd), (ncol(likert_nghbrhd)+1):ncol(all_data)]
p_values_nghbrhd <- res$P[1:ncol(likert_nghbrhd), (ncol(likert_nghbrhd)+1):ncol(all_data)]

write.csv(p_values_nghbrhd, "RESULTS/spearman_correlations/pvalues_nghbrhd.csv")




######################################################################################################
###########LIKERT_HOUSEVIEW


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_houseview), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_houseview)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_houseview)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_houseview[[i]], exposure_df[[j]], method = "spearman")
  }
}

SC_houseview <- cor_matrix

write.csv(SC_houseview, "RESULTS/spearman_correlations/spearman_correlation_houseview_with_svi.csv")

#####get p-values
# Combine into one data frame again
all_data <- cbind(likert_houseview, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_houseview), (ncol(likert_houseview)+1):ncol(all_data)]
p_values_houseview <- res$P[1:ncol(likert_houseview), (ncol(likert_houseview)+1):ncol(all_data)]


write.csv(p_values_houseview, "RESULTS/spearman_correlations/pvalues_houseview.csv")







##########################################
###combining results together

spearman_correlations <- merge(SC_street, SC_nghbrhd, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, SC_houseview, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_street, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_nghbrhd, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_houseview, by = "geoid", all.x = TRUE)

head(spearman_correlations)





##########################################################################################
##########################################################################################
##########################################################################################
#############spearman correlations for just green datasets


#####upload data and prepare it
AMIGO <- read.csv("O://DGK/IRAS/EEPI/Projects/Amigo-student/Csilla_Vamos/Data/Amigo_FUP2023.csv")

#select relevant rows
AMIGO  <- dplyr::select(AMIGO, geoid, ggbstr, ggbnbh, ggbview)
#omit NA rows
AMIGO <- AMIGO[complete.cases(AMIGO), ]

#rename rows for clarity
names(AMIGO)[names(AMIGO) == 'ggbstr'] <- 'street'
names(AMIGO)[names(AMIGO) == 'ggbnbh'] <- 'nghbrhd'
names(AMIGO)[names(AMIGO) == 'ggbview'] <- 'houseview'


model_results <- read.csv("O://DGK/IRAS/EEPI/Projects/Amigo-student/Csilla_Vamos/Data/UPDATED_model_results_geoid.csv")

nrow(model_results)

#select relevant columns
model_results <- dplyr::select(model_results, N_NDVI_mean, N_th_mean, N_allgreen_pcnt, N_rctn_pcnt, N_fandn_pcnt, N_agri_pcnt, N_parks_pcnt, D_allgreen, VS_50m_mean_NDVI, VS_50m_mean_TH, VS_150m_mean_NDVI, VS_150m_mean_TH, geoid)


joined_data <- right_join(AMIGO, model_results, by = "geoid")
#joined_data <- AMIGO[!duplicated(joined_data$geoid), ]

head(joined_data)
nrow(joined_data)
#omit NA rows
joined_data <- joined_data[complete.cases(joined_data), ]

write.csv(joined_data, "RESULTS/JUST_GREEN_model_results_AMIGO_VS_NB_D.csv")

###separate dfs again
likert_df <- dplyr::select(joined_data, geoid, street, nghbrhd, houseview)
exposure_df <- joined_data[, !names(joined_data) %in% c("street", "nghbrhd", "houseview")]


#separate each survey Q into a different df
likert_street <- dplyr::select(likert_df, geoid, street)
likert_nghbrhd <- dplyr::select(likert_df, geoid, nghbrhd)
likert_houseview <- dplyr::select(likert_df, geoid, houseview)




######################################################################################################
###########LIKERT_STREET


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_street), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_street)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_street)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_street[[i]], exposure_df[[j]], method = "spearman")
  }
}

SC_street <- cor_matrix

write.csv(SC_street, "RESULTS/spearman_correlations/test/JUST_GREEN_spearman_correlation_test_street.csv")

#####get p-values
# Combine into one data frame again
all_data <- cbind(likert_street, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_street), (ncol(likert_street)+1):ncol(all_data)]
p_values_street <- res$P[1:ncol(likert_street), (ncol(likert_street)+1):ncol(all_data)]

write.csv(p_values_street, "RESULTS/spearman_correlations/test/JUST_GREEN_pvalues_street_test.csv")




######################################################################################################
###########LIKERT_NEIGHBORHOOD


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_nghbrhd), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_nghbrhd)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_nghbrhd)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_nghbrhd[[i]], exposure_df[[j]], method = "spearman")
  }
}

SC_nghbrhd <- cor_matrix

write.csv(SC_nghbrhd, "RESULTS/spearman_correlations/test/JUST_GREEN_spearman_correlation_test_nghbrhd.csv")

#####get p-values
# Combine into one data frame again
all_data <- cbind(likert_nghbrhd, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_nghbrhd), (ncol(likert_nghbrhd)+1):ncol(all_data)]
p_values_nghbrhd <- res$P[1:ncol(likert_nghbrhd), (ncol(likert_nghbrhd)+1):ncol(all_data)]

write.csv(p_values_nghbrhd, "RESULTS/spearman_correlations/test/JUST_GREEN_pvalues_nghbrhd_test.csv")




######################################################################################################
###########LIKERT_HOUSEVIEW


#####Compute Spearman correlations
# Create empty matrix to store results
cor_matrix <- matrix(NA, nrow = ncol(likert_houseview), ncol = ncol(exposure_df))
rownames(cor_matrix) <- colnames(likert_houseview)
colnames(cor_matrix) <- colnames(exposure_df)

#Compute Spearman correlations
for (i in 1:ncol(likert_houseview)) {
  for (j in 1:ncol(exposure_df)) {
    cor_matrix[i, j] <- cor(likert_houseview[[i]], exposure_df[[j]], method = "spearman")
  }
}

SC_houseview <- cor_matrix

write.csv(SC_houseview, "RESULTS/spearman_correlations/test/JUST_GREEN_spearman_correlation_test_houseview.csv")

#####get p-values
# Combine into one data frame again
all_data <- cbind(likert_houseview, exposure_df)

# Compute Spearman correlation and p-values
res <- rcorr(as.matrix(all_data), type = "spearman")

# Extract correlation and p-values for relevant sections
cor_values <- res$r[1:ncol(likert_houseview), (ncol(likert_houseview)+1):ncol(all_data)]
p_values_houseview <- res$P[1:ncol(likert_houseview), (ncol(likert_houseview)+1):ncol(all_data)]


write.csv(p_values_houseview, "RESULTS/spearman_correlations/test/JUST_GREEN_pvalues_houseview_test.csv")


##########################################
###combining results together

spearman_correlations <- merge(SC_street, SC_nghbrhd, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, SC_houseview, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_street, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_nghbrhd, by = "geoid", all.x = TRUE)
spearman_correlations <- merge(spearman_correlations, p_values_houseview, by = "geoid", all.x = TRUE)

head(spearman_correlations)



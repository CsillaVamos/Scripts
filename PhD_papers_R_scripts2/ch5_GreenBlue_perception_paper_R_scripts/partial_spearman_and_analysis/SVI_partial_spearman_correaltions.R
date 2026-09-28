#############################################################################################################################################################################
###########################################################################################################################################################################3
##############FINAL RESULTS 2026


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("ppcor", lib = "C:/R_temp_library")

# Load the package from that location
library(ppcor, lib.loc = "C:/R_temp_library")


####upload data sets

AMIGO <- read.csv("Data/Amigo_FUP2023.csv")

SVI <- read.csv("streetview_image_analysis/svi_CORRECTED_ip_geoid.csv")

head(AMIGO)
head(SVI)


##################################clean AMIGO data

nrow(AMIGO)

#####delete unwanted columns
AMIGO2 <- AMIGO[, !names(AMIGO) %in% c("cohort1", "gedate", "qc2023", "ggbcity", "ggbarea")]

####rename columns
names(AMIGO2)[names(AMIGO2) == "bsex"] <- "sex"
names(AMIGO2)[names(AMIGO2) == "ggbstr"] <- "street"
names(AMIGO2)[names(AMIGO2) == "ggbnbh"] <- "neighborhood"
names(AMIGO2)[names(AMIGO2) == "ggbview"] <- "houseview"
names(AMIGO2)[names(AMIGO2) == "gage"] <- "age"


#####reorganize column position
AMIGO3 <- AMIGO2[, c(ncol(AMIGO2), 1:(ncol(AMIGO2)-1))]
AMIGO3 <- AMIGO3[, c(1, ncol(AMIGO3), 2:(ncol(AMIGO3)-1))]


#####remove NAs
AMIGO4 <- na.omit(AMIGO3)

nrow(AMIGO4)
head(AMIGO4)



###################################################################################################
############merge AMIGO data with SVI data


AMIGO_SVI <- AMIGO4 %>%
  left_join(SVI, by = "geoid")

#check for duplicate geoids
any(duplicated(AMIGO_SVI$geoid))
sum(duplicated(AMIGO_SVI$geoid))
AMIGO_SVI$geoid[duplicated(AMIGO_SVI$geoid)]


#remove duplicate ID rows
AMIGO_SVI <- AMIGO_SVI[!duplicated(AMIGO_SVI$geoid), ]

head(AMIGO_SVI)
nrow(AMIGO_SVI)

max(AMIGO_SVI$buf20m_svi_count, na.rm = TRUE)
max(AMIGO_SVI$buf50m_svi_count, na.rm = TRUE)
max(AMIGO_SVI$buf150m_svi_count, na.rm = TRUE)
max(AMIGO_SVI$buf300m_svi_count, na.rm = TRUE)
max(AMIGO_SVI$buf600m_svi_count, na.rm = TRUE)


#################################################################################################
###########separate AMIGO_SVI per buffer size

#####create buffer 20m dataset
AMIGO_SVI_20m <- AMIGO_SVI[, c("geoid", "age", "sex", "education", "street", "neighborhood", "houseview", "buf20m_mean_pix")]
#remove na columns
AMIGO_SVI_20m <- na.omit(AMIGO_SVI_20m)
head(AMIGO_SVI_20m)

#####create buffer 50m dataset
AMIGO_SVI_50m <- AMIGO_SVI[, c("geoid", "age", "sex", "education", "street", "neighborhood", "houseview", "buf50m_mean_pix")]
#remove na columns
AMIGO_SVI_50m <- na.omit(AMIGO_SVI_50m)


#####create buffer 150m dataset
AMIGO_SVI_150m <- AMIGO_SVI[, c("geoid", "age", "sex", "education", "street", "neighborhood", "houseview", "buf150m_mean_pix")]
#remove na columns
AMIGO_SVI_150m <- na.omit(AMIGO_SVI_150m)


#####create buffer 300m dataset
AMIGO_SVI_300m <- AMIGO_SVI[, c("geoid", "age", "sex", "education", "street", "neighborhood", "houseview", "buf300m_mean_pix")]
#remove na columns
AMIGO_SVI_300m <- na.omit(AMIGO_SVI_300m)


#####create buffer 600m dataset
AMIGO_SVI_600m <- AMIGO_SVI[, c("geoid", "age", "sex", "education", "street", "neighborhood", "houseview", "buf600m_mean_pix")]
#remove na columns
AMIGO_SVI_600m <- na.omit(AMIGO_SVI_600m)



nrow(AMIGO_SVI_20m)


####################################################################################################################################################
####################separate each dataset into houseview, street, and neighborhood


#####20m buffer
AMIGO_SVI_20m_houseview <- AMIGO_SVI_20m[, c("geoid", "age", "sex", "education", "houseview", "buf20m_mean_pix")]

AMIGO_SVI_20m_street <- AMIGO_SVI_20m[, c("geoid", "age", "sex", "education", "street", "buf20m_mean_pix")]

AMIGO_SVI_20m_neighborhood <- AMIGO_SVI_20m[, c("geoid", "age", "sex", "education", "neighborhood", "buf20m_mean_pix")]



#####50m buffer
AMIGO_SVI_50m_houseview <- AMIGO_SVI_50m[, c("geoid", "age", "sex", "education", "houseview", "buf50m_mean_pix")]

AMIGO_SVI_50m_street <- AMIGO_SVI_50m[, c("geoid", "age", "sex", "education", "street", "buf50m_mean_pix")]

AMIGO_SVI_50m_neighborhood <- AMIGO_SVI_50m[, c("geoid", "age", "sex", "education", "neighborhood", "buf50m_mean_pix")]



#####150m buffer
AMIGO_SVI_150m_houseview <- AMIGO_SVI_150m[, c("geoid", "age", "sex", "education", "houseview", "buf150m_mean_pix")]

AMIGO_SVI_150m_street <- AMIGO_SVI_150m[, c("geoid", "age", "sex", "education", "street", "buf150m_mean_pix")]

AMIGO_SVI_150m_neighborhood <- AMIGO_SVI_150m[, c("geoid", "age", "sex", "education", "neighborhood", "buf150m_mean_pix")]



#####300m buffer
AMIGO_SVI_300m_houseview <- AMIGO_SVI_300m[, c("geoid", "age", "sex", "education", "houseview", "buf300m_mean_pix")]

AMIGO_SVI_300m_street <- AMIGO_SVI_300m[, c("geoid", "age", "sex", "education", "street", "buf300m_mean_pix")]

AMIGO_SVI_300m_neighborhood <- AMIGO_SVI_300m[, c("geoid", "age", "sex", "education", "neighborhood", "buf300m_mean_pix")]



#####600m buffer
AMIGO_SVI_600m_houseview <- AMIGO_SVI_600m[, c("geoid", "age", "sex", "education", "houseview", "buf600m_mean_pix")]

AMIGO_SVI_600m_street <- AMIGO_SVI_600m[, c("geoid", "age", "sex", "education", "street", "buf600m_mean_pix")]

AMIGO_SVI_600m_neighborhood <- AMIGO_SVI_600m[, c("geoid", "age", "sex", "education", "neighborhood", "buf600m_mean_pix")]









############################################################################################################################################
############################################################################################################################################
##############################################################################################
############find partial Spearman correlations for each buffer size




###########################################################################################################################
############################################20 M BUFFER



##########################################HOUSEVIEW
#####Rank-transform all variables
AMIGO_SVI_20m_houseview_ranked <- as.data.frame(apply(AMIGO_SVI_20m_houseview[, c("houseview", "buf20m_mean_pix",
                                        "age", "sex", "education")],
                                 2, rank))

#####Run partial correlation
AMIGO_SVI_20m_houseview_PSC <- pcor.test(AMIGO_SVI_20m_houseview_ranked$houseview,
                                         AMIGO_SVI_20m_houseview_ranked$buf20m_mean_pix,
                                         AMIGO_SVI_20m_houseview_ranked[, c("sex", "age", "education")])



##########################################STREET
#####Rank-transform all variables
AMIGO_SVI_20m_street_ranked <- as.data.frame(apply(AMIGO_SVI_20m_street[, c("street", "buf20m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_20m_street_PSC <- pcor.test(AMIGO_SVI_20m_street_ranked$street,
                                         AMIGO_SVI_20m_street_ranked$buf20m_mean_pix,
                                         AMIGO_SVI_20m_street_ranked[, c("sex", "age", "education")])





##########################################NEIGHBORHOOD
#####Rank-transform all variables
AMIGO_SVI_20m_neighborhood_ranked <- as.data.frame(apply(AMIGO_SVI_20m_neighborhood[, c("neighborhood", "buf20m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_20m_neighborhood_PSC <- pcor.test(AMIGO_SVI_20m_neighborhood_ranked$neighborhood,
                                         AMIGO_SVI_20m_neighborhood_ranked$buf20m_mean_pix,
                                         AMIGO_SVI_20m_neighborhood_ranked[, c("sex", "age", "education")])




###########################################################################################################################
############################################50 M BUFFER



##########################################HOUSEVIEW
#####Rank-transform all variables
AMIGO_SVI_50m_houseview_ranked <- as.data.frame(apply(AMIGO_SVI_50m_houseview[, c("houseview", "buf50m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_50m_houseview_PSC <- pcor.test(AMIGO_SVI_50m_houseview_ranked$houseview,
                                         AMIGO_SVI_50m_houseview_ranked$buf50m_mean_pix,
                                         AMIGO_SVI_50m_houseview_ranked[, c("sex", "age", "education")])



##########################################STREET
#####Rank-transform all variables
AMIGO_SVI_50m_street_ranked <- as.data.frame(apply(AMIGO_SVI_50m_street[, c("street", "buf50m_mean_pix",
                                                                            "age", "sex", "education")],
                                                   2, rank))

#####Run partial correlation
AMIGO_SVI_50m_street_PSC <- pcor.test(AMIGO_SVI_50m_street_ranked$street,
                                      AMIGO_SVI_50m_street_ranked$buf50m_mean_pix,
                                      AMIGO_SVI_50m_street_ranked[, c("sex", "age", "education")])





##########################################NEIGHBORHOOD
#####Rank-transform all variables
AMIGO_SVI_50m_neighborhood_ranked <- as.data.frame(apply(AMIGO_SVI_50m_neighborhood[, c("neighborhood", "buf50m_mean_pix",
                                                                                        "age", "sex", "education")],
                                                         2, rank))

#####Run partial correlation
AMIGO_SVI_50m_neighborhood_PSC <- pcor.test(AMIGO_SVI_50m_neighborhood_ranked$neighborhood,
                                            AMIGO_SVI_50m_neighborhood_ranked$buf50m_mean_pix,
                                            AMIGO_SVI_50m_neighborhood_ranked[, c("sex", "age", "education")])




###########################################################################################################################
############################################150 M BUFFER



##########################################HOUSEVIEW
#####Rank-transform all variables
AMIGO_SVI_150m_houseview_ranked <- as.data.frame(apply(AMIGO_SVI_150m_houseview[, c("houseview", "buf150m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_150m_houseview_PSC <- pcor.test(AMIGO_SVI_150m_houseview_ranked$houseview,
                                         AMIGO_SVI_150m_houseview_ranked$buf150m_mean_pix,
                                         AMIGO_SVI_150m_houseview_ranked[, c("sex", "age", "education")])



##########################################STREET
#####Rank-transform all variables
AMIGO_SVI_150m_street_ranked <- as.data.frame(apply(AMIGO_SVI_150m_street[, c("street", "buf150m_mean_pix",
                                                                            "age", "sex", "education")],
                                                   2, rank))

#####Run partial correlation
AMIGO_SVI_150m_street_PSC <- pcor.test(AMIGO_SVI_150m_street_ranked$street,
                                      AMIGO_SVI_150m_street_ranked$buf150m_mean_pix,
                                      AMIGO_SVI_150m_street_ranked[, c("sex", "age", "education")])





##########################################NEIGHBORHOOD
#####Rank-transform all variables
AMIGO_SVI_150m_neighborhood_ranked <- as.data.frame(apply(AMIGO_SVI_150m_neighborhood[, c("neighborhood", "buf150m_mean_pix",
                                                                                        "age", "sex", "education")],
                                                         2, rank))

#####Run partial correlation
AMIGO_SVI_150m_neighborhood_PSC <- pcor.test(AMIGO_SVI_150m_neighborhood_ranked$neighborhood,
                                            AMIGO_SVI_150m_neighborhood_ranked$buf150m_mean_pix,
                                            AMIGO_SVI_150m_neighborhood_ranked[, c("sex", "age", "education")])




###########################################################################################################################
############################################300 M BUFFER



##########################################HOUSEVIEW
#####Rank-transform all variables
AMIGO_SVI_300m_houseview_ranked <- as.data.frame(apply(AMIGO_SVI_300m_houseview[, c("houseview", "buf300m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_300m_houseview_PSC <- pcor.test(AMIGO_SVI_300m_houseview_ranked$houseview,
                                         AMIGO_SVI_300m_houseview_ranked$buf300m_mean_pix,
                                         AMIGO_SVI_300m_houseview_ranked[, c("sex", "age", "education")])



##########################################STREET
#####Rank-transform all variables
AMIGO_SVI_300m_street_ranked <- as.data.frame(apply(AMIGO_SVI_300m_street[, c("street", "buf300m_mean_pix",
                                                                            "age", "sex", "education")],
                                                   2, rank))

#####Run partial correlation
AMIGO_SVI_300m_street_PSC <- pcor.test(AMIGO_SVI_300m_street_ranked$street,
                                      AMIGO_SVI_300m_street_ranked$buf300m_mean_pix,
                                      AMIGO_SVI_300m_street_ranked[, c("sex", "age", "education")])





##########################################NEIGHBORHOOD
#####Rank-transform all variables
AMIGO_SVI_300m_neighborhood_ranked <- as.data.frame(apply(AMIGO_SVI_300m_neighborhood[, c("neighborhood", "buf300m_mean_pix",
                                                                                        "age", "sex", "education")],
                                                         2, rank))

#####Run partial correlation
AMIGO_SVI_300m_neighborhood_PSC <- pcor.test(AMIGO_SVI_300m_neighborhood_ranked$neighborhood,
                                            AMIGO_SVI_300m_neighborhood_ranked$buf300m_mean_pix,
                                            AMIGO_SVI_300m_neighborhood_ranked[, c("sex", "age", "education")])




###########################################################################################################################
############################################600 M BUFFER



##########################################HOUSEVIEW
#####Rank-transform all variables
AMIGO_SVI_600m_houseview_ranked <- as.data.frame(apply(AMIGO_SVI_600m_houseview[, c("houseview", "buf600m_mean_pix",
                                                                                  "age", "sex", "education")],
                                                      2, rank))

#####Run partial correlation
AMIGO_SVI_600m_houseview_PSC <- pcor.test(AMIGO_SVI_600m_houseview_ranked$houseview,
                                         AMIGO_SVI_600m_houseview_ranked$buf600m_mean_pix,
                                         AMIGO_SVI_600m_houseview_ranked[, c("sex", "age", "education")])



##########################################STREET
#####Rank-transform all variables
AMIGO_SVI_600m_street_ranked <- as.data.frame(apply(AMIGO_SVI_600m_street[, c("street", "buf600m_mean_pix",
                                                                            "age", "sex", "education")],
                                                   2, rank))

#####Run partial correlation
AMIGO_SVI_600m_street_PSC <- pcor.test(AMIGO_SVI_600m_street_ranked$street,
                                      AMIGO_SVI_600m_street_ranked$buf600m_mean_pix,
                                      AMIGO_SVI_600m_street_ranked[, c("sex", "age", "education")])





##########################################NEIGHBORHOOD
#####Rank-transform all variables
AMIGO_SVI_600m_neighborhood_ranked <- as.data.frame(apply(AMIGO_SVI_600m_neighborhood[, c("neighborhood", "buf600m_mean_pix",
                                                                                        "age", "sex", "education")],
                                                         2, rank))

#####Run partial correlation
AMIGO_SVI_600m_neighborhood_PSC <- pcor.test(AMIGO_SVI_600m_neighborhood_ranked$neighborhood,
                                            AMIGO_SVI_600m_neighborhood_ranked$buf600m_mean_pix,
                                            AMIGO_SVI_600m_neighborhood_ranked[, c("sex", "age", "education")])





################################################################################################################################################
#######################JOIN PARTIAL SPEARMAN CORRELATION RESULTS INTO ONE TABLE


#####put all data frames into a list
SVI_PSC_list <- list(
    houseview_20m        = AMIGO_SVI_20m_houseview_PSC,
    street_20m           = AMIGO_SVI_20m_street_PSC,
    neighborhood_20m     = AMIGO_SVI_20m_neighborhood_PSC,
    houseview_50m        = AMIGO_SVI_50m_houseview_PSC,
    street_50m           = AMIGO_SVI_50m_street_PSC,
    neighborhood_50m     = AMIGO_SVI_50m_neighborhood_PSC,
    houseview_150m       = AMIGO_SVI_150m_houseview_PSC,
    street_150m          = AMIGO_SVI_150m_street_PSC,
    neighborhood_150m    = AMIGO_SVI_150m_neighborhood_PSC,
    houseview_300m       = AMIGO_SVI_300m_houseview_PSC,
    street_300m          = AMIGO_SVI_300m_street_PSC,
    neighborhood_300m    = AMIGO_SVI_300m_neighborhood_PSC,
    houseview_600m       = AMIGO_SVI_600m_houseview_PSC,
    street_600m          = AMIGO_SVI_600m_street_PSC,
    neighboorhood_600m   = AMIGO_SVI_600m_neighborhood_PSC
  )
  


#####bind together and add an ID column
SVI_PSC_RESULTS <- dplyr::bind_rows(SVI_PSC_list, .id = "buffer_and_surveyQ ")

#rename columns
names(SVI_PSC_RESULTS)[names(SVI_PSC_RESULTS) == "estimate"] <- "PSC_estimate"
names(SVI_PSC_RESULTS)[names(SVI_PSC_RESULTS) == "statistic"] <- "t_statistic"

SVI_PSC_RESULTS

#####save results
write.csv(SVI_PSC_RESULTS, "RESULTS/RESULTS_2026/SVI/SVI_partialSpearmancorrelation_FINALRESULTs_CORRECTED.csv")



#####################################################################################################################################
#####extract relevant results to put in paper


#####delete unwanted columns
SVI_PSC_RESULTS_new <- SVI_PSC_RESULTS[, !names(SVI_PSC_RESULTS) %in% c("p.value", "t_statistic", "n", "gp", "Method")]

#####round PSC
SVI_PSC_RESULTS_new$PSC_estimate <- round(SVI_PSC_RESULTS_new$PSC_estimate, 3)

SVI_PSC_RESULTS_new

###########################################################################
###########################CODE FORE ORDINAL REGRESSION ANALYSIS DEMOGRAPGIC VARIABLES FOR HOUSEVIEW, STREET, NEIGHTBORHOOD


#make correct path for libraries
.libPaths()

#upload libraries
library(sp)
library(raster)
library(terra)
library(sf)
library(tiff)
library(stars)
library(units)
library(maptools)
library(devtools)
library(readr)
library(rgdal)
library(dplyr)
library(sf)
library(tidyverse)
library(rgeos)
library(sp)
library(tmap) 
library(raster)
library(sfheaders)
library(knitr)
library(MASS)
library(purrr)
library(broom)
library(ggplot2)



# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

install.packages("PResiduals", lib = "C:/R_temp_library")

library(PResiduals, lib.loc = "C:/R_temp_library")


install.packages("MatrixModels", lib = "C:/R_temp_library")

library(MatrixModels, lib.loc = "C:/R_temp_library")


install.packages("ppcor", lib = "C:/R_temp_library")

library(ppcor, lib.loc = "C:/R_temp_library")





#############################################################################################################################################
#############UPLOAD DATA

model_results <- read.csv("final_results_all_models.csv")



#################################clean results

#delete unwanted columns
model_results$X <- NULL
model_results$geoid <- NULL

#rename columns
names(model_results)[names(model_results) == "bsex"] <- "sex"
names(model_results)[names(model_results) == "ggbstr"] <- "street"
names(model_results)[names(model_results) == "ggbnbh"] <- "neighborhood"
names(model_results)[names(model_results) == "ggbview"] <- "houseview"
names(model_results)[names(model_results) == "gage"] <- "age"

#move age column
model_results <- model_results %>%
  relocate(6, .after = 1)

#make sure all columns are in the correct class
model_results$age <- as.numeric(model_results$age)
model_results$sex <- as.factor(model_results$sex)
model_results$education <- as.factor(model_results$education)
model_results$houseview <- as.numeric(model_results$houseview)

# Convert columns 7 through 104 to numeric
model_results[7:104] <- lapply(model_results[7:104], as.numeric)

###make sure other columns are in correct format
model_results$houseview <- factor(model_results$houseview, ordered = TRUE)
model_results$street <- factor(model_results$street, ordered = TRUE)
model_results$neighborhood <- factor(model_results$neighborhood, ordered = TRUE)
model_results$sex <- factor(model_results$sex)
model_results$education <- factor(model_results$education, ordered = TRUE)
model_results$age <- as.numeric(model_results$age)

#str(model_results)




###################################SEPARATE RESULTS

houseview_results <- model_results[, !names(model_results) %in% c("street", "neighborhood")]

street_results <- model_results[, !names(model_results) %in% c("houseview", "neighborhood")]

neighborhood_results <- model_results[, !names(model_results) %in% c("street", "houseview")]





############################################################################################################################################
#############FIND PARTIAL SPEARMAN CORRELATIONS

partial_spearman <- function(data, outcome, covariates) {
  
  # Identify numeric variables
  numeric_vars <- names(data)[sapply(data, is.numeric)]
  numeric_vars <- setdiff(numeric_vars, c(outcome, covariates))
  
  results <- lapply(numeric_vars, function(var) {
    
    df <- data[, c(outcome, var, covariates)]
    df <- na.omit(df)
    
    # Convert all variables to numeric for pcor()
    df_num <- as.data.frame(lapply(df, function(x) {
      if (is.factor(x)) {
        return(as.numeric(as.character(x)))   # safer than as.numeric(x)
      } else {
        return(as.numeric(x))
      }
    }))
    
    pc <- pcor(df_num, method = "spearman")
    
    tibble(
      variable = var,
      estimate = pc$estimate[1,2],
      p_value = pc$p.value[1,2]
    )
  })
  
  bind_rows(results)
}


covars <- c("age", "sex", "education")





#############################################################CALCULATE PARTIAL SPEARMAN CORRELATIONS FOR EACH SURVEY QUESTION

##########HOUSEVIEW
houseview_partial_Spearman <- partial_spearman(
  data = houseview_results,
  outcome = "houseview",
  covariates = covars
)


##########STREET
street_partial_Spearman <- partial_spearman(
  data = street_results,
  outcome = "street",
  covariates = covars
)

##########NEIGHBORHOOD
neighborhood_partial_Spearman <- partial_spearman(
  data = neighborhood_results,
  outcome = "neighborhood",
  covariates = covars
)



###################################################SAVE RAW RESULTS

write.csv(houseview_partial_Spearman, "RESULTS_2026/houseview_partial_spearman.csv")

write.csv(street_partial_Spearman, "RESULTS_2026/street_partial_spearman.csv")

write.csv(neighborhood_partial_Spearman, "RESULTS_2026/neighborhood_partial_spearman.csv")


################
houseview_partial_Spearman <-read.csv("RESULTS_2026/houseview_partial_spearman.csv")
street_partial_Spearman <-read.csv("RESULTS_2026/street_partial_spearman.csv")
neighborhood_partial_Spearman <-read.csv("RESULTS_2026/neighborhood_partial_spearman.csv")



################################ROUND RESULTS
houseview_partial_Spearman$estimate <- round(houseview_partial_Spearman$estimate, 3)
street_partial_Spearman$estimate <- round(street_partial_Spearman$estimate, 3)
neighborhood_partial_Spearman$estimate <- round(neighborhood_partial_Spearman$estimate, 3)





###################################FINALIZE RESULTS

#rename columns
names(houseview_partial_Spearman)[names(houseview_partial_Spearman) == "estimate"] <- "houseview_partial_Spearman"
names(street_partial_Spearman)[names(street_partial_Spearman) == "estimate"] <- "street_partial_Spearman"
names(neighborhood_partial_Spearman)[names(neighborhood_partial_Spearman) == "estimate"] <- "neighborhood_partial_Spearman"

#combine results
combined_results <- houseview_partial_Spearman %>%
  left_join(street_partial_Spearman, by = "variable") %>%
  left_join(neighborhood_partial_Spearman, by = "variable")


#drop p values
combined_results$p_value.x <- NULL
combined_results$p_value.y <- NULL
combined_results$p_value <- NULL



################################SAVE RESULTS
write.csv(combined_results, "RESULTS_2026/partial_spearman_ALL_RESULTS.csv")

combined_results <- read.csv( "RESULTS_2026/partial_spearman_ALL_RESULTS.csv")



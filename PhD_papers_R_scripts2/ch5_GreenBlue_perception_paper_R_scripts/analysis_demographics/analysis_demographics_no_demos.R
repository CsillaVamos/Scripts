###########################################################################
###########################CODE FORE ORDINAL REGRESSION ANALYSIS FOR GREEN-BLUE SPACE PERCEPTION PAPER NO DEMOGRAPHICS


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
library(broom)



# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("pscl", lib = "C:/R_temp_library")

# Load the package from that location
library(pscl, lib.loc = "C:/R_temp_library")


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("sjPlot", lib = "C:/R_temp_library")

# Load the package from that location
library(sjPlot, lib.loc = "C:/R_temp_library")

# Install glmnet to that folder
install.packages("parameters", lib = "C:/R_temp_library")

# Load the package from that location
library(parameters, lib.loc = "C:/R_temp_library")


# Install glmnet to that folder
install.packages("effects", lib = "C:/R_temp_library")

# Load the package from that location
library(effects, lib.loc = "C:/R_temp_library")


# Install to that folder
install.packages("ordinalNet", lib = "C:/R_temp_library")

# Load the package from that location
library(ordinalNet, lib.loc = "C:/R_temp_library")


# Install to that folder
install.packages("car", lib = "C:/R_temp_library")

# Load the package from that location
library(car, lib.loc = "C:/R_temp_library")


# Set a safe local directory, like your Documents
setwd("C:/Users/vamos003/Documents")
install.packages("pbkrtest")
install.packages("car")



#########################################################################################################################
######upload and prepare data

###demographics data
demographics <- read.csv("RESULTS/Amigo_demographics.csv")

#results
results <- read.csv("RESULTS/Amigo_final_results.csv")


#####merge demographics data with each result data set
merged_data <- merge(demographics, results, by = "geoid")


# Add prefix "variable_" to column names from the nth column onward
#names(merged_data)[25:ncol(merged_data)] <- paste0("variable_", names(merged_data)[25:ncol(merged_data)])

#delete unwanted columns
merged_data <- merged_data[ , !(names(merged_data) %in% c("X", "bsex.y", "cohort1.y", "education.y", "gedate.y", "qc2023.y", "ggbcity.y", "ggbarea.y", "gage.y")) ]

#rename rows for clarity
names(merged_data)[names(merged_data) == "bsex.x"] <- "bsex"
names(merged_data)[names(merged_data) == "cohort1.x" ] <- "cohort1" 
names(merged_data)[names(merged_data) == "education.x"  ] <- "education"
names(merged_data)[names(merged_data) == "gedate.x"] <- "gedate"
names(merged_data)[names(merged_data) == "qc2023.x"] <- "qc2023"
names(merged_data)[names(merged_data) == "ggbcity.x"] <- "ggbcity"
names(merged_data)[names(merged_data) == "ggbarea.x"] <- "ggbarea"
names(merged_data)[names(merged_data) == "gage.x"] <- "gage"
names(merged_data)[names(merged_data) == "gage"] <- "age"
names(merged_data)[names(merged_data) == "bsex"] <- "sex"
names(merged_data)[names(merged_data) == "E_20m_NDVI_bl_mean_x"] <- "E_20m_NDVI_bl_mean"


#delete more unwanted columns
merged_data <- merged_data[ , !(names(merged_data) %in% c("cohort1", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity", "ggbarea", "ggbview", "E_20m_NDVI_bl_mean_y")) ]


head(merged_data)

# Make sure survey data is ordered factor
merged_data$houseview   <- ordered(merged_data$houseview, levels = 1:5)
merged_data$street      <- ordered(merged_data$street, levels = 1:5)
merged_data$nghbrhd <- ordered(merged_data$nghbrhd, levels = 1:5)



merged_data <- merged_data[ , !(names(merged_data) %in% c("geoid")) ]




#############################################################################################################
#############################################################################################################
#############################################################################################################     
#############################################################################################################
##########################ordinal regression analysis



#############################################################################################################
#############################################################################################################
#############################################################################################################
###########################HOUSEVIEW

setwd("RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/houseview_no_demo_results/")

# 1. Ensure houseview is an ordered factor
merged_data$houseview <- factor(merged_data$houseview, ordered = TRUE)

# 2. Identify predictor variables (excluding age, sex, education)
exclude_vars <- c("houseview", "street", "nghbrhd", "age", "sex", "education")
predictor_vars <- setdiff(names(merged_data), exclude_vars)

# 3. Loop through each predictor variable
for (var in predictor_vars) {
  
  formula_str <- paste("houseview ~", var)
  formula <- as.formula(formula_str)
  
  fit_result <- try(polr(formula, data = merged_data, Hess = TRUE), silent = TRUE)
  
  if (inherits(fit_result, "try-error")) {
    message(paste("Model failed for variable:", var))
    next
  }
  
  coef_df <- as.data.frame(coef(summary(fit_result)))
  
  output_file <- paste0("no_d", var, ".csv")
  write.csv(coef_df, file = output_file, row.names = TRUE)
}

########################################################
####### Analyzing houseview ordinal regression results

setwd("RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/houseview_no_demo_results/")

# Set the folder containing your regression CSV files
results_path <- "RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/houseview_no_demo_results/"

# List all CSV files
csv_files <- list.files(path = results_path, pattern = "\\.csv$", full.names = TRUE)

# Initialize a list to store results
all_results_list <- list()

# Loop through files and extract coefficients
for (file in csv_files) {
  df <- read.csv(file)
  
  # Reset column names
  #names(df) <- c("value", "std_error", "t value")
  
  # Add term and model variable
  df$term <- rownames(df)
  df$model_variable <- tools::file_path_sans_ext(basename(file))
  df$model_variable <- gsub("polr_summary_", "", df$model_variable)
  
  all_results_list[[length(all_results_list) + 1]] <- df
}

# Combine all results
all_results <- bind_rows(all_results_list)

# Compute p-values and FDR
all_results <- all_results %>%
  mutate(
    p_value = 2 * pnorm(abs(t value), lower.tail = FALSE)
  ) %>%
  group_by(term) %>%
  mutate(p_fdr = p.adjust(p_value, method = "fdr")) %>%
  ungroup()

# Save all results
write_csv(all_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/houseview_age_OR_analysis/aggregated_houseview_results_all_varsno_demos.csv")

# Filter significant results
signif_results <- all_results %>%
  filter(p_fdr < 0.05, abs(value) > 0.1)

# Save significant results
write_csv(signif_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/houseview_age_OR_analysis/houseview_OR_signigicant_resultsno_demos.csv")




#############################################################################################################
#############################################################################################################
#############################################################################################################
###########################STREET

setwd( "RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_OR_results/")

# 1. Ensure street is an ordered factor
merged_data$street <- factor(merged_data$street, ordered = TRUE)

# 2. Identify predictor variables (excluding age, sex, education)
exclude_vars <- c("houseview", "street", "nghbrhd", "age", "sex", "education")
predictor_vars <- setdiff(names(merged_data), exclude_vars)

# 3. Loop through each predictor variable
for (var in predictor_vars) {
  
  formula_str <- paste("street ~", var)
  formula <- as.formula(formula_str)
  
  fit_result <- try(polr(formula, data = merged_data, Hess = TRUE), silent = TRUE)
  
  if (inherits(fit_result, "try-error")) {
    message(paste("Model failed for variable:", var))
    next
  }
  
  coef_df <- as.data.frame(coef(summary(fit_result)))
  
  output_file <- paste0("no_d", var, ".csv")
  write.csv(coef_df, file = output_file, row.names = TRUE)
}



########################################################
####### Analyzing street ordinal regression results


setwd("RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/street_no_demo_results/")


# Set the folder containing your regression CSV files
results_path <- "RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_OR_results/"

# List all CSV files
csv_files <- list.files(path = results_path, pattern = "\\.csv$", full.names = TRUE)

# Initialize a list to store results
all_results_list <- list()

# Loop through files and extract coefficients
for (file in csv_files) {
  df <- read.csv(file)
  
  # Reset column names
  names(df) <- c("term", "value", "std_error", "t_value")
  
  # Add term and model variable
  df$term <- rownames(df)
  df$model_variable <- tools::file_path_sans_ext(basename(file))
  df$model_variable <- gsub("polr_summary_", "", df$model_variable)
  
  all_results_list[[length(all_results_list) + 1]] <- df
}

# Combine all results
all_results <- bind_rows(all_results_list)

# Compute p-values and FDR
all_results <- all_results %>%
  mutate(
    p_value = 2 * pnorm(abs(t value), lower.tail = FALSE)
  ) %>%
  group_by(term) %>%
  mutate(p_fdr = p.adjust(p_value, method = "fdr")) %>%
  ungroup()


# Save all results
write_csv(all_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_age_OR_analysis/aggregated_street_results_all_varsno_demos.csv")

# Filter significant results
signif_results <- all_results %>%
  filter(p_fdr < 0.05, abs(value) > 0.1)

# Save significant results
write_csv(signif_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_age_OR_analysis/street_OR_signigicant_resultsno_demos.csv")




#############################################################################################################
#############################################################################################################
#############################################################################################################
###########################NGHBRHD

setwd( "RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_OR_results/")

# 1. Ensure neighborhood is an ordered factor
merged_data$nghbrhd <- factor(merged_data$nghbrhd, ordered = TRUE)

# 2. Identify predictor variables (excluding age, sex, education)
exclude_vars <- c("houseview", "street", "nghbrhd", "age", "sex", "education")
predictor_vars <- setdiff(names(merged_data), exclude_vars)

# 3. Loop through each predictor variable
for (var in predictor_vars) {
  
  formula_str <- paste("nghbrhd ~", var)
  formula <- as.formula(formula_str)
  
  fit_result <- try(polr(formula, data = merged_data, Hess = TRUE), silent = TRUE)
  
  if (inherits(fit_result, "try-error")) {
    message(paste("Model failed for variable:", var))
    next
  }
  
  coef_df <- as.data.frame(coef(summary(fit_result)))
  
  output_file <- paste0("no_d", var, ".csv")
  write.csv(coef_df, file = output_file, row.names = TRUE)
}



########################################################
####### Analyzing neighborhood ordinal regression results


setwd("RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/neighborhood_no_demo_results/")


# Set the folder containing your regression CSV files
results_path <- "RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_OR_results/"

# List all CSV files
csv_files <- list.files(path = results_path, pattern = "\\.csv$", full.names = TRUE)

# Initialize a list to store results
all_results_list <- list()

# Loop through files and extract coefficients
for (file in csv_files) {
  df <- read.csv(file)
  
  # Reset column names
  names(df) <- c("term", "value", "std_error", "t_value")
  
  # Add term and model variable
  df$term <- rownames(df)
  df$model_variable <- tools::file_path_sans_ext(basename(file))
  df$model_variable <- gsub("polr_summary_", "", df$model_variable)
  
  all_results_list[[length(all_results_list) + 1]] <- df
}

# Combine all results
all_results <- bind_rows(all_results_list)

# Compute p-values and FDR
all_results <- all_results %>%
  mutate(
    p_value = 2 * pnorm(abs(t value), lower.tail = FALSE)
  ) %>%
  group_by(term) %>%
  mutate(p_fdr = p.adjust(p_value, method = "fdr")) %>%
  ungroup()


# Save all results
write_csv(all_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_age_OR_analysis/aggregated_nghbrhd_results_all_varsno_demos.csv")

# Filter significant results
signif_results <- all_results %>%
  filter(p_fdr < 0.05, abs(value) > 0.1)

# Save significant results
write_csv(signif_results, "RESULTS/results_stratified_by_demographics/ordinal_regression_results/neighborhood_age_OR_analysis/neighborhood_OR_signigicant_resultsno_demos.csv")

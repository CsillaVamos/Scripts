###########################################################################
###########################Euclidean buffer model VECTOR DATA FINAL VERSION 

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


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("pscl", lib = "C:/R_temp_library")

# Load the package from that location
library(pscl, lib.loc = "C:/R_temp_library")


#########################################################################################################################
######upload and prepare data

###demographics data
demographics <- read.csv("Data/Amigo_FUP2023.csv")

#results
model_results <- read.csv("final_results/final_results3.csv")


#####merge demographics data with each result data set

results_demo <- merge(demographics, model_results, by = "geoid")

head(results_demo)
nrow(results_demo)
colnames(results_demo)


# Add prefix "variable_" to column names from the nth column onward
names(results_demo)[25:ncol(results_demo)] <- paste0("variable_", names(results_demo)[25:ncol(results_demo)])

#delete unwanted columns
results_demo <- results_demo[ , !(names(results_demo) %in% c("X", "bsex.y", "cohort1.y", "education.y", "gedate.y", "qc2023.y", "ggbcity.y", "ggbarea.y", "gage.y")) ]


#rename rows for clarity
names(results_demo)[names(results_demo) == "bsex.x"] <- "bsex"
names(results_demo)[names(results_demo) == "cohort1.x" ] <- "cohort1" 
names(results_demo)[names(results_demo) == "education.x"  ] <- "education"
names(results_demo)[names(results_demo) == "gedate.x"] <- "gedate"
names(results_demo)[names(results_demo) == "qc2023.x"] <- "qc2023"
names(results_demo)[names(results_demo) == "ggbcity.x"] <- "ggbcity"
names(results_demo)[names(results_demo) == "ggbarea.x"] <- "ggbarea"
names(results_demo)[names(results_demo) == "gage.x"] <- "gage"

head(results_demo)





###############################################################################################################################
###############################################################################################################################
###############analysis of street perception with sex


##########Step 1: Create correlations between "street" and the 90 green exposure columns 


# Identify the green exposure columns (excluding "street" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview"))

# Correlation between "street" and each green column
cor_results <- sapply(results_demo[green_cols], function(x) cor(results_demo$street, x, use = "complete.obs"))

# Convert to a data frame for readability
cor_df <- data.frame(
  variable = names(cor_results),
  correlation = cor_results
)

# View result
head(cor_df)
nrow(cor_df)



#############Step 2: Examine correlations separately for males and females

# Split by sex and compute correlations
cor_by_sex <- results_demo %>%
  group_by(bsex) %>%
  summarise(across(all_of(green_cols), ~cor(street, ., use = "complete.obs"))) %>%
  pivot_longer(-bsex, names_to = "variable", values_to = "correlation")

# For male
cor_male <- cor_by_sex %>%
  dplyr::filter(bsex == 0) %>%
  rename(correlation_male = correlation) %>%
  dplyr::select(variable, correlation_male)

# For female
cor_female <- cor_by_sex %>%
  dplyr::filter(bsex == 1) %>%
  rename(correlation_female = correlation) %>%
  dplyr::select(variable, correlation_female)

# Join and compute difference
cor_comparison <- left_join(cor_male, cor_female, by = "variable") %>%
  mutate(diff = correlation_male - correlation_female)

# View the result
head(cor_comparison)


############step 3: test if results are statistically significant

#Define a function to perform the Fisher r-to-z test
fisher_z_test <- function(r1, n1, r2, n2) {
  # Fisher z transformation
  z1 <- 0.5 * log((1 + r1) / (1 - r1))
  z2 <- 0.5 * log((1 + r2) / (1 - r2))
  
  # Standard error
  se <- sqrt(1 / (n1 - 3) + 1 / (n2 - 3))
  
  # z statistic and p-value
  z <- (z1 - z2) / se
  p <- 2 * (1 - pnorm(abs(z)))
  
  return(data.frame(z_score = z, p_value = p))
}


#Count number of male and female participants
n_male <- results_demo %>% filter(bsex == 0) %>% nrow()
n_female <- results_demo %>% filter(bsex == 1) %>% nrow()


#Apply the test across all green exposure variables
# Add p-values using Fisher's test
cor_comparison_stats <- cor_comparison %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_male, n_male, correlation_female, n_female)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(-test) %>%
  ungroup()

# View significant results (e.g., p < 0.05)
cor_comparison_stats %>% filter(p_value < 0.05)


write.csv(cor_comparison_stats, "RESULTS/results_stratified_by_demographics/demograics_Street_sex.csv")


###########step 4: plot resuts


# Volcano-style plot: Difference vs. significance
ggplot(cor_comparison_stats, aes(x = diff, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  labs(
    title = "Difference in Correlation (Male - Female) vs. Significance",
    x = "Difference in Correlation (Male - Female)",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()



#Side-by-side correlation plot: Male vs. Female correlations
ggplot(cor_comparison_stats, aes(x = correlation_male, y = correlation_female)) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray") +
  geom_point(aes(color = p_value < 0.05), size = 2) +
  labs(
    title = "Correlation of Green Exposure vs Perceived Greenness",
    x = "Male Correlation",
    y = "Female Correlation",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()








###############################################################################################################################
###############################################################################################################################
###############analysis of street perception with education


##########Step 1: Create correlations between "nghbrhd" and the 90 green exposure columns 
# Identify the green exposure columns (excluding "nghbrhd" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))

###########step 2: correlation per edu level
# Correlation between "street" and each green column
cor_by_edu <- results_demo %>%
  group_by(education) %>%
  summarise(across(all_of(green_cols), ~cor(street, ., use = "complete.obs"))) %>%
  pivot_longer(-education, names_to = "variable", values_to = "correlation")


##########step3: add group sizes
edu_sizes <- results_demo %>%
  group_by(education) %>%
  summarise(n = n())

cor_with_n_edu <- cor_by_edu %>%
  left_join(edu_sizes, by = "education")



##########step4: compare to reference group

###edu = 1
reference_edu <- 1  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_street_edu_low.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_street_edu_low_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (low)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 2
reference_edu <- 2  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_street_edu_medium.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_street_edu_medium_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (medium)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 3
reference_edu <- 3  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_street_edu_high.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_street_edu_high_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (high)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()








###############################################################################################################################
###############################################################################################################################
###############analysis of nghbrhd perception with education


##########Step 1: Create correlations between "nghbrhd" and the 90 green exposure columns 
# Identify the green exposure columns (excluding "nghbrhd" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))

###########step 2: correlation per edu level
# Correlation between "nghbrhd" and each green column
cor_by_edu <- results_demo %>%
  group_by(education) %>%
  summarise(across(all_of(green_cols), ~cor(nghbrhd, ., use = "complete.obs"))) %>%
  pivot_longer(-education, names_to = "variable", values_to = "correlation")


##########step3: add group sizes
edu_sizes <- results_demo %>%
  group_by(education) %>%
  summarise(n = n())

cor_with_n_edu <- cor_by_edu %>%
  left_join(edu_sizes, by = "education")



##########step4: compare to reference group

###edu = 1
reference_edu <- 1  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_edu_low.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_nghbrhd_edu_low_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (low)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 2
reference_edu <- 2  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_edu_medium.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_nghbrhd_edu_medium_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (medium)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 3
reference_edu <- 3  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_edu_high.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_nghbrhd_edu_high_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (high)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()







###############################################################################################################################
###############################################################################################################################
###############analysis of houseview perception with education


##########Step 1: Create correlations between "nghbrhd" and the 90 green exposure columns 
# Identify the green exposure columns (excluding "nghbrhd" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))

###########step 2: correlation per edu level
# Correlation between "houseview" and each green column
cor_by_edu <- results_demo %>%
  group_by(education) %>%
  summarise(across(all_of(green_cols), ~cor(houseview, ., use = "complete.obs"))) %>%
  pivot_longer(-education, names_to = "variable", values_to = "correlation")


##########step3: add group sizes
edu_sizes <- results_demo %>%
  group_by(education) %>%
  summarise(n = n())

cor_with_n_edu <- cor_by_edu %>%
  left_join(edu_sizes, by = "education")



##########step4: compare to reference group

###edu = 1
reference_edu <- 1  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_houseview_edu_low.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_houseview_edu_low_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (low)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 2
reference_edu <- 2  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_houseview_edu_medium.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_houseview_edu_medium_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (medium)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()




###edu = 3
reference_edu <- 3  # medium education level

cor_ref <- cor_with_n_edu %>% filter(education == reference_edu)
cor_others <- cor_with_n_edu %>% filter(education != reference_edu)


#fisher r-to-z test
cor_comparison_edu <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  dplyr::rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(education, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()

write.csv(cor_comparison_edu, "RESULTS/results_stratified_by_demographics/demographics_houseview_edu_high.csv")


# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_edu %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/significant_values/demographics_houseview_edu_high_SIGNIFICANT.csv" )



#plot results
ggplot(cor_comparison_edu, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~education, labeller = label_both) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation by Education Level vs. Reference (high)",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()



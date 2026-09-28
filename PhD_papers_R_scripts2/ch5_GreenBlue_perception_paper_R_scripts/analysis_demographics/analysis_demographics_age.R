###########################################################################
###########################Euclidean buffer model VECTOR DATA FINAL VERSION 

#make correct path for libraries
.libPaths("C://Users/vamos003/OneDrive - Universiteit Utrecht/R/win-library/4.1")

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
###############analysis of street perception with age


###########Step 1: create 10 year age groups
results_demo <- results_demo %>%
  mutate(age_group = cut(gage, breaks = seq(40, 80, by = 10), right = FALSE))



##########Step 2:  Compute correlations within each age group


# Identify the green exposure columns (excluding "street" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))


# Compute correlation between street and green exposure columns by age group
cor_by_age <- results_demo %>%
  group_by(age_group) %>%
  summarise(across(all_of(green_cols), ~cor(street, ., use = "complete.obs"))) %>%
  pivot_longer(-age_group, names_to = "variable", values_to = "correlation")

# View result
head(cor_by_age)
nrow(cor_by_age)


##########step 3: count sample size per age group
group_sizes <- results_demo %>%
  group_by(age_group) %>%
  summarise(n = n())


###########step 4: join sizes with correlations
cor_with_n <- cor_by_age %>%
  left_join(group_sizes, by = "age_group")


###########step 5: run Fisher's r-to-z test vs. a reference age group
fisher_z_test <- function(r1, n1, r2, n2) {
  z1 <- 0.5 * log((1 + r1) / (1 - r1))
  z2 <- 0.5 * log((1 + r2) / (1 - r2))
  se <- sqrt(1 / (n1 - 3) + 1 / (n2 - 3))
  z <- (z1 - z2) / se
  p <- 2 * (1 - pnorm(abs(z)))
  return(data.frame(z_score = z, p_value = p))
}


##########step 6:run test with each age group as a reference group

###40-50
reference_group <- "[40,50)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_street_age40to50.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_street_age40to50_SIGNIFICANT.csv" )



###50-60
reference_group <- "[50,60)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_street_age50to60.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_street_age50to60_SIGNIFICANT.csv" )




###60-70
reference_group <- "[60,70)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_street_age60to70.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_street_age60to70_SIGNIFICANT.csv" )




###70-80
reference_group <- "[70,80)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_street_age70to80.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_street_age70to80_SIGNIFICANT.csv" )







###############################################################################################################################
###############################################################################################################################
###############analysis of neighborhood perception with age


###########Step 1: create 10 year age groups
results_demo <- results_demo %>%
  mutate(age_group = cut(gage, breaks = seq(40, 80, by = 10), right = FALSE))



##########Step 2:  Compute correlations within each age group


# Identify the green exposure columns (excluding "street" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))


# Compute correlation between street and green exposure columns by age group
cor_by_age <- results_demo %>%
  group_by(age_group) %>%
  summarise(across(all_of(green_cols), ~cor(nghbrhd, ., use = "complete.obs"))) %>%
  pivot_longer(-age_group, names_to = "variable", values_to = "correlation")

# View result
head(cor_by_age)
nrow(cor_by_age)


##########step 3: count sample size per age group
group_sizes <- results_demo %>%
  group_by(age_group) %>%
  summarise(n = n())


###########step 4: join sizes with correlations
cor_with_n <- cor_by_age %>%
  left_join(group_sizes, by = "age_group")


###########step 5: run Fisher's r-to-z test vs. a reference age group
fisher_z_test <- function(r1, n1, r2, n2) {
  z1 <- 0.5 * log((1 + r1) / (1 - r1))
  z2 <- 0.5 * log((1 + r2) / (1 - r2))
  se <- sqrt(1 / (n1 - 3) + 1 / (n2 - 3))
  z <- (z1 - z2) / se
  p <- 2 * (1 - pnorm(abs(z)))
  return(data.frame(z_score = z, p_value = p))
}


##########step 6:run test with each age group as a reference group

###40-50
reference_group <- "[40,50)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age40to50.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age40to50_SIGNIFICANT.csv" )



###50-60
reference_group <- "[50,60)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age50to60.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age50to60_SIGNIFICANT.csv" )




###60-70
reference_group <- "[60,70)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age60to70.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age60to70_SIGNIFICANT.csv" )




###70-80
reference_group <- "[70,80)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age70to80.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_nghbrhd_age70to80_SIGNIFICANT.csv" )











###############################################################################################################################
###############################################################################################################################
###############analysis of house view perception with age


###########Step 1: create 10 year age groups
results_demo <- results_demo %>%
  mutate(age_group = cut(gage, breaks = seq(40, 80, by = 10), right = FALSE))



##########Step 2:  Compute correlations within each age group


# Identify the green exposure columns (excluding "street" and "bsex")
green_cols <- setdiff(names(results_demo), c("geoid", "bsex", "cohort1", "education", "gedate", "qc2023", "ggbstr", "ggbnbh", "ggbcity","ggbarea","ggbview","gage", "street","nghbrhd","houseview", "age_group"))


# Compute correlation between street and green exposure columns by age group
cor_by_age <- results_demo %>%
  group_by(age_group) %>%
  summarise(across(all_of(green_cols), ~cor(houseview, ., use = "complete.obs"))) %>%
  pivot_longer(-age_group, names_to = "variable", values_to = "correlation")

# View result
head(cor_by_age)
nrow(cor_by_age)


##########step 3: count sample size per age group
group_sizes <- results_demo %>%
  group_by(age_group) %>%
  summarise(n = n())


###########step 4: join sizes with correlations
cor_with_n <- cor_by_age %>%
  left_join(group_sizes, by = "age_group")


###########step 5: run Fisher's r-to-z test vs. a reference age group
fisher_z_test <- function(r1, n1, r2, n2) {
  z1 <- 0.5 * log((1 + r1) / (1 - r1))
  z2 <- 0.5 * log((1 + r2) / (1 - r2))
  se <- sqrt(1 / (n1 - 3) + 1 / (n2 - 3))
  z <- (z1 - z2) / se
  p <- 2 * (1 - pnorm(abs(z)))
  return(data.frame(z_score = z, p_value = p))
}


##########step 6:run test with each age group as a reference group

###40-50
reference_group <- "[40,50)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_houseview_age40to50.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_houseview_age40to50_SIGNIFICANT.csv" )



###50-60
reference_group <- "[50,60)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_houseview_age50to60.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_houseview_age50to60_SIGNIFICANT.csv" )




###60-70
reference_group <- "[60,70)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_houseview_age60to70.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_houseview_age60to70_SIGNIFICANT.csv" )




###70-80
reference_group <- "[70,80)"

cor_ref <- cor_with_n %>% dplyr::filter(age_group == reference_group)
cor_others <- cor_with_n %>% dplyr::filter(age_group != reference_group)


#compare all other age groups to the reference
cor_comparison_age <- cor_others %>%
  left_join(
    cor_ref %>% dplyr::select(variable, correlation_ref = correlation, n_ref = n),
    by = "variable"
  ) %>%
  rename(correlation_other = correlation, n_other = n) %>%
  rowwise() %>%
  mutate(
    test = list(fisher_z_test(correlation_other, n_other, correlation_ref, n_ref)),
    z_score = test$z_score,
    p_value = test$p_value
  ) %>%
  dplyr::select(age_group, variable, correlation_other, correlation_ref, z_score, p_value) %>%
  ungroup()


write.csv(cor_comparison_age, "RESULTS/results_stratified_by_demographics/demographics_houseview_age70to80.csv")

# View significant results (e.g., p < 0.05)
core_sig_values <- cor_comparison_age %>% filter(p_value < 0.05)

core_sig_values

write.csv(core_sig_values, "RESULTS/results_stratified_by_demographics/demographics_houseview_age70to80_SIGNIFICANT.csv" )






###########step 7: plot
ggplot(cor_comparison_age, aes(x = correlation_other - correlation_ref, y = -log10(p_value))) +
  geom_point(aes(color = p_value < 0.05)) +
  facet_wrap(~age_group) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Difference in Correlation (Age Group - [70,80)) vs. Significance",
    x = "Difference in Correlation",
    y = "-log10(p-value)",
    color = "Significant (p < 0.05)"
  ) +
  theme_minimal()


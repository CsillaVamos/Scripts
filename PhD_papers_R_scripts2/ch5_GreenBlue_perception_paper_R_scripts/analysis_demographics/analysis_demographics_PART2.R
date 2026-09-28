################################################################################################
#########################################################################################
###########ANALYIS OF DEMOGRAPHICS PART 2: comparing the difference between ordinal regressions with and without demographic variables for each survey question



###########################################################################################################
######################################################################################################
#############################################################################################
##############HOUSEVIEW

####upload OR results

houseview_no_demos <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/no_demo_results/houseview_no_demo_results/houseview_no_d_all.csv")

houseview <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/houseview_age_OR_analysis/aggregated_houseview_results_all_vars.csv")


#####organize results

head(houseview_no_demos)
head(houseview)

#remove unnecessary rows
houseview_no_demos2 <- houseview_no_demos[!apply(houseview_no_demos, 1, function(row) any(grepl("\\|", row))), ]

#remove unnecessary text and columns
houseview_no_demos2$predictor <- NULL
names(houseview_no_demos2)[names(houseview_no_demos2) == "Value"] <- "value"
names(houseview_no_demos2)[names(houseview_no_demos2) == "Std..Error"] <- "std_error"
names(houseview_no_demos2)[names(houseview_no_demos2) == "t.value"] <- "t_value"
names(houseview_no_demos2)[names(houseview_no_demos2) == "term"] <- "model_variable"


houseview$model_variable <- gsub("polr_summary_", "", houseview$model_variable) 
houseview$p_value <- NULL
houseview$p_fdr <- NULL


# Add a new column to label each dataset
houseview_no_demos2$OR_type <- "No Demographics"
houseview$OR_type <- "With Demographics"

# Ensure consistent column names for joining
colnames(houseview_no_demos2)[which(names(houseview_no_demos2) == "model_variable")] <- "variable"
colnames(houseview)[which(names(houseview) == "model_variable")] <- "variable"

###replace TH with TC in variable column
houseview_no_demos2$variable <- gsub("TH", "TC", houseview_no_demos2$variable)

###replace TH with TC in variable column
houseview$variable <- gsub("TH", "TC", houseview$variable)

head(houseview)
head(houseview_no_demos2)




#################################################################################################################
#plotting the change in coeffients between OR with demographics and OR without demographics



# Helper function to get change data for a demographic
get_change_data <- function(demo_name) {
  demo_df <- houseview[houseview$term == demo_name, ]
  
  inner_join(
    houseview_no_demos2 %>% 
      dplyr::select(variable, value) %>% 
      rename(value_no_demo = value),
    demo_df %>% 
      dplyr::select(variable, value) %>% 
      rename(value_demo = value),
    by = "variable"
  ) %>%
    mutate(
      change = value_demo - value_no_demo,
      demographic = demo_name
    )
}

# Combine all demographics into one dataframe
all_changes <- bind_rows(
  get_change_data("age"),
  get_change_data("sex1"),
  get_change_data("education2"),
  get_change_data("education3")
)

# One combined plot
ggplot(all_changes, aes(x = variable, y = change, fill = demographic)) +
  geom_col(position = "dodge") +
  labs(
    title = "Change in Coefficients After Adding Demographic Variables: HOUSEVIEW",
    x = "Model",
    y = "Change in beta variable (With demographic variables - Without)"
  ) +
  scale_fill_discrete(
    name = "Demographic Variable",               # Legend title
    labels = c("Age", "Sex (female)", "Medium education", "High education") # Labels in order
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 4))


ggsave("RESULTS/results_stratified_by_demographics/ordinal_regression_results/houseview_plot_alldemos_and_nodemose_CHANGE.png", width = 10, height = 6, dpi = 300, bg = "white")





###########################################################################################################
######################################################################################################
#############################################################################################
##############STREET

####upload OR results

street_no_demos <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_age_OR_analysis/aggregated_street_results_all_varsno_demos.csv")

street <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_age_OR_analysis/aggregated_street_results_all_vars.csv")





#####organize results

head(street_no_demos)
head(street)

#remove unnecessary rows
street_no_demos2 <- street_no_demos[!apply(street_no_demos, 1, function(row) any(grepl("\\|", row))), ]

#remove unnecessary text and columns
street_no_demos2$predictor <- NULL
street_no_demos2$model_variable <- gsub("no_dD_", "", street_no_demos2$model_variable) 
names(street_no_demos2)[names(street_no_demos2) == "Value"] <- "value"
names(street_no_demos2)[names(street_no_demos2) == "Std..Error"] <- "std_error"
names(street_no_demos2)[names(street_no_demos2) == "t.value"] <- "t_value"
names(street_no_demos2)[names(street_no_demos2) == "term"] <- "s_answr"


street$model_variable <- gsub("polr_summary_", "", street$model_variable) 
street$p_value <- NULL
street$p_fdr <- NULL


# Add a new column to label each dataset
street_no_demos2$OR_type <- "No Demographics"
street$OR_type <- "With Demographics"

# Ensure consistent column names for joining
colnames(street_no_demos2)[which(names(street_no_demos2) == "model_variable")] <- "variable"
colnames(street)[which(names(street) == "model_variable")] <- "variable"

###replace TH with TC in variable column
street_no_demos2$variable <- gsub("TH", "TC", street_no_demos2$variable)

###replace TH with TC in variable column
street$variable <- gsub("TH", "TC", street$variable)

street_no_demos2$s_answr <- NULL

head(street)
head(street_no_demos2)



#################################################################################################################
#plotting the change in coeffients between OR with demographics and OR without demographics


# Helper function to get change data for a demographic
get_change_data <- function(demo_name) {
  demo_df <- street[street$term == demo_name, ]
  
  no_demo <- street_no_demos2 %>%
    dplyr::select(variable, value) %>%
    dplyr::rename(value_no_demo = value)
  
  demo_only <- demo_df %>%
    dplyr::select(variable, value) %>%
    dplyr::rename(value_demo = value)
  
  dplyr::inner_join(no_demo, demo_only, by = "variable") %>%
    dplyr::mutate(
      change = value_demo - value_no_demo,
      demographic = demo_name
    )
}


# Combine all demographics into one dataframe
all_changes <- bind_rows(
  get_change_data("age"),
  get_change_data("sex1"),
  get_change_data("education2"),
  get_change_data("education3")
)

# One combined plot
ggplot(all_changes, aes(x = variable, y = change, fill = demographic)) +
  geom_col(position = "dodge") +
  labs(
    title = "Change in Coefficients After Adding Demographic Variables: STREET",
    x = "Model",
    y = "Change in beta variable (With demographic variables - Without)"
  ) +
  scale_fill_discrete(
    name = "Demographic Variable",               # Legend title
    labels = c("Age", "Sex (female)", "Medium education", "High education") # Labels in order
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 4))


ggsave("RESULTS/results_stratified_by_demographics/ordinal_regression_results/street_plot_alldemos_and_nodemose_CHANGE.png", width = 10, height = 6, dpi = 300, bg = "white")



###########################################################################################################
######################################################################################################
#############################################################################################
##############NEIGHBORHOOD

####upload OR results

nghbrhd_no_demos <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_age_OR_analysis/aggregated_nghbrhd_results_all_varsno_demos.csv")


nghbrhd <- read.csv("RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_age_OR_analysis/aggregated_nghbrhd_results_all_vars.csv")



#####organize results

head(nghbrhd_no_demos)
head(nghbrhd)

#remove unnecessary rows
nghbrhd_no_demos2 <- nghbrhd_no_demos[!apply(nghbrhd_no_demos, 1, function(row) any(grepl("\\|", row))), ]

#remove unnecessary text and columns
nghbrhd_no_demos2$predictor <- NULL
names(nghbrhd_no_demos2)[names(nghbrhd_no_demos2) == "Value"] <- "value"
names(nghbrhd_no_demos2)[names(nghbrhd_no_demos2) == "Std..Error"] <- "std_error"
names(nghbrhd_no_demos2)[names(nghbrhd_no_demos2) == "t.value"] <- "t_value"
names(nghbrhd_no_demos2)[names(nghbrhd_no_demos2) == "term"] <- "model_variable"


nghbrhd$model_variable <- gsub("polr_summary_", "", nghbrhd$model_variable) 
nghbrhd$p_value <- NULL
nghbrhd$p_fdr <- NULL


# Add a new column to label each dataset
nghbrhd_no_demos2$OR_type <- "No Demographics"
nghbrhd$OR_type <- "With Demographics"

# Ensure consistent column names for joining
colnames(nghbrhd_no_demos2)[which(names(nghbrhd_no_demos2) == "model_variable")] <- "variable"
colnames(nghbrhd)[which(names(nghbrhd) == "model_variable")] <- "variable"

###replace TH with TC in variable column
nghbrhd_no_demos2$variable <- gsub("TH", "TC", nghbrhd_no_demos2$variable)

###replace TH with TC in variable column
nghbrhd$variable <- gsub("TH", "TC", nghbrhd$variable)



#################################################################################################################
#plotting the change in coeffients between OR with demographics and OR without demographics



# Helper function to get change data for a demographic
get_change_data <- function(demo_name) {
  demo_df <- houseview[houseview$term == demo_name, ]
  
  no_demo <- houseview_no_demos2 %>%
    dplyr::select(variable, value) %>%
    dplyr::rename(value_no_demo = value)
  
  demo_only <- demo_df %>%
    dplyr::select(variable, value) %>%
    dplyr::rename(value_demo = value)
  
  dplyr::inner_join(no_demo, demo_only, by = "variable") %>%
    dplyr::mutate(
      change = value_demo - value_no_demo,
      demographic = demo_name
    )
}


# Combine all demographics into one dataframe
all_changes <- bind_rows(
  get_change_data("age"),
  get_change_data("sex1"),
  get_change_data("education2"),
  get_change_data("education3")
)

# One combined plot
ggplot(all_changes, aes(x = variable, y = change, fill = demographic)) +
  geom_col(position = "dodge") +
  labs(
    title = "Change in Coefficients After Adding Demographic Variables: NEIGHBORHOOD",
    x = "Model",
    y = "Change in beta variable (With demographic variables - Without)"
  ) +
  scale_fill_discrete(
    name = "Demographic Variable",               # Legend title
    labels = c("Age", "Sex (female)", "Medium education", "High education") # Labels in order
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 4))


ggsave("RESULTS/results_stratified_by_demographics/ordinal_regression_results/nghbrhd_plot_alldemos_and_nodemose_CHANGE.png", width = 10, height = 6, dpi = 300, bg = "white")

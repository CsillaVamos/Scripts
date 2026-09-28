#######################################################################################################
#########PREPPING ALL MODEL RESULTS

#######################################################################################################
###########Combine all viewshed 20m model results


###########Viewshed model ground floor 20m NDVI

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/NDVI/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_visible <- round(combined_data$mean_NDVI2_visible, 4)
viewshed20m <- combined_data

#shorten id column
viewshed20m$viewshed <- gsub("[^0-9]", "", viewshed20m$viewshed)
# Remove the first two digits
viewshed20m$viewshed  <- substr(viewshed20m$viewshed , 3, nchar(viewshed20m$viewshed ))
head(viewshed20m)


#rename columns
names(viewshed20m)[names(viewshed20m) == 'viewshed'] <- 'file_name'
names(viewshed20m)[names(viewshed20m) == 'visible_percentage'] <- 'visible_pcnt_20m'
names(viewshed20m)[names(viewshed20m) == 'mean_NDVI2_visible'] <- 'VS_20m_mean_NDVI'

head(viewshed20m)

# Save the combined data into a new CSV file
write.csv(viewshed20m, "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI.csv")




###########Viewshed model ground floor 20m NDVI_blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/NDVI_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_blue_visible <- round(combined_data$mean_NDVI2_blue_visible, 4)
viewshed20m <- combined_data

#shorten id column
viewshed20m$viewshed <- gsub("[^0-9]", "", viewshed20m$viewshed)
# Remove the first two digits
viewshed20m$viewshed  <- substr(viewshed20m$viewshed , 3, nchar(viewshed20m$viewshed ))
head(viewshed20m)


#rename columns
names(viewshed20m)[names(viewshed20m) == 'viewshed'] <- 'file_name'
names(viewshed20m)[names(viewshed20m) == 'visible_percentage'] <- 'visible_pcnt_20m'
names(viewshed20m)[names(viewshed20m) == 'mean_NDVI2_blue_visible'] <- 'VS_20m_mean_NDVI_bl'

head(viewshed20m)

# Save the combined data into a new CSV file
write.csv(viewshed20m, "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_NDVI_blue.csv")




###########viewshed model 20m ground floor treeheight

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/treeheight/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_visible <- round(combined_data$mean_treeheight2_visible, 4)
viewshed20m <- combined_data

#shorten id column
viewshed20m$viewshed <- gsub("[^0-9]", "", viewshed20m$viewshed)
# Remove the first two digits
viewshed20m$viewshed  <- substr(viewshed20m$viewshed , 3, nchar(viewshed20m$viewshed ))
head(viewshed20m)


#rename columns
names(viewshed20m)[names(viewshed20m) == 'viewshed'] <- 'file_name'
names(viewshed20m)[names(viewshed20m) == 'visible_percentage'] <- 'visible_pcnt_20m'
names(viewshed20m)[names(viewshed20m) == 'mean_treeheight2_visible'] <- 'VS_20m_mean_TH'

head(viewshed20m)

# Save the combined data into a new CSV file
write.csv(viewshed20m, "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight.csv")





###########viewshed model ground floor 20m treeheight blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/treeheight_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_blue_visible <- round(combined_data$mean_treeheight2_blue_visible, 4)
viewshed20m <- combined_data

#shorten id column
viewshed20m$viewshed <- gsub("[^0-9]", "", viewshed20m$viewshed)
# Remove the first two digits
viewshed20m$viewshed  <- substr(viewshed20m$viewshed , 3, nchar(viewshed20m$viewshed ))
head(viewshed20m)


#rename columns
names(viewshed20m)[names(viewshed20m) == 'viewshed'] <- 'file_name'
names(viewshed20m)[names(viewshed20m) == 'visible_percentage'] <- 'visible_pcnt_20m'
names(viewshed20m)[names(viewshed20m) == 'mean_treeheight2_blue_visible'] <- 'VS_20m_mean_TH_bl'

head(viewshed20m)

# Save the combined data into a new CSV file
write.csv(viewshed20m, "Viewshed_model_results/final_results/exposure_results/20m_buffer_results/20m_buffer_results_combined/VS_20m_treeheight_blue.csv")







#######################################################################################################
###########Combine all viewshed 50m model results


###########Viewshed model ground floor 50m NDVI

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/NDVI/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_visible <- round(combined_data$mean_NDVI2_visible, 4)
viewshed50m <- combined_data

#shorten id column
viewshed50m$viewshed <- gsub("[^0-9]", "", viewshed50m$viewshed)
# Remove the first two digits
viewshed50m$viewshed  <- substr(viewshed50m$viewshed , 3, nchar(viewshed50m$viewshed ))
head(viewshed50m)


#rename columns
names(viewshed50m)[names(viewshed50m) == 'viewshed'] <- 'file_name'
names(viewshed50m)[names(viewshed50m) == 'visible_percentage'] <- 'visible_pcnt_50m'
names(viewshed50m)[names(viewshed50m) == 'mean_NDVI2_visible'] <- 'VS_50m_mean_NDVI'

head(viewshed50m)

# Save the combined data into a new CSV file
write.csv(viewshed50m, "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_NDVI.csv")




###########Viewshed model ground floor 50m NDVI_blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/NDVI_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_blue_visible <- round(combined_data$mean_NDVI2_blue_visible, 4)
viewshed50m <- combined_data

#shorten id column
viewshed50m$viewshed <- gsub("[^0-9]", "", viewshed50m$viewshed)
# Remove the first two digits
viewshed50m$viewshed  <- substr(viewshed50m$viewshed , 3, nchar(viewshed50m$viewshed ))
head(viewshed50m)


#rename columns
names(viewshed50m)[names(viewshed50m) == 'viewshed'] <- 'file_name'
names(viewshed50m)[names(viewshed50m) == 'visible_percentage'] <- 'visible_pcnt_50m'
names(viewshed50m)[names(viewshed50m) == 'mean_NDVI2_blue_visible'] <- 'VS_50m_mean_NDVI_bl'

head(viewshed50m)

# Save the combined data into a new CSV file
write.csv(viewshed50m, "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_NDVI_blue.csv")




###########viewshed model 50m ground floor treeheight

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/treeheight/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_visible <- round(combined_data$mean_treeheight2_visible, 4)
viewshed50m <- combined_data

#shorten id column
viewshed50m$viewshed <- gsub("[^0-9]", "", viewshed50m$viewshed)
# Remove the first two digits
viewshed50m$viewshed  <- substr(viewshed50m$viewshed , 3, nchar(viewshed50m$viewshed ))
head(viewshed50m)


#rename columns
names(viewshed50m)[names(viewshed50m) == 'viewshed'] <- 'file_name'
names(viewshed50m)[names(viewshed50m) == 'visible_percentage'] <- 'visible_pcnt_50m'
names(viewshed50m)[names(viewshed50m) == 'mean_treeheight2_visible'] <- 'VS_50m_mean_TH'

head(viewshed50m)

# Save the combined data into a new CSV file
write.csv(viewshed50m, "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_treeheight.csv")





###########viewshed model ground floor 50m treeheight blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/treeheight_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_blue_visible <- round(combined_data$mean_treeheight2_blue_visible, 4)
viewshed50m <- combined_data

#shorten id column
viewshed50m$viewshed <- gsub("[^0-9]", "", viewshed50m$viewshed)
# Remove the first two digits
viewshed50m$viewshed  <- substr(viewshed50m$viewshed , 3, nchar(viewshed50m$viewshed ))
head(viewshed50m)


#rename columns
names(viewshed50m)[names(viewshed50m) == 'viewshed'] <- 'file_name'
names(viewshed50m)[names(viewshed50m) == 'visible_percentage'] <- 'visible_pcnt_50m'
names(viewshed50m)[names(viewshed50m) == 'mean_treeheight2_blue_visible'] <- 'VS_50m_mean_TH_bl'

head(viewshed50m)

# Save the combined data into a new CSV file
write.csv(viewshed50m, "Viewshed_model_results/final_results/exposure_results/50m_buffer_results/50m_buffer_results_combined/VS_50m_treeheight_blue.csv")






#######################################################################################################
###########Combine all viewshed 150m model results


###########Viewshed model ground floor 150m NDVI

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/NDVI/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_visible <- round(combined_data$mean_NDVI2_visible, 4)
viewshed150m <- combined_data

#shorten id column
viewshed150m$viewshed <- gsub("[^0-9]", "", viewshed150m$viewshed)
# Remove the first three digits
viewshed150m$viewshed  <- substr(viewshed150m$viewshed , 4, nchar(viewshed150m$viewshed ))
head(viewshed150m)


#rename columns
names(viewshed150m)[names(viewshed150m) == 'viewshed'] <- 'file_name'
names(viewshed150m)[names(viewshed150m) == 'visible_percentage'] <- 'visible_pcnt_150m'
names(viewshed150m)[names(viewshed150m) == 'mean_NDVI2_visible'] <- 'VS_150m_mean_NDVI'

head(viewshed150m)

# Save the combined data into a new CSV file
write.csv(viewshed150m, "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_NDVI.csv")




###########Viewshed model ground floor 150m NDVI_blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/NDVI_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

#round values
combined_data$mean_NDVI2_blue_visible <- round(combined_data$mean_NDVI2_blue_visible, 4)
viewshed150m <- combined_data

#shorten id column
viewshed150m$viewshed <- gsub("[^0-9]", "", viewshed150m$viewshed)
# Remove the first three digits
viewshed150m$viewshed  <- substr(viewshed150m$viewshed , 4, nchar(viewshed150m$viewshed ))
head(viewshed150m)


#rename columns
names(viewshed150m)[names(viewshed150m) == 'viewshed'] <- 'file_name'
names(viewshed150m)[names(viewshed150m) == 'visible_percentage'] <- 'visible_pcnt_150m'
names(viewshed150m)[names(viewshed150m) == 'mean_NDVI2_blue_visible'] <- 'VS_150m_mean_NDVI_bl'

head(viewshed150m)

# Save the combined data into a new CSV file
write.csv(viewshed150m, "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_NDVI_blue.csv")




###########viewshed model 150m ground floor treeheight

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/treeheight/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_visible <- round(combined_data$mean_treeheight2_visible, 4)
viewshed150m <- combined_data

#shorten id column
viewshed150m$viewshed <- gsub("[^0-9]", "", viewshed150m$viewshed)
# Remove the first three digits
viewshed150m$viewshed  <- substr(viewshed150m$viewshed , 4, nchar(viewshed150m$viewshed ))
head(viewshed150m)


#rename columns
names(viewshed150m)[names(viewshed150m) == 'viewshed'] <- 'file_name'
names(viewshed150m)[names(viewshed150m) == 'visible_percentage'] <- 'visible_pcnt_150m'
names(viewshed150m)[names(viewshed150m) == 'mean_treeheight2_visible'] <- 'VS_150m_mean_TH'

head(viewshed150m)

# Save the combined data into a new CSV file
write.csv(viewshed150m, "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_treeheight.csv")





###########viewshed model ground floor 150m treeheight blue

# Set the path to the folder containing your CSV files
folder_path <- "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/treeheight_blue/"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$mean_treeheight2_blue_visible <- round(combined_data$mean_treeheight2_blue_visible, 4)
viewshed150m <- combined_data

#shorten id column
viewshed150m$viewshed <- gsub("[^0-9]", "", viewshed150m$viewshed)
# Remove the first three digits
viewshed150m$viewshed  <- substr(viewshed150m$viewshed , 4, nchar(viewshed150m$viewshed ))
head(viewshed150m)


#rename columns
names(viewshed150m)[names(viewshed150m) == 'viewshed'] <- 'file_name'
names(viewshed150m)[names(viewshed150m) == 'visible_percentage'] <- 'visible_pcnt_150m'
names(viewshed150m)[names(viewshed150m) == 'mean_treeheight2_blue_visible'] <- 'VS_150m_mean_TH_bl'

head(viewshed150m)

# Save the combined data into a new CSV file
write.csv(viewshed150m, "Viewshed_model_results/final_results/exposure_results/150m_buffer_results/150m_buffer_results_combined/VS_150m_treeheight_blue.csv")





#######################################################################################################
###########Clean distance to the nearest allgreen_blue results


# Set the path to the folder containing your CSV files
folder_path <- "Distance_to_the_nearest_model_results/results/allgreen_blue"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$allgreen_blue_distance <- round(combined_data$allgreen_blue_distance, 4)
D_allgreen_bl <- combined_data

#select relevant columns
D_allgreen_bl <- select(D_allgreen_bl, file_name, geoid, allgreen_blue_distance)

#rename columns
names(D_allgreen_bl)[names(D_allgreen_bl) == 'allgreen_blue_distance'] <- 'D_allgreen_bl'

head(D_allgreen_bl)

# Save the combined data into a new CSV file
write.csv(D_allgreen_bl, "Distance_to_the_nearest_model_results/results/results_combined/distance_allgreen_blue.csv")





#######################################################################################################
###########Clean distance to the nearest allgreen results


# Set the path to the folder containing your CSV files
folder_path <- "Distance_to_the_nearest_model_results/results/allgreen"

# Get the list of all CSV files in the folder
csv_files <- list.files(path = folder_path, full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_data <- lapply(csv_files, read.csv) %>% bind_rows()

head(combined_data)

#round values
combined_data$allgreen_distance <- round(combined_data$allgreen_distance, 4)
D_allgreen_bl <- combined_data

#select relevant columns
D_allgreen_bl <- select(D_allgreen_bl, file_name, geoid, allgreen_distance)

#rename columns
names(D_allgreen_bl)[names(D_allgreen_bl) == 'allgreen_distance'] <- 'D_allgreen'

head(D_allgreen_bl)

# Save the combined data into a new CSV file
write.csv(D_allgreen_bl, "Distance_to_the_nearest_model_results/results/results_combined/distance_allgreen.csv")


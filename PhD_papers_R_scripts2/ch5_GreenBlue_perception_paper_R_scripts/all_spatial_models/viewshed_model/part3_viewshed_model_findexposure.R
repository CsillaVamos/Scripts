######################################################################################################################
#####################################################################################################################
###################VIEWSHED MODEL PART 3: calculate the average the exposure from areas that can be seen to the viewer



######################################################################################################################
#########NDVI_blue_exposure

viewshed_folder <- "Viewshed_model_results/final_results/viewshed_20mbuffer/"
NDVI2_blue_path <- "Euclidean_buffer_model_Csilla/Euclidean_buffer_model_Csilla/NDVI_water/NDVI_blue_mean.tif"
output_file <- "Viewshed_model_results/final_results/exposure_results/NDVI_blue/NDVI_blue_20m_exposure.csv"

process_viewsheds <- function(viewshed_files, NDVI2_blue_raster) {
  NDVI2_blue_results <- data.frame(
    viewshed = character(),
    visible_percentage = numeric(),
    mean_NDVI2_blue_visible = numeric(),
    stringsAsFactors = FALSE
  )
  
  for (viewshed_file in viewshed_files) {
    viewshed_raster <- rast(viewshed_file)
    NDVI2_blue_resampled <- resample(NDVI2_blue_raster, viewshed_raster, method = "bilinear")
    NDVI2_blue_visible <- mask(NDVI2_blue_resampled, viewshed_raster, maskvalues = 0)
    
    total_cells <- ncell(viewshed_raster)
    visible_cells <- sum(values(viewshed_raster) == 1, na.rm = TRUE)
    visible_percentage <- (visible_cells / total_cells) * 100
    mean_NDVI2_blue_visible <- mean(values(NDVI2_blue_visible), na.rm = TRUE)
    
    NDVI2_blue_results <- rbind(NDVI2_blue_results, data.frame(
      viewshed = basename(viewshed_file),
      visible_percentage = visible_percentage,
      mean_NDVI2_blue_visible = mean_NDVI2_blue_visible
    ))
  }
  
  return(NDVI2_blue_results)
}

# Load the NDVI2 raster
NDVI2_blue_raster <- rast(NDVI2_blue_path)

# List all viewshed .tif files
viewshed_files <- list.files(viewshed_folder, full.names = TRUE)

# Split viewshed files into chunks of 200
viewshed_chunks <- split(viewshed_files, ceiling(seq_along(viewshed_files) / 200))

# Process each chunk and save results separately
for (i in seq_along(viewshed_chunks)) {
  chunk_results <- process_viewsheds(viewshed_chunks[[i]], NDVI2_blue_raster)
  
  # Define chunk-specific output file
  chunk_output_file <- paste0("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/NDVI_blue/NDVI_blue_20m_exposure_chunk_", i, ".csv")
  
  # Save chunk results to a separate CSV file
  write.csv(chunk_results, chunk_output_file, row.names = FALSE)
  
  # Display a message when a chunk is saved
  message(paste("Chunk", i, "saved to", chunk_output_file))
}





######################################################################################################################
#########NDVI exposure


viewshed_folder <- "Viewshed_model_results/final_results/viewshed_20mbuffer/"
NDVI2_path <- "DATA/GREEN_SPACE_DATA/NDVI_sentinel_2022/NDVI_recalc.tif"


process_viewsheds <- function(viewshed_files, NDVI2_raster) {
  NDVI2_results <- data.frame(
    viewshed = character(),
    visible_percentage = numeric(),
    mean_NDVI2_visible = numeric(),
    stringsAsFactors = FALSE
  )
  
  for (viewshed_file in viewshed_files) {
    viewshed_raster <- rast(viewshed_file)
    NDVI2_resampled <- resample(NDVI2_raster, viewshed_raster, method = "bilinear")
    NDVI2_visible <- mask(NDVI2_resampled, viewshed_raster, maskvalues = 0)
    
    total_cells <- ncell(viewshed_raster)
    visible_cells <- sum(values(viewshed_raster) == 1, na.rm = TRUE)
    visible_percentage <- (visible_cells / total_cells) * 100
    mean_NDVI2_visible <- mean(values(NDVI2_visible), na.rm = TRUE)
    
    NDVI2_results <- rbind(NDVI2_results, data.frame(
      viewshed = basename(viewshed_file),
      visible_percentage = visible_percentage,
      mean_NDVI2_visible = mean_NDVI2_visible
    ))
  }
  
  return(NDVI2_results)
}

# Load the NDVI2 raster
NDVI2_raster <- rast(NDVI2_path)

# List all viewshed .tif files
viewshed_files <- list.files(viewshed_folder, full.names = TRUE)

# Split viewshed files into chunks of 200
viewshed_chunks <- split(viewshed_files, ceiling(seq_along(viewshed_files) / 200))

# Process each chunk and save results separately
for (i in seq_along(viewshed_chunks)) {
  chunk_results <- process_viewsheds(viewshed_chunks[[i]], NDVI2_raster)
  
  # Define chunk-specific output file
  chunk_output_file <- paste0("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/NDVI/NDVI_20m_exposure_chunk_", i, ".csv")
  
  # Save chunk results to a separate CSV file
  write.csv(chunk_results, chunk_output_file, row.names = FALSE)
  
  # Display a message when a chunk is saved
  message(paste("Chunk", i, "saved to", chunk_output_file))
}



######################################################################################################################
#########treeheight exposure


viewshed_folder <- "Viewshed_model_results/final_results/viewshed_20mbuffer/"
treeheight2_path <- "DATA/GREEN_SPACE_DATA/Tree_height/20200629_gm_Bomenkaart_v2.tif"


process_viewsheds <- function(viewshed_files, treeheight2_raster) {
  treeheight2_results <- data.frame(
    viewshed = character(),
    visible_percentage = numeric(),
    mean_treeheight2_visible = numeric(),
    stringsAsFactors = FALSE
  )
  
  for (viewshed_file in viewshed_files) {
    viewshed_raster <- rast(viewshed_file)
    treeheight2_resampled <- resample(treeheight2_raster, viewshed_raster, method = "bilinear")
    treeheight2_visible <- mask(treeheight2_resampled, viewshed_raster, maskvalues = 0)
    
    total_cells <- ncell(viewshed_raster)
    visible_cells <- sum(values(viewshed_raster) == 1, na.rm = TRUE)
    visible_percentage <- (visible_cells / total_cells) * 100
    mean_treeheight2_visible <- mean(values(treeheight2_visible), na.rm = TRUE)
    
    treeheight2_results <- rbind(treeheight2_results, data.frame(
      viewshed = basename(viewshed_file),
      visible_percentage = visible_percentage,
      mean_treeheight2_visible = mean_treeheight2_visible
    ))
  }
  
  return(treeheight2_results)
}

# Load the treeheight2 raster
treeheight2_raster <- rast(treeheight2_path)

# List all viewshed .tif files
viewshed_files <- list.files(viewshed_folder, full.names = TRUE)

# Split viewshed files into chunks of 200
viewshed_chunks <- split(viewshed_files, ceiling(seq_along(viewshed_files) / 200))

# Process each chunk and save results separately
for (i in seq_along(viewshed_chunks)) {
  chunk_results <- process_viewsheds(viewshed_chunks[[i]], treeheight2_raster)
  
  # Define chunk-specific output file
  chunk_output_file <- paste0("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/treeheight/treeheight_20m_exposure_chunk_", i, ".csv")
  
  # Save chunk results to a separate CSV file
  write.csv(chunk_results, chunk_output_file, row.names = FALSE)
  
  # Display a message when a chunk is saved
  message(paste("Chunk", i, "saved to", chunk_output_file))
}




######################################################################################################################
#########treeheight blue exposure


######################################################################################################################
#########treeheight exposure


viewshed_folder <- "Viewshed_model_results/final_results/viewshed_20mbuffer/"
treeheight2_blue_path <- "Euclidean_buffer_model_Csilla/Euclidean_buffer_model_Csilla/treeheight_water/treeheight_blue_mean.tif"


process_viewsheds <- function(viewshed_files, treeheight2_blue_raster) {
  treeheight2_blue_results <- data.frame(
    viewshed = character(),
    visible_percentage = numeric(),
    mean_treeheight2_blue_visible = numeric(),
    stringsAsFactors = FALSE
  )
  
  for (viewshed_file in viewshed_files) {
    viewshed_raster <- rast(viewshed_file)
    treeheight2_blue_resampled <- resample(treeheight2_blue_raster, viewshed_raster, method = "bilinear")
    treeheight2_blue_visible <- mask(treeheight2_blue_resampled, viewshed_raster, maskvalues = 0)
    
    total_cells <- ncell(viewshed_raster)
    visible_cells <- sum(values(viewshed_raster) == 1, na.rm = TRUE)
    visible_percentage <- (visible_cells / total_cells) * 100
    mean_treeheight2_blue_visible <- mean(values(treeheight2_blue_visible), na.rm = TRUE)
    
    treeheight2_blue_results <- rbind(treeheight2_blue_results, data.frame(
      viewshed = basename(viewshed_file),
      visible_percentage = visible_percentage,
      mean_treeheight2_blue_visible = mean_treeheight2_blue_visible
    ))
  }
  
  return(treeheight2_blue_results)
}

# Load the treeheight2_blue raster
treeheight2_blue_raster <- rast(treeheight2_blue_path)

# List all viewshed .tif files
viewshed_files <- list.files(viewshed_folder, full.names = TRUE)

# Split viewshed files into chunks of 200
viewshed_chunks <- split(viewshed_files, ceiling(seq_along(viewshed_files) / 200))

# Process each chunk and save results separately
for (i in seq_along(viewshed_chunks)) {
  chunk_results <- process_viewsheds(viewshed_chunks[[i]], treeheight2_blue_raster)
  
  # Define chunk-specific output file
  chunk_output_file <- paste0("Viewshed_model_results/final_results/exposure_results/20m_buffer_results/treeheight_blue/treeheight_blue_20m_exposure_chunk_", i, ".csv")
  
  # Save chunk results to a separate CSV file
  write.csv(chunk_results, chunk_output_file, row.names = FALSE)
  
  # Display a message when a chunk is saved
  message(paste("Chunk", i, "saved to", chunk_output_file))
}






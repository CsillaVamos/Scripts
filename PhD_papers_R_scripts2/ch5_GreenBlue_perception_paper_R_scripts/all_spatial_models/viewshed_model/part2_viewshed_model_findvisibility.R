#########################################################################################
#######################################################################################
#####################VIEWSHED MODEL PART 2: find visibility


####################################################################################################
###upload AMIGO residential address points

points <- st_read("DATA/AMIGO_data/AMIGO_data.shp")  
points$height <- 1.7 #create new column with the height of the observer (1.7m) at the ground floor level



##############################################################################################################
#############################################################################################################
###########################################################################################################
#####################VIEWSHED MODEL FOR 20 METER BUFFER



##########################################################################
########VIEWSHED MODEL 1: GROUND FLOOR, 20m buffer

# call the folder path where the tif files are located
tif_folder <- "Viewshed_model_results/final_results/buffer20m_AMIGO_part1/"


# Get a list of all .tif files in the folder
tif_files <- list.files(tif_folder, full.names = TRUE) 


viewshed_folder <-"Viewshed_model_results/final_results/viewshed_20mbuffer/"


# Function to perform visibility analysis with NA interpolation
analyze_visibility_with_interpolation <- function(tif_path, points) {
  
  # Load the raster
  raster_data <- rast(tif_path)
  
  # Get raster extent and center coordinates
  extent_r <- ext(raster_data)
  center_x <- (extent_r[1] + extent_r[2]) / 2
  center_y <- (extent_r[3] + extent_r[4]) / 2
  
  # Find the point closest to the center
  center_point <- st_sfc(st_point(c(center_x, center_y)), crs = st_crs(points))
  distances <- st_distance(points, center_point)
  closest_index <- which.min(distances)
  closest_point <- points[closest_index, ]
  
  # Ensure coordinates are correctly formatted as a matrix
  coords <- matrix(c(center_x, center_y), ncol = 2, byrow = TRUE)
  
  # Extract ground elevation as numeric value
  ground_elevation <- as.numeric(terra::extract(raster_data, matrix(c(center_x, center_y), ncol=2)))
  
  # Ensure building height is numeric
  height <- as.numeric(closest_point$height)
  
  # Compute actual observer height
  observer_height <- ground_elevation + height 
  
  # Compute viewshed
  visibility_map <- viewshed(raster_data, c(center_x, center_y, observer_height))
  
  
  # Save the output visibility raster
  output_path <- paste0(viewshed_folder, "/visibility_groundfloor_20mbuf_", tools::file_path_sans_ext(basename(tif_path)), ".tif")
  
  writeRaster(visibility_map, output_path, overwrite = TRUE)
  
  return(output_path)
}

# Apply function to each TIF file
output_files <- lapply(tif_files, analyze_visibility_with_interpolation, points)



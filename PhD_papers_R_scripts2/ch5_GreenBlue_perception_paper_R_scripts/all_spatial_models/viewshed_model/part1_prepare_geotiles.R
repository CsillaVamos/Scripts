###################################################################################################################
#################################################################################################################
########SCRIPT TO PREPARE ALL GEOTILES FOR VIEWSHED MODEL 



#################################################################################################################
###########20 METER BUFFER 


#######################
###CENTER EACH XY POINT TO MATCHING TIF TILE AND CREATE A 20 METER BUFFER, AND CLIPP THE TIF TILE TO THAT BUFFER

setwd("Viewshed_model_results/final_results/geotiles_20mbuffer_new")

# Define the folder containing the TIFFs
folder_path <- "DATA/viewshed_data/geotiles/tiles_to_mosaic/unzipped_tiles" 


# Get list of all .tif files in the folder
tif_files <- list.files(folder_path, full.names = TRUE)


# Read the shapefile containing snapped points
points <- st_read("DATA/AMIGO_data/AMIGO_data.shp") #USE SNAPPED AMIGO POINTS HERE
points$height <- 1.7 #create new column with the height of the observer (1.7m) at the ground floor level

#points <- points[26535:27839,]
nrow(points)
head(points)

# Load all raster files into a SpatRaster collection
rasters <- lapply(tif_files, rast)

# Function to find the correct raster for each point
find_matching_raster <- function(x, y, raster_list) {
  for (r in raster_list) {
    if (x >= xmin(r) & x <= xmax(r) & 
        y >= ymin(r) & y <= ymax(r)) {
      return(r)
    }
  }
  return(NULL)
}

# Process each point
for (i in 1:nrow(points)) {
  point <- points[i, ]
  
  # Extract coordinates correctly
  coords <- st_coordinates(point)
  x_coord <- coords[1]  # X coordinate
  y_coord <- coords[2]  # Y coordinate
  
  # Find corresponding raster
  matching_raster <- find_matching_raster(x_coord, y_coord, rasters)
  
  if (!is.null(matching_raster)) {
    # Create a 20m buffer around the point
    buffer <- st_buffer(point, dist = 20)
    
    # Convert buffer to SpatVector (terra format)
    buffer_vect <- vect(buffer)
    
    # Clip the raster to the buffer extent
    clipped_raster <- crop(matching_raster, buffer_vect)
    masked_raster <- mask(clipped_raster, buffer_vect)
    
    # Save the clipped raster
    field_value <- as.character(points$Field1[i])  # Convert Field1 to character if it's not already
    output_file <- paste0("clipped_elevation_", field_value, ".tif")
    
    writeRaster(masked_raster, output_file, overwrite = TRUE)
    
    
    print(paste("Saved:", output_file))
  } else {
    print(paste("No matching raster found for point", i))
  }
}



########################################################################################
######CHANGE RESOLUTION OF TIF TILES FROM 0.5 TO 2 METERS

#path to folder of tif tiles clipped to 20m buffer
folder_path <- "Viewshed_model_results/final_results/geotiles_20mbuffer_new/"


#output path to save the resampled results
output_dir <- "Viewshed_model_results/final_results/geotiles_20m_resampled_to_2m/"


# Get list of all .tif files in the folder
tif_files <- list.files(folder_path, full.names = TRUE)

# Define chunk size
chunk_size <- 1000

# Get total number of files
total_files <- length(tif_files)

# Process in chunks
for (start_idx in seq(1, total_files, by = chunk_size)) {
  # Define end index for the current chunk
  end_idx <- min(start_idx + chunk_size - 1, total_files)
  
  # Get subset (chunk) of files
  tif_chunk <- tif_files[start_idx:end_idx]
  
  # Loop through each file in the chunk
  for (tif in tif_chunk) {
    # Read the raster
    r <- rast(tif)
    
    # Define new resolution
    new_res <- 2  # New resolution in meters
    
    # Resample the raster
    r <- resample(r, rast(ext(r), res = new_res, crs = crs(r)), method = "bilinear")
    
    # Create output filename
    output_file <- file.path(output_dir, basename(tif))
    
    # Save the resampled raster
    writeRaster(r, output_file, overwrite = TRUE)
    
    print(paste("Processed:", basename(tif)))
  }
  
  print(paste("Completed chunk:", start_idx, "to", end_idx))
}




#######################################################################################
#####MERGE ELEVATION TIF TILES WITH WATER BODY DATA 

# Path to folder of TIFF tiles clipped to a 20m buffer
folder_path <- "Viewshed_model_results/final_results/geotiles_20m_resampled_to_2m/"
# Output path to save the processed results
output_dir <- "Viewshed_model_results/final_results/geotiles_20m_rsmpld_water_2/"

# Ensure output directory exists
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# List all .tif files in the directory
tif_files <- list.files(folder_path, full.names = TRUE)

# Loop through each tile and process
for (tif in tif_files) {
  
  # Load the raster
  r <- rast(tif)
  
  # Replace NA values with 0
  r[is.na(r)] <- 0.01
  
  # Create output filename
  output_file <- file.path(output_dir, basename(tif))
  
  # Save the modified raster
  writeRaster(r, output_file, overwrite = TRUE)
  
  print(paste("Processed:", basename(tif)))
}

print("All files processed successfully!")




#######################
###CENTER EACH XY POINT TO MATCHING 20M BUFFER AND CREATE A 20 METER BUFFER, AND CLIPP THE TIF TILE TO THAT BUFFER (to turn values outside of buffer to na)


# Define the folder containing the TIFFs
tif_folder <- "Viewshed_model_results/final_results/geotiles_20m_rsmpld_water_2/" 


# Get list of all .tif files in the folder
tif_files <- list.files(folder_path, full.names = TRUE)

# Output folder
output_folder <- "Viewshed_model_results/final_results/buffer20m_AMIGO_part1/"
dir.create(output_folder, showWarnings = FALSE)

# Process each .tif file
for (tif in tif_files) {
  
  # Read the raster
  raster <- rast(tif)
  
  # Get raster center coordinates
  ext <- ext(raster)  # Get extent
  center_x <- (ext[1] + ext[2]) / 2  # Mean of xmin and xmax
  center_y <- (ext[3] + ext[4]) / 2  # Mean of ymin and ymax
  
  # Create an sf point from the center
  center_point <- st_point(c(center_x, center_y)) %>%
    st_sfc(crs = crs(raster)) %>%
    st_sf()
  
  # Create a 20m buffer
  buffer <- st_buffer(center_point, dist = 20)
  
  # Convert buffer to terra's SpatVector format
  buffer_vect <- vect(buffer)
  
  # Clip the raster to the buffer extent
  clipped_raster <- crop(raster, buffer_vect)
  masked_raster <- mask(clipped_raster, buffer_vect)
  
  # Define output filename
  output_file <- file.path(output_folder, paste0("clipped_", basename(tif)))
  
  # Save the clipped raster
  writeRaster(masked_raster, output_file, overwrite = TRUE)
  
  print(paste("Saved:", output_file))
}

print("Processing complete!")










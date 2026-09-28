###################################################################################################################
#################################################################################################################
########SCRIPT TO PREPARE ALL GEOTILES FOR VIEWSHED MODEL 


###############unzip files

#set path where zipped files are located
zipped_files_path <- "DATA/viewshed_data/geotiles/tiles_to_mosaic/zipped_tiles/"

# Get list of all .zip files in the folder
tif_files_zipped <- list.files(zipped_files_path, pattern = "\\.zip$", full.names = TRUE)

sapply(tif_files_zipped, unzip, exdir = "DATA/viewshed_data/geotiles/tiles_to_mosaic/unzipped_tiles")



##########################################################################################################################3
###CENTER EACH XY POINT TO MATCHING TIF TILE AND CREATE A 50 METER BUFFER, AND CLIPP THE TIF TILE TO THAT BUFFER

setwd("DATA/viewshed_data/geotiles/50m_buffers_of_geotiles_RESAMPLED/")

# Define the folder containing the TIFFs
folder_path <- "DATA/viewshed_data/geotiles/tiles_to_mosaic/unzipped_tiles"

# Get list of all .tif files in the folder
tif_files <- list.files(folder_path, pattern = "\\.TIF$", full.names = TRUE)


# Read the shapefile containing points
points <- st_read("DATA/BAG_buffer_data/BAG_2019_within_SV_intersect_RDnew.shp")
#select every 100th row
points = points[seq(1, nrow(points), 10), ]

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
    # Create a 50m buffer around the point
    buffer <- st_buffer(point, dist = 50)
    
    # Convert buffer to SpatVector (terra format)
    buffer_vect <- vect(buffer)
    
    # Clip the raster to the buffer extent
    clipped_raster <- crop(matching_raster, buffer_vect)
    masked_raster <- mask(clipped_raster, buffer_vect)
    
    # Save the clipped raster
    output_file <- paste0("clipped_elevation_", i, ".tif")
    writeRaster(masked_raster, output_file, overwrite = TRUE)
    
    
    print(paste("Saved:", output_file))
  } else {
    print(paste("No matching raster found for point", i))
  }
}



########################################################################################
######CHANGE RESOLUTION OF TIF TILES FROM 0.5 TO 2 METERS

#path to folder of tif tiles clipped to 50m buffer
folder_path <- "DATA/viewshed_data/geotiles/50m_buffers_of_geotiles/"  # Set correct folder

#output path to save the resampled results
output_dir <- "DATA/viewshed_data/geotiles/50m_buffers_of_geotiles_RESAMPLED/"

# Get list of .tif files
tif_files <- list.files(folder_path, pattern = "\\.tif$", full.names = TRUE)


# Loop through each file and resample it
for (tif in tif_files) {
  # Read the raster
  r <- rast(tif)
  
  # Define new resolution
  new_res <- 2  # New resolution in meters
  
  # Resample the raster
  r_resampled <- resample(r, rast(ext(r), res = new_res, crs = crs(r)), method = "bilinear")
  
  # Create output filename
  output_file <- file.path(output_dir, basename(tif))
  
  # Save the resampled raster
  writeRaster(r_resampled, output_file, overwrite = TRUE)
}

cat("Resampling complete! Files saved in:", output_dir)





#######################################################################################
#####MERGE ELEVATION TIF TILES WITH WATER BODY DATA

###upload water body data
waterbodies <- rast("DATA/BLUE_SPACE_DATA/blue_raster_height.tif")

###change resolution to 2 x 2 meters
# Define new resolution
new_res <- 2  # New resolution in meters

###Resample the raster
waterbodies_resampled <- resample(waterbodies, rast(ext(waterbodies), res = new_res, crs = crs(waterbodies)), method = "bilinear")

###overlay and clip with each tif buffer

#path to folder of tif tiles clipped to 50m buffer
folder_path <- "DATA/viewshed_data/geotiles/50m_buffers_of_geotiles_RESAMPLED/"  # Set correct folder

#output path to save the resampled results
output_dir <- "DATA/viewshed_data/geotiles/50m_buf_geotiles_with_water/"
dir.create(output_dir, showWarnings = FALSE)

# List all .tif files in the directory
tif_files <- list.files(folder_path, pattern = "\\.tif$", full.names = TRUE)

# Loop through each tile and process
for (tif in tif_files) {
  # Read the tile raster
  tile <- rast(tif)
  
  # Clip waterbodies to tile extent
  waterbodies_clipped <- crop(waterbodies_resampled, ext(tile), mask = TRUE)
  
  # Ensure resolutions match before summing
  if (!all(res(tile) == res(waterbodies_clipped))) {
    waterbodies_clipped <- resample(waterbodies_clipped, tile, method = "bilinear")
  }
  
  # Sum the tile with the clipped raster
  tile_updated <- tile + waterbodies_clipped
  
  # Create output file path
  output_file <- file.path(output_dir, basename(tif))
  
  # Save the updated raster
  writeRaster(tile_updated, output_file, overwrite = TRUE)
}

cat("Processing complete! Updated rasters saved in:", output_dir)









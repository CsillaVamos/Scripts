##################################################################################################################################################
################################################################################################################################################
######CONVERTING VECTOR DATA INTO RASTER DATA


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
library(exactextractr)



#########################################################################################################################################
################convert vectors into rasters


############GREEN DATASETS

#####allgreen

landuse_allgreen <- st_read("DATA/GREEN_SPACE_DATA/LGN2021/all_green/landuse_green.shp")  
# Load greenblue_space polygons
names(landuse_allgreen)[names(landuse_allgreen) == 'category'] <- 'nameofbluegreen'
landuse_allgreen$category <- rep(c("greenblue"))
###select relevant columns
landuse_allgreen  <- select(landuse_allgreen, category, geometry)
landuse_allgreen$landuse_allgreenval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_allgreen), resolution=5, crs=crs(landuse_allgreen))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_allgreen, raster_template, field="landuse_allgreenval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/allgreen_raster/allgreen_raster.tif", overwrite=TRUE)




#####agricultural

landuse_agricultural <- st_read("DATA/GREEN_SPACE_DATA/LGN2021/agricultural_land/agricultural_land.shp")   
landuse_agricultural$landuse_agriculturalval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_agricultural), resolution=5, crs=crs(landuse_agricultural))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_agricultural, raster_template, field="landuse_agriculturalval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/agricultural_raster/agricultural_raster.tif", overwrite=TRUE)



#####forestandnatural

landuse_forestandnatural <- st_read("DATA/GREEN_SPACE_DATA/LGN2021/forest_and_open_natural_terrain/forest_open_nat_terrain.shp")  
landuse_forestandnatural$landuse_forestandnaturalval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_forestandnatural), resolution=5, crs=crs(landuse_forestandnatural))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_forestandnatural, raster_template, field="landuse_forestandnaturalval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/forest_and_open_natural_terrain_raster/forestandnatural_raster.tif", overwrite=TRUE)




#####recreation_area

landuse_recreation_area <- st_read("DATA/GREEN_SPACE_DATA/LGN2021/recreation_area/recreation_area.shp") 
landuse_recreation_area$landuse_recreation_areaval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_recreation_area), resolution=5, crs=crs(landuse_recreation_area))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_recreation_area, raster_template, field="landuse_recreation_areaval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/recreation_area_raster/recreation_area_raster.tif", overwrite=TRUE)



#####parks

parks <- st_read("DATA/GREEN_SPACE_DATA/NL_parks_shapefile/NL_parks_RDnew.shp")
parks$parksval <- 1


# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(parks), resolution=5, crs=crs(parks))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(parks, raster_template, field="parksval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_SPACE_DATA/NL_parks_shapefile/parks_raster.tif", overwrite=TRUE)






############GREEN-BLUE DATASETS

#####allgreen_blue

landuse_allgreen_blue <- st_read("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_allgreen_blue.shp")  
# Load greenblue_space polygons
names(landuse_allgreen_blue)[names(landuse_allgreen_blue) == 'category'] <- 'nameofbluegreen'
landuse_allgreen_blue$category <- rep(c("greenblue"))
###select relevant columns
landuse_allgreen_blue  <- select(landuse_allgreen_blue, category, geometry)
landuse_allgreen_blue$landuse_allgreen_blueval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_allgreen_blue), resolution=5, crs=crs(landuse_allgreen_blue))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_allgreen_blue, raster_template, field="landuse_allgreen_blueval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/allgreen_blue_raster/allgreen_blue_raster.tif", overwrite=TRUE)




#####agricultural_blue

landuse_agricultural_blue <- st_read("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_agricultural_blue.shp")   
landuse_agricultural_blue$landuse_agricultural_blueval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_agricultural_blue), resolution=5, crs=crs(landuse_agricultural_blue))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_agricultural_blue, raster_template, field="landuse_agricultural_blueval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/agricultural_blue_raster/agricultural_blue_raster.tif", overwrite=TRUE)



#####forestandnatural_blue

landuse_forestandnatural_blue <- st_read("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_forestandnatural_blue.shp")  
landuse_forestandnatural_blue$landuse_forestandnatural_blueval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_forestandnatural_blue), resolution=5, crs=crs(landuse_forestandnatural_blue))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_forestandnatural_blue, raster_template, field="landuse_forestandnatural_blueval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/forestandnatural_blue_raster/forestandnatural_blue_raster.tif", overwrite=TRUE)




#####recreation_area_blue

landuse_recreation_area_blue <- st_read("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_recreation_area_blue.shp") 
landuse_recreation_area_blue$landuse_recreation_area_blueval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(landuse_recreation_area_blue), resolution=5, crs=crs(landuse_recreation_area_blue))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(landuse_recreation_area_blue, raster_template, field="landuse_recreation_area_blueval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/recreation_area_blue_raster/recreation_area_blue_raster.tif", overwrite=TRUE)



#####parks_blue

parks <- st_read("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/parks/parks_blue.shp")
parks$parksval <- 1

# Define the raster resolution and extent (or use an existing raster)
raster_template <- rast(ext(parks), resolution=5, crs=crs(parks))  # Adjust resolution

# Rasterize the polygon (e.g., use a specific attribute field)
rasterized <- rasterize(parks, raster_template, field="parksval", fun="max")

# Save the raster
writeRaster(rasterized, "DATA/GREEN_BLUE_SPACE_DATA_COMBINED/parks/parks_blue_raster.tif", overwrite=TRUE)








#######################################################################################################################################
#######################################################################################################################################
#######################################################################################################################################


####calculate the average parks value per neighborhood boundary

neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
#select every nth row
#neighborhoods = neighborhoods[seq(1, nrow(neighborhoods), 300), ]
neighborhoods$neighborhood_area <- st_area(neighborhoods)
nrow(neighborhoods)


parks_raster <- rast("neighborhood_model_results/neighborhoods_with_parks_raster3.tif")

# Convert raster to `raster` format for exactextractr
parks_raster_r <- raster(parks_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(parks_raster)[1]  # Cell width
res_y <- res(parks_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
parks_area_values <- numeric(nrow(neighborhoods))

# Batch settings
batch_size <- 1000  # Adjust if needed
num_batches <- ceiling(nrow(neighborhoods) / batch_size)

# Process neighborhoods in batches
for (i in seq_len(num_batches)) {
  start_idx <- (i - 1) * batch_size + 1
  end_idx <- min(i * batch_size, nrow(neighborhoods))
  
  cat(sprintf("Processing batch %d of %d (Rows %d to %d)...\n", i, num_batches, start_idx, end_idx))
  
  # Subset batch
  batch_sf <- neighborhoods[start_idx:end_idx, ]
  
  # Extract park area with exactextractr and ensure correct vector format
  batch_parks_area <- unlist(exact_extract(parks_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_parks_area) != nrow(batch_sf)) {
    batch_parks_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Convert raster pixel count to actual park area
  parks_area_values <- parks_area_values * pixel_area
  
  # Store results correctly
  parks_area_values[start_idx:end_idx] <- batch_parks_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  park_area = parks_area_values,
  parks_percentage = (parks_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$park_area <- round(results_df$park_area, 4)
results_df$parks_percentage <- round(results_df$parks_percentage, 4)

results_df


# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/greenspace/parksneighborhoods_with_parks.csv", row.names = FALSE)


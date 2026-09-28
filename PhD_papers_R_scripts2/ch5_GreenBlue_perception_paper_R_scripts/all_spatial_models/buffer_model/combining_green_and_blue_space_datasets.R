##############COMBINING GREEN SPACE DATASETS WITH THE BLUE SPACE DATASET


#make correct path for libraries
.libPaths()

#upload libraries
library(mvmeta)
library(sp)
library(raster)
library(terra)
library(sf)
library(tiff)
library(stars)
library(units)
library(terra)
library(maptools)
library(devtools)
library(readr)
library(rgdal)
library(RSQLite)
library(dplyr)
library(tidyverse)
library(rgeos)
library(tmap) 
library(sfheaders)
library(knitr)



#######VECTOR DATA

###upload blue space data and simply it
blue_spaceold <- st_read("Data/water_top10nl/waterbodies_2.shp")

#select relevant columns
blue_spaceold <- select(blue_spaceold, geometry)
# Add a new column and set its value to "water"
blue_spaceold$category <- "water"
#save simplified blue space data
st_write(blue_spaceold, "Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")


##########LANDUSE ALL GREEN

###upload green space data and simplified blue space data
landuse_allgreen <- st_read("Data/GREEN_SPACE_DATA/LGN2021/landuse_green.shp")
blue_space <- st_read("Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")

###select relevant columns
landuse_allgreen  <- select(landuse_allgreen, maingrp, geometry)
#rename maingrp to category
names(landuse_allgreen)[names(landuse_allgreen) == 'maingrp'] <- 'category'

#rbind the green space and blue space data
green_blue_rbinded <- rbind(landuse_allgreen, blue_space)

###save the new layer
st_write(green_blue_rbinded, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_allgreen_blue.shp")



##########LANDUSE RECREATION AREAS

###upload green space data and simplified blue space data
landuse_recreation_area <- st_read("Data/GREEN_SPACE_DATA/LGN2021/recreation_area/recreation_area.shp")
blue_space <- st_read("Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")

###select relevant columns
landuse_recreation_area  <- select(landuse_recreation_area, maingrp, geometry)
#rename maingrp to category
names(landuse_recreation_area)[names(landuse_recreation_area) == 'maingrp'] <- 'category'

#rbind the green space and blue space data
landuse_recreation_area_blue_rbinded <- rbind(landuse_recreation_area, blue_space)

###save the new layer
st_write(landuse_recreation_area_blue_rbinded, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_recreation_area_blue.shp")



##########LANDUSE AGRICULTURAL LAND

###upload green space data and simplified blue space data
landuse_agricultural <- st_read("Data/GREEN_SPACE_DATA/LGN2021/agricultural_land/agricultural_land.shp")
blue_space <- st_read("Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")

###select relevant columns
landuse_agricultural  <- select(landuse_agricultural, maingrp, geometry)
#rename maingrp to category
names(landuse_agricultural)[names(landuse_agricultural) == 'maingrp'] <- 'category'

#rbind the green space and blue space data
landuse_agricultural_blue_rbinded <- rbind(landuse_agricultural, blue_space)

###save the new layer
st_write(landuse_agricultural_blue_rbinded, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_agricultural_blue.shp")




##########LANDUSE FOREST AND OPEN NATURAL TERRAIN

###upload green space data and simplified blue space data
landuse_natural <- st_read("Data/GREEN_SPACE_DATA/LGN2021/forest_and_open_natural_terrain/forest_open_nat_terrain.shp")
blue_space <- st_read("Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")

###select relevant columns
landuse_natural  <- select(landuse_natural, maingrp, geometry)
#rename maingrp to category
names(landuse_natural)[names(landuse_natural) == 'maingrp'] <- 'category'

#rbind the green space and blue space data
landuse_natural_blue_rbinded <- rbind(landuse_natural, blue_space)

###save the new layer
st_write(landuse_natural_blue_rbinded, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_data/landuse_forestandnatural_blue.shp")


##########PARKS

###upload green space data and simplified blue space data
parks <- st_read("Data/GREEN_SPACE_DATA/NL_parks_shapefile/NL_parks_RDnew.shp")
blue_space <- st_read("Data/BLUE_SPACE_DATA/blue_space_to_combine.shp")

###select relevant columns
parks  <- select(parks, name, geometry)
#rename maingrp to category
names(parks)[names(parks) == 'name'] <- 'category'

#rbind the green space and blue space data
parks_blue_rbinded <- rbind(parks, blue_space)

###save the new layer
st_write(parks_blue_rbinded, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/parks/parks_blue.shp")





###RASTER DATA

###in blue space raster layer, change nodata values to 0

# Load the raster
r <- rast("Data/BLUE_SPACE_DATA/blue_raster.tif")

# Replace NA (nodata) values with 0
r <- classify(r, cbind(NA, 0), others = TRUE)

# Save the modified raster
writeRaster(r, "Data/BLUE_SPACE_DATA/blue_raster_reclassified.tif", overwrite = FALSE)



###Green map data

###in agriculture raster layer, change nodata values to 0

# Load the raster
r <- rast("Data/GREEN_SPACE_DATA/rivm_greenmap_2022/agriculture/agriculturetiffile/agriculture.tif")

# Replace NA (nodata) values with 0
r <- classify(r, cbind(NA, 0), others = TRUE)

# Save the modified raster
writeRaster(r, "Data/GREEN_SPACE_DATA/rivm_greenmap_2022/agriculture/agriculture_reclassified/agriculture_reclassified.tif", overwrite = FALSE)


###in nature networks raster layer, change nodata values to 0

# Load the raster
r <- rast("Data/GREEN_SPACE_DATA/rivm_greenmap_2022/nat_networks/nat_networks_tiffile/nat_networkstifffile.tif")

# Replace NA (nodata) values with 0
r <- classify(r, cbind(NA, 0), others = TRUE)

# Save the modified raster
writeRaster(r, "Data/GREEN_SPACE_DATA/rivm_greenmap_2022/nat_networks/nat_network_reclassified/nat_network_reclassified.tif", overwrite = FALSE)


###in natura2000 raster layer, change nodata values to 0

# Load the raster
r <- rast("Data/GREEN_SPACE_DATA/rivm_greenmap_2022/natura2000/natura2000tiffile/natura2000tiffile.tif")

# Replace NA (nodata) values with 0
r <- classify(r, cbind(NA, 0), others = TRUE)

# Save the modified raster
writeRaster(r, "Data/GREEN_SPACE_DATA/rivm_greenmap_2022/natura2000/natura2000_reclassified/natura2000_reclassified.tif", overwrite = FALSE)


###in othergreen raster layer, change nodata values to 0

# Load the raster
r <- rast("Data/GREEN_SPACE_DATA/rivm_greenmap_2022/other_green/othergreentififle/other_greentiffile.tif")

# Replace NA (nodata) values with 0
r <- classify(r, cbind(NA, 0), others = TRUE)

# Save the modified raster
writeRaster(r, "Data/GREEN_SPACE_DATA/rivm_greenmap_2022/other_green/othergreen_reclassified/othergreen_reclassified.tif", overwrite = FALSE)




#############################################################
###convert Greenmap_water data from raster to vector in ArcGIS Pro

###upload rasters

GM_agricultureblue_raster <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/gm_agriculture_blue/agri_blue.tif")

GM_allgreenblue_raster <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/gm_allgrn_bl/gm_allgrn_bl.tif")

GM_naturenetworkblue_raster <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/gm_natu_network_blue/natnet_blue.tif")

GM_natura2000blue_raster <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/gm_natura2000_blue/nat2000_blue.tif")

GM_othergreenblue_raster <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/gm_othergreen_blue/othrgrn_blue.tif")


###########################################
####convert

###Agriculture water data
GM_agricultureblue_vector <- as.polygons(GM_agricultureblue_raster, dissolve = TRUE)
writeVector(GM_agricultureblue_vector, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/vector_versions/GM_agriculture_blue_vector/GM_agicultureblue_vector.shp", filetype = "ESRI Shapefile")

###GM_allgreenblue
GM_allgreenblue_vector <- as.polygons(GM_allgreenblue_raster, dissolve = TRUE)
writeVector(GM_allgreenblue_vector, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/vector_versions/GM_allgrnblue_vector/GM_allgreenblue_vector.shp", filetype = "ESRI Shapefile")

###GM_naturenetworkblue
GM_naturenetworkblue_vector <- as.polygons(GM_naturenetworkblue_raster, dissolve = TRUE)
writeVector(GM_naturenetworkblue_vector, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/vector_versions/GM_naturenetwork_blue_vector/GM_naturenetworkblue_vector.shp", filetype = "ESRI Shapefile")

###GM_natura2000blue
GM_natura2000blue_vector <- as.polygons(GM_natura2000blue_raster, dissolve = TRUE)
writeVector(GM_natura2000blue_vector, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/vector_versions/GM_natura2000_blue_vector/GM_natura2000blue_vector.shp", filetype = "ESRI Shapefile")

###GM_othergreenblue
GM_othergreenblue_vector <- as.polygons(GM_othergreenblue_raster, dissolve = TRUE)
writeVector(GM_othergreenblue_vector, "Data/GREEN_BLUE_SPACE_DATA_COMBINED/RIVM_greenmap_and_bluespace/vector_versions/GM_othergreenblue_vector/GM_othergreenblue_vector.shp", filetype = "ESRI Shapefile")


  
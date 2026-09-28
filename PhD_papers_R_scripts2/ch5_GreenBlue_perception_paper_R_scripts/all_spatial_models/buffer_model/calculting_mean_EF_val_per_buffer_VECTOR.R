###########################################################################
###########################Euclidean buffer model VECTOR DATA FINAL VERSION 

###script for calculating the average environmental factor (in vector format) value per Euclidean buffer

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
library(exactextractr)



###########################################################################################################
######################UPLOAD VECTOR GREEN AND BLUE DATA SHAPEFILES


landuse_allgreen <- st_read("landuse_water/landuse_allgreen_blue.shp")  
# Load greenblue_space polygons
names(landuse_allgreen)[names(landuse_allgreen) == 'category'] <- 'nameofbluegreen'
landuse_allgreen$category <- rep(c("greenblue"))
###select relevant columns
landuse_allgreen  <- select(landuse_allgreen, category, geometry)

landuse_agricultural <- st_read("landuse_water/landuse_agricultural_blue.shp") 

landuse_forestandnatural <- st_read("landuse_water/landuse_forestandnatural_blue.shp") 

landuse_recreationarea <- st_read("landuse_water/landuse_recreation_area_blue.shp") 

parks <- st_read("parks_water/parks_blue.shp")



#UPLOAD BUFFER SHAPEFILES    NOTE: need to create buffers of desired radius around each residential address, in the format of a shapefile
buffers <- st_read("BUFFERS/BAG_2019_within_SV_50m_buf_RDnew_2.shp")





###################################################################################################
###################################################################################################
###################################################################################################
###############EUCLIDEAN BUFFER MODEL FOR VECTOR DATA


#NOTE: model can be rerun with each of the desired buffer sizes: 20, 50, 150, 300, 600 meters


#################################
###LANDUSE ALL GREEN, AND WATER

# Perform a spatial join to retain all buffers, even if there is no overlap
intersection <- st_join(buffers, landuse_allgreen, left = TRUE)

#remove any duplicate rows
intersection <- distinct(intersection)

# Intersect buffers and greenspace polygons (may reduce rows for intersections only)
intersection <- st_intersection(buffers, landuse_allgreen)

# Calculate the area of the intersection
intersection$overlap_area <- st_area(intersection)

# Calculate the total area of each buffer (circle)
buffers$buffer_area <- st_area(buffers)

#find the mean value of total area of each buffers(values vary slightly)
mean(buffers$buffer_area)

#calculate the percentage of green and blue space overlapping within buffers
intersection$greenblue_percent <- (intersection$overlap_area * 100) / mean(buffers$buffer_area)

#add greenblue_percentage column from intersection to the buffers data
result <- buffers %>%
  left_join(intersection %>% st_drop_geometry() %>% select(OID_, greenblue_percent), by = "OID_")

#change NA to 0
result <- result %>%
  mutate(greenblue_percent = ifelse(is.na(greenblue_percent), 0, greenblue_percent))

#rename percent column to something clearer
names(result)[names(result) == 'greenblue_percent'] <- 'LU_allgrn_and_water_pcnt'

#select relevant columns to save
result <- subset(result, select = c(OID_, LU_allgrn_and_water_pcnt))
result <- sf::st_drop_geometry(result)

#round LU_rec_and_water_pcnt column to 4 decimal places
result <- round(result, digits = 4)

# Save the result as a csv file
write.csv(result, "buffer_calculations/landuse_allgrnblue/landuse_allgrnblue_percent_of_greenblue_space_within_50mbuffer.csv")




#################################
###LANDUSE AGRICULTURAL, AND WATER

# Perform a spatial join to retain all buffers, even if there is no overlap
intersection <- st_join(buffers, landuse_agricultural, left = TRUE)

#remove any duplicate rows
intersection <- distinct(intersection)

# Intersect buffers and greenspace polygons (may reduce rows for intersections only)
intersection <- st_intersection(buffers, landuse_agricultural)

# Calculate the area of the intersection
intersection$overlap_area <- st_area(intersection)

# Calculate the total area of each buffer (circle)
buffers$buffer_area <- st_area(buffers)

#find the mean value of total area of each buffers(values vary slightly)
mean(buffers$buffer_area)

#calculate the percentage of green and blue space overlapping within buffers
intersection$greenblue_percent <- (intersection$overlap_area * 100) / mean(buffers$buffer_area)

#add greenblue_percentage column from intersection to the buffers data
result <- buffers %>%
  left_join(intersection %>% st_drop_geometry() %>% select(OID_, greenblue_percent), by = "OID_")

#change NA to 0
result <- result %>%
  mutate(greenblue_percent = ifelse(is.na(greenblue_percent), 0, greenblue_percent))


#rename percent column to something clearer
names(result)[names(result) == 'greenblue_percent'] <- 'LU_agri_and_water_pcnt'

#select relevant columns to save
result <- subset(result, select = c(OID_, LU_agri_and_water_pcnt))
result <- sf::st_drop_geometry(result)

#round LU_rec_and_water_pcnt column to 4 decimal places
result <- round(result, digits = 4)

# Save the result as a csv file
write.csv(result, "landuse_agriblue_percent_of_greenblue_space_within_50mbuffer.csv")




###############################
###LANDUSE FOREST AND NATURAL, AND WATER

# Perform a spatial join to retain all buffers, even if there is no overlap
intersection <- st_join(buffers, landuse_forestandnatural, left = TRUE)

#remove any duplicate rows
intersection <- distinct(intersection)

# Intersect buffers and greenspace polygons (may reduce rows for intersections only)
intersection <- st_intersection(buffers, landuse_forestandnatural)

# Calculate the area of the intersection
intersection$overlap_area <- st_area(intersection)

# Calculate the total area of each buffer (circle)
buffers$buffer_area <- st_area(buffers)

#find the mean value of total area of each buffers(values vary slightly)
mean(buffers$buffer_area)

#calculate the percentage of green and blue space overlapping within buffers
intersection$greenblue_percent <- (intersection$overlap_area * 100) / mean(buffers$buffer_area)

#add greenblue_percentage column from intersection to the buffers data
result <- buffers %>%
  left_join(intersection %>% st_drop_geometry() %>% select(OID_, greenblue_percent), by = "OID_")

#change NA to 0
result <- result %>%
  mutate(greenblue_percent = ifelse(is.na(greenblue_percent), 0, greenblue_percent))

#rename percent column to something clearer
names(result)[names(result) == 'greenblue_percent'] <- 'LU_forestnatural_water_pcnt'

#select relevant columns to save
result <- subset(result, select = c(OID_, LU_forestnatural_water_pcnt))
result <- sf::st_drop_geometry(result)

#round LU_rec_and_water_pcnt column to 4 decimal places
result <- round(result, digits = 4)

# Save the result as a csv file
write.csv(result, "landuse_forestnaturalblue_percent_of_greenblue_space_within_50mbuffer.csv")





#################################
###LANDUSE RECREATION AREA, AND WATER

# Perform a spatial join to retain all buffers, even if there is no overlap
intersection <- st_join(buffers, landuse_recreationarea , left = TRUE)

#remove any duplicate rows
intersection <- distinct(intersection)

# Intersect buffers and greenspace polygons (may reduce rows for intersections only)
intersection <- st_intersection(buffers, landuse_recreationarea )

# Calculate the area of the intersection
intersection$overlap_area <- st_area(intersection)

# Calculate the total area of each buffer (circle)
buffers$buffer_area <- st_area(buffers)

#find the mean value of total area of each buffers(values vary slightly)
mean(buffers$buffer_area)

#calculate the percentage of green and blue space overlapping within buffers
intersection$greenblue_percent <- (intersection$overlap_area * 100) / mean(buffers$buffer_area)

#add greenblue_percentage column from intersection to the buffers data
result <- buffers %>%
  left_join(intersection %>% st_drop_geometry() %>% select(OID_, greenblue_percent), by = "OID_")

#change NA to 0
result <- result %>%
  mutate(greenblue_percent = ifelse(is.na(greenblue_percent), 0, greenblue_percent))

#rename percent column to something clearer
names(result)[names(result) == 'greenblue_percent'] <- 'LU_rec_and_water_pcnt'

#select relevant columns to save
result <- subset(result, select = c(OID_, LU_rec_and_water_pcnt))
result <- sf::st_drop_geometry(result)

#round LU_rec_and_water_pcnt column to 4 decimal places
result <- round(result, digits = 4)

# Save the result as a csv file
write.csv(result, "landuse_recreation_percent_of_greenblue_space_within_50mbuffer.csv")



#################################
###PARKS, AND WATER

# Perform a spatial join to retain all buffers, even if there is no overlap
intersection <- st_join(buffers, parks, left = TRUE)

#remove any duplicate rows
intersection <- distinct(intersection)

# Intersect buffers and greenspace polygons (may reduce rows for intersections only)
intersection <- st_intersection(buffers, parks)

# Calculate the area of the intersection
intersection$overlap_area <- st_area(intersection)

# Calculate the total area of each buffer (circle)
buffers$buffer_area <- st_area(buffers)

#find the mean value of total area of each buffers(values vary slightly)
mean(buffers$buffer_area)

#calculate the percentage of green and blue space overlapping within buffers
intersection$greenblue_percent <- (intersection$overlap_area * 100) / mean(buffers$buffer_area)

#add greenblue_percentage column from intersection to the buffers data
result <- buffers %>%
  left_join(intersection %>% st_drop_geometry() %>% select(OID_, greenblue_percent), by = "OID_")

#change NA to 0
result <- result %>%
  mutate(greenblue_percent = ifelse(is.na(greenblue_percent), 0, greenblue_percent))


#rename percent column to something clearer
names(result)[names(result) == 'greenblue_percent'] <- 'parks_and_water_pcnt'

#select relevant columns to save
result <- subset(result, select = c(OID_, parks_and_water_pcnt))
result <- sf::st_drop_geometry(result)

#round LU_rec_and_water_pcnt column to 4 decimal places
result <- round(result, digits = 4)

# Save the result as a csv file
write.csv(result, "parksblue_percent_of_greenblue_space_within_50mbuffer.csv")



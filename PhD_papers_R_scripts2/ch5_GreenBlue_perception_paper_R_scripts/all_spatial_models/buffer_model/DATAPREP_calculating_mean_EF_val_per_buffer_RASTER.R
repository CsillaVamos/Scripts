###########################################################################
###########################Eucdliean buffer model for fourth paper RASTER DATA 

###calculating the average environmental factor value (in raster format) per Euclidean buffer

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
library(tidyverse)
library(rgeos)
library(tmap) 
library(sfheaders)
library(knitr)


##############################################################################
#########UPLOAD BAG DATA

BAG <- st_read("BAG_2019_within_SV_intersect_RDnew.shp")
#select every 10th row
BAG <- BAG[seq(1, nrow(BAG), 10), ]
#selec relevant rows
BAG <- select(BAG, OID_, postcode, woonplaats, POINT_X, POINT_Y, geometry)
BAGdata <- BAG



#################################################################################################
#######################################################################################
################EUCLIDEAN RASTER BUFFER MODEL

#NOTE: model can be rerun with each of the desired buffer sizes: 20, 50, 150, 300, 600 meters

#########################
### NDVI blue

#upload NDVI blue data
NDVIblue <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/NDVI/NDVI_blue_mean.tif")

#bag data
BAGdata <- BAG

#identify columns with X Y  coordinates
sf_BAGdata_2019 <-st_as_sf(BAGdata,coords=c(4,5))##, 4,5 is the xcoordinate and ycoordinate

#Ensure that sf_BAGdata_2019 has an ID column
sf_BAGdata_2019$ID <- seq_len(nrow(sf_BAGdata_2019)) # Create unique ID for each row

#Buffer creation (as in your script)
v <- st_buffer(sf_BAGdata_2019, dist = 50)
v <- st_as_sf(v)  # Ensure it's an sf object

#Mean calculation
mean_buffer <- terra::extract(x = NDVIblue, y = v, fun = mean, df = TRUE)

#Add the ID column to the buffer mean results
mean_buffer$ID <- 1:nrow(mean_buffer)

#Merge mean_buffer with sf_BAGdata_2019 based on the ID column
result <- merge(mean_buffer, sf_BAGdata_2019, by = "ID")

#rename columns with average NDVI values to something more clear
names(result)[names(result) == 'Band_1'] <- 'NDVIblue_val'

# Step 6: Display the first few rows of the result
head(result)

#select relevant columns
result2 <- subset(result, select = c(OID_, NDVIblue_val))

#save result as a csv file
write.csv(result2, "NDVIblue_ave_per_buffer50.csv")






#########################
### TREE HEIGHT blue

#upload tree height blue data
treeheightblue <- rast("Data/GREEN_BLUE_SPACE_DATA_COMBINED/treeheight/treeheight_blue_mean.tif")

#bag data
BAGdata <- BAG

#identify columns with X Y  coordinates
sf_BAGdata_2019 <-st_as_sf(BAGdata,coords=c(4,5))##, 4,5 is the xcoordinate and ycoordinate

#Ensure that sf_BAGdata_2019 has an ID column
sf_BAGdata_2019$ID <- seq_len(nrow(sf_BAGdata_2019)) # Create unique ID for each row

#Buffer creation (as in your script)
v <- st_buffer(sf_BAGdata_2019, dist = 50)
v <- st_as_sf(v)  # Ensure it's an sf object

#Mean calculation
mean_buffer <- terra::extract(x = treeheightblue, y = v, fun = mean, df = TRUE)

#Add the ID column to the buffer mean results
mean_buffer$ID <- 1:nrow(mean_buffer)

#Merge mean_buffer with sf_BAGdata_2019 based on the ID column
result <- merge(mean_buffer, sf_BAGdata_2019, by = "ID")

#rename columns with average treeheightblue values to something more clear
names(result)[names(result) == 'treeheight'] <- 'treeheightblue_val'

#convert treeheight blue column into percentages
result$treeheightblue_val <- result$treeheightblue_val * 100

# Step 6: Display the first few rows of the result
head(result)

#select relevant columns
result2 <- subset(result, select = c(OID_, treeheightblue_val))

#save result as a csv file
write.csv(result2, "treeheightblue_ave_per_buffer50.csv")


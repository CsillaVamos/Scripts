#########################################################################################33
############NEIGHBORHOOD MODEL FOR RASTER DATA


#upload green and green-blue data
ndvi_blue_raster <- rast("Euclidean_buffer_model_Csilla/NDVI_water/NDVI_blue_mean.tif")
ndvi_raster <- rast("DATA/GREEN_SPACE_DATA/ndvi_sentinel_2022/ndvi_recalc.tif")
treeheight_blue_raster <- rast("Euclidean_buffer_model_Csilla/treeheight_water/treeheight_blue_mean.tif")
treeheight_raster <- rast("DATA/GREEN_SPACE_DATA/Tree_height/20200629_gm_Bomenkaart_v2.tif")

parks_raster <- rast("DATA/GREEN_SPACE_DATA/NL_parks_shapefile/parks_raster.tif")

#upload buurt boundaries
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, POLY_AREA, geometry))  #select relevant information

#select every nth row
#neighborhoods = neighborhoods[seq(1, nrow(neighborhoods), 300), ]

nrow(neighborhoods)

####calculate the average NDVI value per neighborhood boundary

# Convert sf to SpatVector (terra's format)
neighborhoods_vect <- vect(neighborhoods)

mean_ndvi_list <- vector("numeric", length(neighborhoods_vect))

#process neighborhood by neighborhood:
for (i in seq_along(neighborhoods_vect)) {
  mean_ndvi_list[i] <- terra::extract(ndvi_raster, neighborhoods_vect[i, ], fun=mean, na.rm=TRUE, weights=TRUE)[,2]
}

neighborhoods$mean_ndvi <- mean_ndvi_list


# Save the result as a new shapefile (optional)
st_write(neighborhoods, "neighborhood_model_results/neighborhoods_with_ndvi.shp", delete_layer = TRUE)



####calculate the average ndvi_blue value per neighborhood boundary

# Convert sf to SpatVector (terra's format)
neighborhoods_vect <- vect(neighborhoods)

mean_ndvi_blue_list <- vector("numeric", length(neighborhoods_vect))

#process neighborhood by neighborhood:
for (i in seq_along(neighborhoods_vect)) {
  mean_ndvi_blue_list[i] <- terra::extract(ndvi_blue_raster, neighborhoods_vect[i, ], fun=mean, na.rm=TRUE, weights=TRUE)[,2]
}

neighborhoods$mean_ndvi_blue <- mean_ndvi_blue_list


# Save the result as a new shapefile (optional)
st_write(neighborhoods, "neighborhood_model_results/neighborhoods_with_ndvi_blue.shp", delete_layer = TRUE)


print("done")



####calculate the average treeheight_blue value per neighborhood boundary

# Convert sf to SpatVector (terra's format)
neighborhoods_vect <- vect(neighborhoods)

mean_treeheight_blue_list <- vector("numeric", length(neighborhoods_vect))

#process neighborhood by neighborhood:
for (i in seq_along(neighborhoods_vect)) {
  mean_treeheight_blue_list[i] <- terra::extract(treeheight_blue_raster, neighborhoods_vect[i, ], fun=mean, na.rm=TRUE, weights=TRUE)[,2]
}

neighborhoods$mean_treeheight_blue <- mean_treeheight_blue_list


# Save the result as a new shapefile (optional)
st_write(neighborhoods, "neighborhood_model_results/neighborhoods_with_treeheight_blue.shp", delete_layer = TRUE)


print("done")




####calculate the average treeheight value per neighborhood boundary

# Convert sf to SpatVector (terra's format)
neighborhoods_vect <- vect(neighborhoods)

mean_treeheight_list <- vector("numeric", length(neighborhoods_vect))

#process neighborhood by neighborhood:
for (i in seq_along(neighborhoods_vect)) {
  mean_treeheight_list[i] <- terra::extract(treeheight_raster, neighborhoods_vect[i, ], fun=mean, na.rm=TRUE, weights=TRUE)[,2]
}

neighborhoods$mean_treeheight <- mean_treeheight_list


# Save the result as a new shapefile (optional)
st_write(neighborhoods, "neighborhood_model_results/neighborhoods_with_treeheight.shp", delete_layer = TRUE)


write.csv(neighborhoods, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/Treecover_meanvals.csv", row.names = FALSE)






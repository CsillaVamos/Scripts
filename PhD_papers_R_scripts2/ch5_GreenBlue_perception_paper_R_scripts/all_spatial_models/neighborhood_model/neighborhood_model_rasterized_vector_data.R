#############################################################################################################################################3
###########################################################################################################################################
########################SCRIPT TO CALCULATE THE PERCENTAGE OF GREEN AND GREEN-BLUE AREA PER BUURT BOUNDARY



###############################################################################################################
########PARKS 

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average parks value per neighborhood boundary

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
  parks_pcnt = (parks_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$park_area <- round(results_df$park_area, 4)
results_df$parks_percentage <- round(results_df$parks_percentage, 4)

results_df


# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/parks_pcnt_buurt.csv", row.names = FALSE)





##########################################################################################################################
############PARKS BLUE

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)
#neighborhoods = neighborhoods[seq(1, nrow(neighborhoods), 12), ]
nrow(neighborhoods)

####calculate the average parks_blue value per neighborhood boundary

parks_blue_raster <- rast("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/parks/parks_blue_raster.tif")



# Convert raster to `raster` format for exactextractr
parks_blue_raster_r <- raster(parks_blue_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(parks_blue_raster)[1]  # Cell width
res_y <- res(parks_blue_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
parks_blue_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract parks_blue area with exactextractr and ensure correct vector format
  batch_parks_blue_area <- unlist(exact_extract(parks_blue_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_parks_blue_area) != nrow(batch_sf)) {
    batch_parks_blue_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  parks_blue_area_values[start_idx:end_idx] <- batch_parks_blue_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  parks_blue_area = parks_blue_area_values,
  parks_blue_pcnt = (parks_blue_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$parks_blue_area <- round(results_df$parks_blue_area, 4)
results_df$parks_blue_pcnt <- round(results_df$parks_blue_pcnt, 4)

head(results_df)


# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/parks_blue_pcnt_buurt.csv", row.names = FALSE)





####################################################################################################
###########RECREATION AREA

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average recreation_area value per neighborhood boundary

recreation_area_raster <- rast("DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/recreation_area_raster/recreation_area_raster.tif")

# Convert raster to `raster` format for exactextractr
recreation_area_raster_r <- raster(recreation_area_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(recreation_area_raster)[1]  # Cell width
res_y <- res(recreation_area_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
recreation_area_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract recreation_area area with exactextractr and ensure correct vector format
  batch_recreation_area_area <- unlist(exact_extract(recreation_area_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_recreation_area_area) != nrow(batch_sf)) {
    batch_recreation_area_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  recreation_area_area_values[start_idx:end_idx] <- batch_recreation_area_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  recreation_area_area = recreation_area_area_values,
  recreation_area_pcnt = (recreation_area_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$recreation_area_area <- round(results_df$recreation_area_area, 4)
results_df$recreation_area_pcnt <- round(results_df$recreation_area_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/recreation_area_pcnt_buurt.csv", row.names = FALSE)






####################################################################################################
###########RECREATION AREA BLUE

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average recreation_area_blue value per neighborhood boundary

recreation_area_blue_raster <- rast("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/recreation_area_blue_raster/recreation_area_blue_raster.tif")


# Convert raster to `raster` format for exactextractr
recreation_area_blue_raster_r <- raster(recreation_area_blue_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(recreation_area_blue_raster)[1]  # Cell width
res_y <- res(recreation_area_blue_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
recreation_area_blue_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract recreation_area_blue area with exactextractr and ensure correct vector format
  batch_recreation_area_blue_area <- unlist(exact_extract(recreation_area_blue_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_recreation_area_blue_area) != nrow(batch_sf)) {
    batch_recreation_area_blue_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  recreation_area_blue_area_values[start_idx:end_idx] <- batch_recreation_area_blue_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  recreation_area_blue_area = recreation_area_blue_area_values,
  recreation_area_blue_pcnt = (recreation_area_blue_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$recreation_area_blue_area <- round(results_df$recreation_area_blue_area, 4)
results_df$recreation_area_blue_pcnt <- round(results_df$recreation_area_blue_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/recreation_area_blue_pcnt_buurt.csv", row.names = FALSE)




####################################################################################################
###########agricultural AREA

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural value per neighborhood boundary

agricultural_raster <- rast("DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/agricultural_raster/agricultural_raster.tif")

# Convert raster to `raster` format for exactextractr
agricultural_raster_r <- raster(agricultural_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(agricultural_raster)[1]  # Cell width
res_y <- res(agricultural_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
agricultural_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract agricultural area with exactextractr and ensure correct vector format
  batch_agricultural_area <- unlist(exact_extract(agricultural_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_agricultural_area) != nrow(batch_sf)) {
    batch_agricultural_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  agricultural_area_values[start_idx:end_idx] <- batch_agricultural_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  agricultural_area = agricultural_area_values,
  agricultural_pcnt = (agricultural_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$agricultural_area <- round(results_df$agricultural_area, 4)
results_df$agricultural_pcnt <- round(results_df$agricultural_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/agricultural_pcnt_buurt.csv", row.names = FALSE)




####################################################################################################
###########agricultural blue

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural_blue value per neighborhood boundary

agricultural_blue_raster <- rast("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/agricultural_blue_raster/agricultural_blue_raster.tif")


# Convert raster to `raster` format for exactextractr
agricultural_blue_raster_r <- raster(agricultural_blue_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(agricultural_blue_raster)[1]  # Cell width
res_y <- res(agricultural_blue_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
agricultural_blue_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract agricultural_blue area with exactextractr and ensure correct vector format
  batch_agricultural_blue_area <- unlist(exact_extract(agricultural_blue_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_agricultural_blue_area) != nrow(batch_sf)) {
    batch_agricultural_blue_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  agricultural_blue_area_values[start_idx:end_idx] <- batch_agricultural_blue_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  agricultural_blue_area = agricultural_blue_area_values,
  agricultural_blue_pcnt = (agricultural_blue_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$agricultural_blue_area <- round(results_df$agricultural_blue_area, 4)
results_df$agricultural_blue_pcnt <- round(results_df$agricultural_blue_pcnt, 4)

head(results_df)


# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/agricultural_blue_pcnt_buurt.csv", row.names = FALSE)






####################################################################################################
###########forest and natural 

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural value per neighborhood boundary

forestandnatural_raster <- rast("DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/forest_and_open_natural_terrain_raster/forestandnatural_raster.tif")



# Convert raster to `raster` format for exactextractr
forestandnatural_raster_r <- raster(forestandnatural_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(forestandnatural_raster)[1]  # Cell width
res_y <- res(forestandnatural_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
forestandnatural_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract forestandnatural area with exactextractr and ensure correct vector format
  batch_forestandnatural_area <- unlist(exact_extract(forestandnatural_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_forestandnatural_area) != nrow(batch_sf)) {
    batch_forestandnatural_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  forestandnatural_area_values[start_idx:end_idx] <- batch_forestandnatural_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  forestandnatural_area = forestandnatural_area_values,
  forestandnatural_pcnt = (forestandnatural_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$forestandnatural_area <- round(results_df$forestandnatural_area, 4)
results_df$forestandnatural_pcnt <- round(results_df$forestandnatural_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/forestandnatural_pcnt_buurt.csv", row.names = FALSE)





####################################################################################################
###########forest and natural blue 

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural value per neighborhood boundary

forestandnatural_blue_raster <- rast("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/forestandnatural_blue_raster/forestandnatural_blue_raster.tif")


# Convert raster to `raster` format for exactextractr
forestandnatural_blue_raster_r <- raster(forestandnatural_blue_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(forestandnatural_blue_raster)[1]  # Cell width
res_y <- res(forestandnatural_blue_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
forestandnatural_blue_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract forestandnatural_blue area with exactextractr and ensure correct vector format
  batch_forestandnatural_blue_area <- unlist(exact_extract(forestandnatural_blue_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_forestandnatural_blue_area) != nrow(batch_sf)) {
    batch_forestandnatural_blue_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  forestandnatural_blue_area_values[start_idx:end_idx] <- batch_forestandnatural_blue_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  forestandnatural_blue_area = forestandnatural_blue_area_values,
  forestandnatural_blue_pcnt = (forestandnatural_blue_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$forestandnatural_blue_area <- round(results_df$forestandnatural_blue_area, 4)
results_df$forestandnatural_blue_pcnt <- round(results_df$forestandnatural_blue_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/forestandnatural_blue_pcnt_buurt.csv", row.names = FALSE)









####################################################################################################
###########all green landuse

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural value per neighborhood boundary

allgreen_raster <- rast("DATA/GREEN_SPACE_DATA/LGN2021/RASTER_VERSIONS/allgreen_raster/allgreen_raster.tif")



# Convert raster to `raster` format for exactextractr
allgreen_raster_r <- raster(allgreen_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(allgreen_raster)[1]  # Cell width
res_y <- res(allgreen_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
allgreen_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract allgreen area with exactextractr and ensure correct vector format
  batch_allgreen_area <- unlist(exact_extract(allgreen_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_allgreen_area) != nrow(batch_sf)) {
    batch_allgreen_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  allgreen_area_values[start_idx:end_idx] <- batch_allgreen_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  allgreen_area = allgreen_area_values,
  allgreen_pcnt = (allgreen_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$allgreen_area <- round(results_df$allgreen_area, 4)
results_df$allgreen_pcnt <- round(results_df$allgreen_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/allgreen_pcnt_buurt.csv", row.names = FALSE)





####################################################################################################
###########all green landuse blue 

###upload neighborhood boudnary data
neighborhoods <- st_read("DATA/CBS_PC6_data/WijkBuurtkaart_2023_v2/buurten_2023.shp")
#select only relevant columns
neighborhoods <- subset(neighborhoods, select = c(buurtcode, buurtnaam, wijkcode, gemeentena, geometry))  #select relevant information
neighborhoods$neighborhood_area <- st_area(neighborhoods)


####calculate the average agricultural value per neighborhood boundary

allgreen_blue_raster <- rast("DATA/GREEN_BLUE_SPACE_DATA_COMBINED/landuse_RASTER/allgreen_blue_raster/allgreen_blue_raster.tif")



# Convert raster to `raster` format for exactextractr
allgreen_blue_raster_r <- raster(allgreen_blue_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(allgreen_blue_raster)[1]  # Cell width
res_y <- res(allgreen_blue_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
allgreen_blue_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract allgreen_blue area with exactextractr and ensure correct vector format
  batch_allgreen_blue_area <- unlist(exact_extract(allgreen_blue_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_allgreen_blue_area) != nrow(batch_sf)) {
    batch_allgreen_blue_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  allgreen_blue_area_values[start_idx:end_idx] <- batch_allgreen_blue_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  allgreen_blue_area = allgreen_blue_area_values,
  allgreen_blue_pcnt = (allgreen_blue_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$allgreen_blue_area <- round(results_df$allgreen_blue_area, 4)
results_df$allgreen_blue_pcnt <- round(results_df$allgreen_blue_pcnt, 4)

head(results_df)



# Save results as CSV (no geometry)
write.csv(results_df, "neighborhood_model_results_NEW/csv_files_of_greenspace_per_buurt/allgreen_blue_pcnt_buurt.csv", row.names = FALSE)




############################################################################################################3
#############################################################################################################
##############################################################################################################33
#####TEMPLATE



# Convert raster to `raster` format for exactextractr
DATASET_raster_r <- raster(DATASET_raster)

# Get raster resolution (assuming equal x and y resolution)
res_x <- res(DATASET_raster)[1]  # Cell width
res_y <- res(DATASET_raster)[2]  # Cell height
pixel_area <- res_x * res_y  # Area of one raster cell in square meters

# Initialize results storage
DATASET_area_values <- numeric(nrow(neighborhoods))

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
  
  # Extract DATASET area with exactextractr and ensure correct vector format
  batch_DATASET_area <- unlist(exact_extract(DATASET_raster_r, batch_sf, fun = "sum"))
  
  # Ensure the length matches the batch size
  if (length(batch_DATASET_area) != nrow(batch_sf)) {
    batch_DATASET_area <- rep(0, nrow(batch_sf))  # Fill missing values with 0
  }
  
  # Store results correctly
  DATASET_area_values[start_idx:end_idx] <- batch_DATASET_area * pixel_area
  
  
  cat(sprintf("Batch %d completed!\n", i))
}

# Store results in a new dataframe (dropping geometry)
results_df <- data.frame(
  neighborhood_id = neighborhoods$buurtcode,  # Adjust column name
  neighborhood_area = as.numeric(neighborhoods$neighborhood_area),
  DATASET_area = DATASET_area_values,
  DATASET_pcnt = (DATASET_area_values * 100) / as.numeric(neighborhoods$neighborhood_area)
)


results_df$DATASET_area <- round(results_df$DATASET_area, 4)
results_df$DATASET_pcnt <- round(results_df$DATASET_pcnt, 4)

head(results_df)


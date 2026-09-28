#######################################################################################3
#######DISTANCE TO THE NEAREST MODEL SECOND VERSION



############################################3#upload data

#AMIGO residential addresses
AMIGOpoints <- st_read("AMIGO_points_UPDATED.shp")


allgreen_blue <- st_read("landuse_data/landuse_allgreen_blue.shp")





####################################################
####ALLGREEN AND BLUE


# Define chunk size
chunk_size <- 500

# Define the save directory
save_path <- "Distance_to_the_nearest_model_results/results/allgreen/"

# Ensure the directory exists (creates it if not)
if (!dir.exists(save_path)) {
  dir.create(save_path, recursive = TRUE)
}

# Determine the number of chunks
num_chunks <- ceiling(nrow(AMIGOpoints) / chunk_size)



# Define buffer distance (in meters)
buffer_distance <- 3000

# Loop through each chunk
for (i in 1:num_chunks) {
  
  # Define the start and end row indices for the chunk
  start_idx <- ((i - 1) * chunk_size) + 1
  end_idx <- min(i * chunk_size, nrow(AMIGOpoints))
  
  print(paste("Processing chunk", i, "of", num_chunks, ":", start_idx, "to", end_idx))
  
  # Extract the chunk
  AMIGO_chunk <- AMIGOpoints[start_idx:end_idx, ]
  
  # Initialize vector to store minimum distances
  min_distances <- numeric(nrow(AMIGO_chunk))
  
  # Loop through each point in the chunk
  for (j in 1:nrow(AMIGO_chunk)) {
    
    point <- AMIGO_chunk[j, ]
    
    # Find green spaces within 3000 meters of the point
    nearby_idx <- st_is_within_distance(point, allgreen, dist = buffer_distance)[[1]]
    
    # If there are nearby green spaces, compute distances and take the minimum
    if (length(nearby_idx) > 0) {
      dists <- st_distance(point, allgreen[nearby_idx, ])
      min_distances[j] <- min(dists)
    } else {
      # If no green space within 3000m, assign NA or large number
      min_distances[j] <- NA
    }
  }
  
  # Store the result
  AMIGO_chunk$allgreen_distance <- min_distances
  
  # Construct the full file path
  output_filename <- file.path(save_path, paste0("AMIGO_chunk_allgreen_", i, ".csv"))
  
  # Save chunk as a CSV file
  write.csv(AMIGO_chunk, output_filename, row.names = FALSE)
  
  # Print progress
  print(paste("Saved:", output_filename))
}

print("All chunks processed and saved!")


########################################################################################################
###############STREET VIEW IMAGE MODEL



.libPaths()


############################################################################################################################################
###upload data

svi_in_buffers <- read.csv("Data/gsv_in_buffers_with_segmentation/gsv_in_buffers_with_segmentation.csv")
buffer_20m <- st_read("Data/AMIGO_buffers/buffer_20m.shp")
buffer_50m <- st_read("Data/AMIGO_buffers/buffer_50m.shp")
buffer_150m <- st_read("Data/AMIGO_buffers/buffer_150m.shp")
buffer_300m <- st_read("Data/AMIGO_buffers/buffer_300m.shp")
buffer_600m <- st_read("Data/AMIGO_buffers/AMIGO_600mbuffers/AMIGO_600mbuffers.shp")


#####clean svi in buffers

#select relevant columns
svi_in_buffers2 <- svi_in_buffers[, c("gsv_panoid","gsv_lat","gsv_lon", "gsv_month","lau_code","c5","c10","c14","c17","c18","c22","c27","c30","c47","c61","c67","c69","c73","c95","c105","c114","c129")]

#rename 
names(svi_in_buffers2)[names(svi_in_buffers2) == "c5"] <- "tree"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c10"] <- "grass"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c14"] <- "earth_ground"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c17"] <- "mountain"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c18"] <- "plant"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c22"] <- "water"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c27"] <- "sea"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c30"] <- "field"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c47"] <- "sand"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c61"] <- "river"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c67"] <- "flower"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c69"] <- "hill"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c73"] <- "palmtree"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c95"] <- "soil"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c105"] <- "fountain"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c114"] <- "waterfall"
names(svi_in_buffers2)[names(svi_in_buffers2) == "c129"] <- "lake"

#add a new ID column
svi_in_buffers2$svi_ID <- seq_len(nrow(svi_in_buffers2))

# Convert to sf
svi_in_buffers_sf <- st_as_sf(
  svi_in_buffers2,
  coords = c("gsv_lon", "gsv_lat"),
  crs = 4326
)

#transform to RD new
svi_in_buffers_sf <- st_transform(svi_in_buffers_sf, 28992)

# Compute pixel sum
svi_in_buffers_sf$pixel_sum <- rowSums(
  st_drop_geometry(svi_in_buffers_sf)[, 4:20],
  na.rm = TRUE
)


#save sf
st_write(svi_in_buffers_sf, "Data/gsv_in_buffers_with_segmentation/SVI_points_2026.shp")


# Keep only relevant columns
svi_clean <- svi_in_buffers_sf[, c("gsv_panoid", "svi_ID", "pixel_sum", "geometry")]



####################################################################################################
### Function to compute SVI metrics for any buffer size
####################################################################################################

compute_svi_metrics <- function(buffer_sf, svi_sf) {
  st_join(buffer_sf, svi_sf, join = st_intersects) %>%
    group_by(geoid) %>%
    summarise(
      n_points = sum(!is.na(svi_ID)),          # correct count
      pixel_sum = sum(pixel_sum, na.rm = TRUE) # correct sum
    ) %>%
    mutate(
      mean_pixel_value = ifelse(n_points > 0, pixel_sum / n_points, 0)
    ) %>%
    st_drop_geometry()
}


####################################################################################################
### Compute metrics for all buffer sizes
####################################################################################################

res20  <- compute_svi_metrics(buffer_20m,  svi_clean)
res50  <- compute_svi_metrics(buffer_50m,  svi_clean)
res150 <- compute_svi_metrics(buffer_150m, svi_clean)
res300 <- compute_svi_metrics(buffer_300m, svi_clean)
res600 <- compute_svi_metrics(buffer_600m, svi_clean)


####################################################################################################
### Rename columns
####################################################################################################

names(res20)[names(res20) == "n_points"] <- "buf20m_svi_count"
names(res20)[names(res20) == "pixel_sum"] <- "buf20m_sum_pix"
names(res20)[names(res20) == "mean_pixel_value"] <- "buf20m_mean_pix"

names(res50)[names(res50) == "n_points"] <- "buf50m_svi_count"
names(res50)[names(res50) == "pixel_sum"] <- "buf50m_sum_pix"
names(res50)[names(res50) == "mean_pixel_value"] <- "buf50m_mean_pix"

names(res150)[names(res150) == "n_points"] <- "buf150m_svi_count"
names(res150)[names(res150) == "pixel_sum"] <- "buf150m_sum_pix"
names(res150)[names(res150) == "mean_pixel_value"] <- "buf150m_mean_pix"

names(res300)[names(res300) == "n_points"] <- "buf300m_svi_count"
names(res300)[names(res300) == "pixel_sum"] <- "buf300m_sum_pix"
names(res300)[names(res300) == "mean_pixel_value"] <- "buf300m_mean_pix"

names(res600)[names(res600) == "n_points"] <- "buf600m_svi_count"
names(res600)[names(res600) == "pixel_sum"] <- "buf600m_sum_pix"
names(res600)[names(res600) == "mean_pixel_value"] <- "buf600m_mean_pix"


####################################################################################################
### Join all results
####################################################################################################

svi_mean_pixel_val <- res20 %>%
  left_join(res50,  by = "geoid") %>%
  left_join(res150, by = "geoid") %>%
  left_join(res300, by = "geoid") %>%
  left_join(res600, by = "geoid")

head(svi_mean_pixel_val)

####################################################################################################
### Save final dataset
####################################################################################################

write.csv(
  svi_mean_pixel_val,
  "svi_mean_pixel_value_per_buffer_CORRECTED.csv",
  row.names = FALSE
)


view(svi_mean_pixel_val)


























































#####################################################################################################
###############################################################################################
#####################################################################################################
###############################################################################################
#####################################################################################################
###############################################################################################
#OLD VERSION


#####################################################################################################
###############################################################################################
#####calculate svi points within each buffer

svi_in_buffers_sf <- st_read("Data/gsv_in_buffers_with_segmentation/SVI_points_2026.shp")


###############prepare dataset

#take out irrelevant columns
svi_in_buffers_sf <- svi_in_buffers_sf[, !names(svi_in_buffers_sf) %in% c("gsv_month","lau_code", "soil", "erth_gr")]

head(svi_in_buffers_sf)

svi_in_buffers_sf$pixel_sum <- rowSums(
  st_drop_geometry(svi_in_buffers_sf[, 2:17]),
  na.rm = TRUE
)


#####################################create a new dataframe with only relevant infomration for buffer analysis

#select relevant columns
svi_clean <- svi_in_buffers_sf[, c("gsv_panoid","svi_ID", "pixel_sum", "geometry")]

#save
st_write(svi_clean,"Data/gsv_in_buffers_with_segmentation/SVI_clean.shp")






#######################################################################################################
#####################################################################################################
#################################################FIND IMAGES WITHIN EACH BUFFER



##########################20 meter buffer
buffer20m_svi <- st_join(
  buffer_20m,
  svi_clean,
  join = st_intersects
) %>%
  group_by(geoid) %>%                  #use buffer ID field
  summarise(
    n_points = n(),
    pixel_sum = list(pixel_sum)            #use pixel sum field, to then later find the average value of these
  )

#save preliminiary results
saveRDS(buffer20m_svi, "RESULTS/RESULTS_2026/SVI/SVI_buffer20m.rds")




########################50 meter buffer
buffer50m_svi <- st_join(
  buffer_50m,
  svi_clean,
  join = st_intersects
) %>%
  group_by(geoid) %>%                  #use buffer ID field
  summarise(
    n_points = n(),
    pixel_sum = list(pixel_sum)            #use pixel sum field, to then later find the average value of these
  )

#save preliminiary results
saveRDS(buffer50m_svi, "RESULTS/RESULTS_2026/SVI/SVI_buffer50m.rds")




###############################150 meter buffer
buffer150m_svi <- st_join(
  buffer_150m,
  svi_clean,
  join = st_intersects
) %>%
  group_by(geoid) %>%                  #use buffer ID field
  summarise(
    n_points = n(),
    pixel_sum = list(pixel_sum)            #use pixel sum field, to then later find the average value of these
  )

#save preliminiary results
saveRDS(buffer150m_svi, "RESULTS/RESULTS_2026/SVI/SVI_buffer150m.rds")



###############################300 meter buffer
buffer300m_svi <- st_join(
  buffer_300m,
  svi_clean,
  join = st_intersects
) %>%
  group_by(geoid) %>%                  #use buffer ID field
  summarise(
    n_points = n(),
    pixel_sum = list(pixel_sum)            #use pixel sum field, to then later find the average value of these
  )

#save preliminiary results
saveRDS(buffer300m_svi, "RESULTS/RESULTS_2026/SVI/SVI_buffer300m.rds")




###############################600 meter buffer
buffer600m_svi <- st_join(
  buffer_600m,
  svi_clean,
  join = st_intersects
) %>%
  group_by(geoid) %>%                  #use buffer ID field
  summarise(
    n_points = n(),
    pixel_sum = list(pixel_sum)            #use pixel sum field, to then later find the average value of these
  )

#save preliminiary results
saveRDS(buffer600m_svi, "RESULTS/RESULTS_2026/SVI/SVI_buffer600m.rds")






######################################################################################################
####################################################################################################
###############Prepare results


########################20m buffer

#####find mean value of pixels and put in a new column
buffer20m_svi_pixel_sum <- buffer20m_svi %>%
  mutate(mean_pixel_value = sapply(pixel_sum, mean, na.rm = TRUE))

#drop column with list (pixel sum) and geometry
buffer20m_svi_pixel_sum$pixel_sum <- NULL
buffer20m_svi_pixel_sum$geometry <- NULL


#correct n points column
buffer20m_svi_pixel_sum <- buffer20m_svi_pixel_sum %>%
  mutate(n_points = n_points - 1)


#save
write.csv(buffer20m_svi_pixel_sum, "RESULTS/RESULTS_2026/SVI/SVI_buffer20m_meanpixelvalue.csv")





########################50m buffer

#####find mean value of pixels and put in a new column
buffer50m_svi_pixel_sum <- buffer50m_svi %>%
  mutate(mean_pixel_value = sapply(pixel_sum, mean, na.rm = TRUE))

#drop column with list (pixel sum) and geometry
buffer50m_svi_pixel_sum$pixel_sum <- NULL
buffer50m_svi_pixel_sum$geometry <- NULL


#correct n points column
buffer50m_svi_pixel_sum <- buffer50m_svi_pixel_sum %>%
  mutate(n_points = n_points - 1)


#save
write.csv(buffer50m_svi_pixel_sum, "RESULTS/RESULTS_2026/SVI/SVI_buffer50m_meanpixelvalue.csv")




########################150m buffer

#####find mean value of pixels and put in a new column
buffer150m_svi_pixel_sum <- buffer150m_svi %>%
  mutate(mean_pixel_value = sapply(pixel_sum, mean, na.rm = TRUE))

#drop column with list (pixel sum) and geometry
buffer150m_svi_pixel_sum$pixel_sum <- NULL
buffer150m_svi_pixel_sum$geometry <- NULL


#correct n points column
buffer150m_svi_pixel_sum <- buffer150m_svi_pixel_sum %>%
  mutate(n_points = n_points - 1)


#save
write.csv(buffer150m_svi_pixel_sum, "RESULTS/RESULTS_2026/SVI/SVI_buffer150m_meanpixelvalue.csv")




########################300m buffer

#####find mean value of pixels and put in a new column
buffer300m_svi_pixel_sum <- buffer300m_svi %>%
  mutate(mean_pixel_value = sapply(pixel_sum, mean, na.rm = TRUE))

#drop column with list (pixel sum) and geometry
buffer300m_svi_pixel_sum$pixel_sum <- NULL
buffer300m_svi_pixel_sum$geometry <- NULL


#correct n points column
buffer300m_svi_pixel_sum <- buffer300m_svi_pixel_sum %>%
  mutate(n_points = n_points - 1)


#save
write.csv(buffer300m_svi_pixel_sum, "RESULTS/RESULTS_2026/SVI/SVI_buffer300m_meanpixelvalue.csv")



########################600m buffer

#####find mean value of pixels and put in a new column
buffer600m_svi_pixel_sum <- buffer600m_svi %>%
  mutate(mean_pixel_value = sapply(pixel_sum, mean, na.rm = TRUE))

#drop column with list (pixel sum) and geometry
buffer600m_svi_pixel_sum$pixel_sum <- NULL
buffer600m_svi_pixel_sum$geometry <- NULL


#correct n points column
buffer600m_svi_pixel_sum <- buffer600m_svi_pixel_sum %>%
  mutate(n_points = n_points - 1)

#save
write.csv(buffer600m_svi_pixel_sum, "RESULTS/RESULTS_2026/SVI/SVI_buffer600m_meanpixelvalue.csv")





######################################################################################################
####################################################################################################
##########Prepare final results

buffer20m_svi_pixel_sum <- read.csv("RESULTS/RESULTS_2026/SVI/SVI_buffer20m_meanpixelvalue.csv")
buffer50m_svi_pixel_sum <- read.csv("RESULTS/RESULTS_2026/SVI/SVI_buffer50m_meanpixelvalue.csv")
buffer150m_svi_pixel_sum <- read.csv("RESULTS/RESULTS_2026/SVI/SVI_buffer150m_meanpixelvalue.csv")
buffer300m_svi_pixel_sum <- read.csv("RESULTS/RESULTS_2026/SVI/SVI_buffer300m_meanpixelvalue.csv")
buffer600m_svi_pixel_sum <- read.csv("RESULTS/RESULTS_2026/SVI/SVI_buffer600m_meanpixelvalue.csv")



###############################rename columns
names(buffer20m_svi_pixel_sum)[names(buffer20m_svi_pixel_sum) == "n_points"] <- "buf20m_svi_count"
names(buffer20m_svi_pixel_sum)[names(buffer20m_svi_pixel_sum) == "mean_pixel_value"] <- "buf20m_mean_pix"

names(buffer50m_svi_pixel_sum)[names(buffer50m_svi_pixel_sum) == "n_points"] <- "buf50m_svi_count"
names(buffer50m_svi_pixel_sum)[names(buffer50m_svi_pixel_sum) == "mean_pixel_value"] <- "buf50m_mean_pix"

names(buffer150m_svi_pixel_sum)[names(buffer150m_svi_pixel_sum) == "n_points"] <- "buf150m_svi_count"
names(buffer150m_svi_pixel_sum)[names(buffer150m_svi_pixel_sum) == "mean_pixel_value"] <- "buf150m_mean_pix"

names(buffer300m_svi_pixel_sum)[names(buffer300m_svi_pixel_sum) == "n_points"] <- "buf300m_svi_count"
names(buffer300m_svi_pixel_sum)[names(buffer300m_svi_pixel_sum) == "mean_pixel_value"] <- "buf300m_mean_pix"

names(buffer600m_svi_pixel_sum)[names(buffer600m_svi_pixel_sum) == "n_points"] <- "buf600m_svi_count"
names(buffer600m_svi_pixel_sum)[names(buffer600m_svi_pixel_sum) == "mean_pixel_value"] <- "buf600m_mean_pix"



#################################join together data sets
svi_mean_pixel_val <- buffer20m_svi_pixel_sum %>%
  left_join(buffer50m_svi_pixel_sum, by = "geoid") %>%
  left_join(buffer150m_svi_pixel_sum, by = "geoid") %>%
  left_join(buffer300m_svi_pixel_sum, by = "geoid") %>%
  left_join(buffer600m_svi_pixel_sum, by = "geoid")


head(svi_mean_pixel_val)


#####delete unwanted columns
svi_mean_pixel_val <- svi_mean_pixel_val[, !names(svi_mean_pixel_val) %in% c("X.x","X.y", "X.x.x", "X.y.y", "X")]


#save final dataset
write.csv(svi_mean_pixel_val, "RESULTS/RESULTS_2026/SVI/svi_mean_pixel_value_per_buffer.csv")
write.csv(svi_mean_pixel_val, "O://DGK/IRAS/EEPI/Projects/Amigo-student/Csilla_Vamos/streetview_image_analysis/svi_mean_pixel_value_per_buffer.csv")


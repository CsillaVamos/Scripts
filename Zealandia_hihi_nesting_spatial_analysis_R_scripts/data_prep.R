##############################################################################################################################################################################################
###########################Preparation of Zealandia bird nest datasets

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
library(ggplot2)
library(corrplot)


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("devtools", lib = "C:/R_temp_library")

# Load the package from that location
library(devtools, lib.loc = "C:/R_temp_library")

# Install glmnet to that folder
install.packages("spdep", lib = "C:/R_temp_library")

# Load the package from that location
library(spdep, lib.loc = "C:/R_temp_library")

# Install glmnet to that folder
install.packages("tmap", lib = "C:/R_temp_library")

# Load the package from that location
library(tmap, lib.loc = "C:/R_temp_library")






######################################################################################################################################################################################
##############Upload dataset and clean

nestdata <- read.csv("New Zealand/New_Zealand/Zealandia_nestboxes_EFs.csv", sep=";")

head(nestdata)
nrow(nestdata) #791



##create new column and determine success of each nesting 
nestdata$nest_success_pcnt <- (nestdata$fledglings * 100) / nestdata$eggs


###take out unnecessary columns
nestdata$Type <- NULL
nestdata$border_dist_ID <- NULL
nestdata$dist_to_border <- NULL
nestdata$water_dist_ID <- NULL
nestdata$dist_to_water <- NULL



######################################################################################
#########################MERGE WITH PREVIOUS CLEANED DATASET

nests_efs <- read.csv("New Zealand/New_Zealand/Hihi_nest_data/birdnests_and_efs_CLEANED.csv")
nests_efs$water_dist <- NULL

nests_efs <- cbind(
  nests_efs,
  nestdata[, c("water_dist", "feeder_dist")]
)

head(nests_efs)



##########################################################################################
#########################Add in other columns and clean


###make added columns numeric
nests_efs$water_dist <- gsub(",", ".", nests_efs$water_dist)
nests_efs$water_dist <- as.numeric(nests_efs$water_dist)

nests_efs$feeder_dist <- gsub(",", ".", nests_efs$feeder_dist)
nests_efs$feeder_dist <- as.numeric(nests_efs$feeder_dist)

###round added columns
nests_efs$water_dist <- round(nests_efs$water_dist, 2)
nests_efs$feeder_dist <- round(nests_efs$feeder_dist, 2)

nests_efs$Type <- NULL
nests_efs$X.1 <- NULL



###change name of point Z to ground elevation
names(nests_efs)[names(nests_efs) == 'POINT_Z'] <- 'ground_elev'

###add column with nest box height
nests_efs$nestbox_elev <- nests_efs$ground_elev + 1.5

nests_efs$nestbox_elev <- round(nests_efs$nestbox_elev, 2)
nests_efs$ground_elev <- round(nests_efs$ground_elev, 2)


names(nests_efs)[names(nests_efs) == 'X'] <- 'ID_row'


write.csv(nests_efs, "New Zealand/New_Zealand/nestboxes_and_EFs_FINAL.csv")

###############################################################################################
########FIX GROUND ELEVATION COLUMN

nest_new <- st_read("New Zealand/New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_2.shp")
head(nest_new)



###fix column names
names(nest_new)[names(nest_new) == 'seasn_y '] <- 'season_year'
names(nest_new)[names(nest_new) == 'nstb_ID'] <- 'nestbox_ID'
names(nest_new)[names(nest_new) == 'cltch_n '] <- 'clutch_num'
names(nest_new)[names(nest_new) == 'feml_cm'] <- 'female_com'
names(nest_new)[names(nest_new) == 'fldglng'] <- 'fledglings'
names(nest_new)[names(nest_new) == 'grnd_lv'] <- 'POINT_Z'
names(nest_new)[names(nest_new) == 'actl_ns'] <- 'actual_nest'
names(nest_new)[names(nest_new) == 'nst_scc'] <- 'nest_success_pcnt'
names(nest_new)[names(nest_new) == 'brdr_ds'] <- 'border_dist'
names(nest_new)[names(nest_new) == 'frst_ty'] <- 'forest_type'
names(nest_new)[names(nest_new) == 'aspct_d'] <- 'aspect_degree'
names(nest_new)[names(nest_new) == 'slp_dgr'] <- 'slope_degree'
names(nest_new)[names(nest_new) == 'forst_d'] <- 'forest_id'
names(nest_new)[names(nest_new) == 'wtr_dst'] <- 'water_dist'
names(nest_new)[names(nest_new) == 'fdr_dst'] <- 'feeder_dist'
nest_new$nstbx_l <- NULL
names(nest_new)[names(nest_new) == 'RASTERVALU'] <- 'ground_elev'
nest_new$ground_elev <- round(nest_new$ground_elev, 2)
nest_new$X <- NULL
head(nest_new)


###save as shapefile
st_write(nest_new, "New Zealand/New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_4.shp")

###save as csv file
write.csv(nest_new, "New Zealand/New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_4.csv")

head(nest_new)



###############################################################################################################################################
#############################################################################################################################
##########INITIAL ANALYSIS ON NEST AND EF DATA



###inspect distributions of all variables

nests_efs %>% 
  dplyr::select(nest_success, nestbox_elev, water_dist, border_dist, feeder_dist, aspect_deg, slope_degr, forest_id) %>% 
  tidyr::pivot_longer(everything()) %>% 
  ggplot(aes(value)) +
  geom_histogram(bins = 30, fill = "steelblue") +
  facet_wrap(~name, scales = "free") +
  theme_minimal()



###Correlation matrix for numeric predictors (reveals redundancy)
num_vars <- nests_efs %>% 
  dplyr::select(nest_success, nestbox_elev, water_dist, border_dist, feeder_dist, aspect_deg, slope_degr, forest_id)

corrplot(cor(num_vars, use = "pairwise.complete.obs"),
         method = "color", type = "upper", tl.col = "black")



###Scatterplots with smoothers (continuous predictors)
ggplot(nests_efs, aes(feeder_dist, nest_success)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = TRUE, color = "red") +
  theme_minimal()





###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
#############################################################################################################################
##########MAIN ANALYSIS ON NEST SUCCESS


###############################################################################################################################################
######HOT SPOT ANALYSIS USING RATIO OF FLEDGLINGS PER NUMBER OF EGGS LAYED


#NOTE: RERUN THIS MODEL AFTER SEPARATING NEST DATA BY 5 YEAR INTERVALS

#------------------------------------------------------------
# 1. Load your nest box data (already processed)
#------------------------------------------------------------
nest_csv <- read.csv("New Zealand/New_Zealand/nestboxes_and_EFs_FINAL.csv")

#convert from csv to shp
nest <- st_as_sf(nest_csv,
                coords = c("POINT_X", "POINT_Y"),                    #(replace lon/lat with your column names)
                crs = 4326)   # WGS84, change if needed

# 3. Write to shapefile
st_write(nest, "New Zealand/New_Zealand/nestboxes_and_EFs_FINAL.shp")


nest <- st_transform(nest, 2193) #NZGD_2000 crs

st_write(nest, "New Zealand/New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000.shp")


#remove NAs from nest_success
nest <- nest[!is.na(nest$nest_success), ]

#------------------------------------------------------------
# 2. Create spatial weights (neighborhood structure)
#------------------------------------------------------------

# OPTION A: Fixed distance band (closest to ArcGIS default)
# Choose an ecologically meaningful distance, e.g., 200 m
dist_threshold <- 100
coords <- st_coordinates(nest)

nb <- dnearneigh(coords, d1 = 0, d2 = dist_threshold)
lw <- nb2listw(nb, style = "B")   # binary weights


#------------------------------------------------------------
# 3. Compute Getis-Ord Gi* statistic
#------------------------------------------------------------

gi <- localG(nest$nest_success, lw)

# Add results back to sf object
nest$GiZScore <- as.numeric(gi)

#------------------------------------------------------------
# 4. Classify hot/cold spots
#------------------------------------------------------------
nest <- nest %>%
  mutate(
    GiCategory = case_when(
      GiZScore >= 2.58 ~ "Hot Spot (99%)",
      GiZScore >= 1.96 ~ "Hot Spot (95%)",
      GiZScore >= 1.65 ~ "Hot Spot (90%)",
      GiZScore <= -2.58 ~ "Cold Spot (99%)",
      GiZScore <= -1.96 ~ "Cold Spot (95%)",
      GiZScore <= -1.65 ~ "Cold Spot (90%)",
      TRUE ~ "Not Significant"
    )
  )

#------------------------------------------------------------
# 5. Map the results
#------------------------------------------------------------
tmap_mode("view")

tm_shape(nest) +
  tm_dots(
    col = "GiCategory",
    palette = c(
      "Hot Spot (99%)" = "red4",
      "Hot Spot (95%)" = "red3",
      "Hot Spot (90%)" = "red1",
      "Not Significant" = "grey80",
      "Cold Spot (90%)" = "blue1",
      "Cold Spot (95%)" = "blue3",
      "Cold Spot (99%)" = "blue4"
    ),
    size = 0.025,
    title = "Overall Nest Success Hotspots"
  ) +
  tm_layout(legend.outside = TRUE)

head(nest)

st_write(nest, "New Zealand/New_Zealand/results/initial_method_results/overall_nest_success_hotspots.shp")






###############################################################################################################################################
######HOT SPOT ANALYSIS USING NUMBER OF FLEDGLINGS


#------------------------------------------------------------
# 2. Create spatial weights (neighborhood structure)
#------------------------------------------------------------

# OPTION A: Fixed distance band (closest to ArcGIS default)
# Choose an ecologically meaningful distance, e.g., 200 m
dist_threshold <- 100
coords <- st_coordinates(nest)

nb <- dnearneigh(coords, d1 = 0, d2 = dist_threshold)
lw <- nb2listw(nb, style = "B")   # binary weights


#------------------------------------------------------------
# 3. Compute Getis-Ord Gi* statistic
#------------------------------------------------------------

gi <- localG(nest$fledglings, lw)

# Add results back to sf object
nest$GiZScore <- as.numeric(gi)

#------------------------------------------------------------
# 4. Classify hot/cold spots
#------------------------------------------------------------
nest <- nest %>%
  mutate(
    GiCategory = case_when(
      GiZScore >= 2.58 ~ "Hot Spot (99%)",
      GiZScore >= 1.96 ~ "Hot Spot (95%)",
      GiZScore >= 1.65 ~ "Hot Spot (90%)",
      GiZScore <= -2.58 ~ "Cold Spot (99%)",
      GiZScore <= -1.96 ~ "Cold Spot (95%)",
      GiZScore <= -1.65 ~ "Cold Spot (90%)",
      TRUE ~ "Not Significant"
    )
  )

#------------------------------------------------------------
# 5. Map the results
#------------------------------------------------------------
tmap_mode("view")

tm_shape(nest) +
  tm_dots(
    col = "GiCategory",
    palette = c(
      "Hot Spot (99%)" = "red4",
      "Hot Spot (95%)" = "red3",
      "Hot Spot (90%)" = "red1",
      "Not Significant" = "grey80",
      "Cold Spot (90%)" = "blue1",
      "Cold Spot (95%)" = "blue3",
      "Cold Spot (99%)" = "blue4"
    ),
    size = 0.025,
    title = "Overall Nest Success Hotspots: by number of fledglings"
  ) +
  tm_layout(legend.outside = TRUE)

head(nest)

st_write(nest, "New Zealand/New_Zealand/results/initial_method_results/overall_nest_success_hotspots_by_fledglings.shp")






#############################################################################################################################################################################
##################################################################################################################################################################
############NEST HOT SPOTS FOR 4 YEAR INTERVALS


#make correct path for libraries
.libPaths()

library(sf)
library(dplyr)
library(spdep)
library(randomForest)
library(tmap)


###############################################
### Load nest data
nest_csv <- read.csv("New_Zealand/nestboxes_and_EFs_FINAL.csv")

nest_csv <- st_as_sf(
  nest_csv,
  coords = c("POINT_X", "POINT_Y"),
  crs = 4326
)

nest_csv <- st_transform(nest_csv, 2193)

# Remove missing success
nest_csv <- nest_csv[!is.na(nest_csv$nest_success), ]

###############################################
### Create forest dummy variables
nest_csv$forest_indigenous <- ifelse(nest_csv$forest_id == 3, 1, 0)
nest_csv$forest_broadleaf  <- ifelse(nest_csv$forest_id == 1, 1, 0)
nest_csv$forest_exotic     <- ifelse(nest_csv$forest_id == 2, 1, 0)

###############################################
### Define 4-year periods (using season_yea)
nest_csv$period <- cut(
  nest_csv$season_yea,
  breaks = c(2004, 2009, 2013, 2017, 2021, 2025),
  labels = c("2005_2009", "2010_2013", "2014_2017", "2018_2021", "2022_2025"),
  right = TRUE,
  include.lowest = TRUE
)

# Remove years outside 2005–2025
nest_csv <- nest_csv %>% filter(!is.na(period))

# Refresh period list
periods <- levels(nest_csv$period)

###############################################
### LOOP THROUGH PERIODS
for (p in periods) {
  
  message("Running hotspot analysis for period: ", p)
  
  # Subset to this period
  dat <- nest_csv %>% filter(period == p)
  
  # Skip if too few points
  if (nrow(dat) < 30) {
    message("Not enough points for period ", p, ", skipping.")
    next
  }
  
  ###############################################
  ### Fit RF model for this period
  rf_model <- randomForest(
    nest_success ~ slope_degr + aspect_deg + water_dist + border_dist +
      ground_elev + feeder_dist +
      forest_indigenous + forest_broadleaf + forest_exotic,
    data = dat,
    ntree = 500,
    importance = TRUE
  )
  
  ###############################################
  ### Predict success at nest-box points
  dat$pred_success <- predict(rf_model, dat)
  
  ###############################################
  ### Build spatial weights (150 m threshold)
  coords <- st_coordinates(dat)
  dist_threshold <- 150
  
  # dnearneigh does NOT accept zero.policy
  nb <- dnearneigh(coords, d1 = 0, d2 = dist_threshold)
  
  # nb2listw DOES accept zero.policy
  lw <- nb2listw(nb, style = "B", zero.policy = TRUE)
  
  # localG also accepts zero.policy
  gi <- localG(dat$pred_success, lw, zero.policy = TRUE)
  
  dat$GiZScore <- as.numeric(gi)
  
  
  ###############################################
  ### Classify hotspots
  dat <- dat %>%
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
  
  ###############################################
  ### Save shapefile for this period
  out_path <- paste0(
    "New_Zealand/results/initial_method_results/hotspots/hotspots_",
    p,
    ".shp"
  )
  
  st_write(dat, out_path, delete_layer = TRUE)
  
  ###############################################
  ### Optional: interactive map
  tmap_mode("view")
  print(
    tm_shape(dat) +
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
        title = paste("Hotspots", p)
      ) +
      tm_layout(legend.outside = TRUE)
  )
}




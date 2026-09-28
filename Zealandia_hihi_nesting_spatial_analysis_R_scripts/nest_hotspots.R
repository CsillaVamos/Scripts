################################################################################################
########################################################################################
#####################NEST HOT SPOTS

# Install glmnet to that folder
install.packages("tmap", lib = "C:/R_temp_library")

# Load the package from that location
library(tmap, lib.loc = "C:/R_temp_library")




nest_csv <- read.csv("New_Zealand/nestboxes_and_EFs_FINAL.csv")

nest_csv <- st_read("New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_3.shp")

#convert from csv to shp
nest_csv <- st_as_sf(nest_csv,
                 coords = c("POINT_X", "POINT_Y"),                    #(replace lon/lat with your column names)
                 crs = 4326)   # WGS84, change if needed


nest_csv <- st_transform(nest_csv, 2193) #NZGD_2000 crs


#remove NAs from nest_success
nest_csv <- nest_csv[!is.na(nest_csv$nst_sc_), ]

#remove empty bird nests
nest_csv <- nest_csv[nest_csv$seasn_y != 0, ]



########################################
###match training data
nest_csv$forest_indigenous <- ifelse(nest_csv$forst_d  == 3, 1, 0)
nest_csv$forest_broadleaf  <- ifelse(nest_csv$forst_d == 1, 1, 0)
nest_csv$forest_exotic      <- ifelse(nest_csv$forst_d == 2, 1, 0)





################################################################################################
#######OVERALL HOT SPOT ANALYSIS

library(randomForest)

### Fit a Random Forest model on nest‑box data

rf_model <- randomForest(
  fldglng ~ slp_dgr + aspct_d + wtr_dst + brdr_ds +
    grnd_lv + fdr_dst +
    forest_indigenous + forest_broadleaf + forest_exotic,
  data = nest_csv,
  ntree = 500,
  importance = TRUE
)


### Predict success at nest‑box points only
nest_csv$pred_success <- predict(rf_model, nest_csv)


###build spatial weights
coords <- st_coordinates(nest_csv)
dist_threshold <- 100

nb <- dnearneigh(coords, d1 = 0, d2 = dist_threshold)
lw <- nb2listw(nb, style = "B")


### Compute Gi\* on the predicted success values
gi <- localG(nest_csv$pred_success, lw)
nest_csv$GiZScore <- as.numeric(gi)


### classify hot/cold spots
nest_csv <- nest_csv %>%
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


### map the results
tmap_mode("view")

tm_shape(nest_csv) +
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
    title = "Environmental Hotspots of Predicted Nest Success"
  ) +
  tm_layout(legend.outside = TRUE)


st_write(nest_csv, "New_Zealand/results/initial_method_results/nest_success_hotspots3.shp")



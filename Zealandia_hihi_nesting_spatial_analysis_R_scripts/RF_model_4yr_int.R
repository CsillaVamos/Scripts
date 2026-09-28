######################################################################################################################################################################
######################################################################################################################################################################
########RANDOM FOREST MODEL 4 yr intervals


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
install.packages("randomForest", lib = "C:/R_temp_library")

# Load the package from that location
library(randomForest, lib.loc = "C:/R_temp_library")

# Install glmnet to that folder
install.packages("spdep", lib = "C:/R_temp_library")

# Load the package from that location
library(spdep, lib.loc = "C:/R_temp_library")

# Install glmnet to that folder
install.packages("rgeoda", lib = "C:/R_temp_library")

# Load the package from that location
library(rgeoda, lib.loc = "C:/R_temp_library")


##############################################################################################################################
###upload bird data and clean

nest_csv <- read.csv("New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_3.csv", sep=";")

site_data <- st_read("New_Zealand/results/knn_hot_spots_SITES/site_data/site_data_no_NAs.shp")

head(site_data)

nest_csv <- site_data

nest_csv <- st_drop_geometry(nest_csv)



# Select predictors
model_data <- nest_csv %>%
  select(fldgl__,
         seasn_y,
         slp_dgr,
         aspct_d,
         wtr_dst,
         brdr_ds,
         grnd_lv,
         fdr_dst,
         frst_br,
         frst_xt,
         frst_nd)



#####################################
### cut model data into 4 year blocks

model_data$period <- cut(
  model_data$seasn_y,
  breaks = c(2004, 2009, 2013, 2017, 2021, 2025),
  labels = c("2005_2009", "2010_2013", "2014_2017", "2018_2021", "2022_2025"),
  right = TRUE
)

model_data$seasn_y <- NULL

#########################################################################################
####### Train a random forest for each period

periods <- levels(model_data$period)

results_4yr <- lapply(periods, function(p) {
  dat <- subset(model_data, period == p)
  
  set.seed(123)
  rf <- randomForest(
    fldgl__ ~ .,
    data = dat[, !(names(dat) %in% c("period", "seasn_y"))],
    ntree = 500,
    importance = TRUE
  )
  
  
  list(
    period = p,
    n = nrow(dat),
    mse = rf$mse[500],
    rsq = rf$rsq[500],
    importance = importance(rf),
    model = rf
  )
})




#################################################
### Compare model performance across periods

# MSE
sapply(results_4yr, function(x) x$mse)
# R2
sapply(results_4yr, function(x) x$rsq)
# sample sizes
sapply(results_4yr, function(x) x$n)
# variable importance
lapply(results_4yr, function(x) x$importance)



###############################################
### summary statistics per period

aggregate(fldgl__ ~ period, data = model_data, summary)

aggregate(fldgl__ ~ period, data = model_data, function(x) c(mean = mean(x), sd = sd(x)))

boxplot(fldgl__ ~ period, data = model_data,
        main = "Success distribution per 4-year period",
        xlab = "Period",
        ylab = "Success")




# Remove NA period rows
plot_data <- subset(model_data, !is.na(period))

ggplot(plot_data, aes(x = fldgl__, fill = period)) +
  geom_density(alpha = 0.4) +
  facet_wrap(~ period) +
  coord_cartesian(ylim = c(0, 0.4)) +
  theme_minimal() +
  labs(
    title = "Success density per 4-year period",
    x = "Success",
    y = "Density"
  ) +
  theme(legend.position = "none")





#####################################################################################################################################################
######################################################################################################################
############### Generating PREDICTED SUCCESS MODELS PER PERIOD



###############################################
### Build predictor stack with correct names

#pred_stack <- c(slope_r2, aspect_r2, water_r2, border_r2, ground_r2, feeder_r2, forest_broadleaved_r2, forest_exotic_r2, forest_indigenous_r2)

#names(pred_stack) <- c( "slp_dgr", "aspct_d", "wtr_dst", "brdr_ds", "grnd_lv", "fdr_dst", "frst_br", "frst_xt", "frst_nd")



results_4yr[[1]]$model   # RF for 2005–2009
results_4yr[[2]]$model   # RF for 2010–2013
results_4yr[[3]]$model   # RF for 2014–2017
results_4yr[[4]]$model   # RF for 2018–2021
results_4yr[[5]]$model   # RF for 2022–2025


periods <- sapply(results_4yr, function(x) x$period)

for (i in seq_along(results_4yr)) {
  
  rf_model_i <- results_4yr[[i]]$model
  period_i   <- results_4yr[[i]]$period
  
  message("Predicting raster for period: ", period_i)
  
  # Predict
  pred_raster <- predict(pred_stack, rf_model_i)
  
  # Plot (optional)
  plot(pred_raster, main = paste("Predicted success:", period_i))
  
  # Save
  out_path <- paste0(
    "New_Zealand/results/RF_model_results_SITES/predictive_success_",
    period_i,
    ".tif"
  )
  
  writeRaster(pred_raster, out_path, overwrite = TRUE)
}


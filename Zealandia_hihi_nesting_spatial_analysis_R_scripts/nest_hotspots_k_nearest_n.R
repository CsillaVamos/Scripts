##########################################################################################################################################################################
#########################################################################################################################################################
##########Hotspot Analysis Using kNN (k = 5)

#make correct path for libraries
.libPaths()

library(sf)
library(dplyr)
library(spdep)
library(randomForest)
library(tmap)
library(devtools)
library(ggplot2)

# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
#install.packages("randomForest", lib = "C:/R_temp_library")

# Load the package from that location
library(randomForest, lib.loc = "C:/R_temp_library")


# Install glmnet to that folder
#install.packages("spdep", lib = "C:/R_temp_library")

# Load the package from that location
library(spdep, lib.loc = "C:/R_temp_library")



###############################################
### Load nest data
#nest_csv <- read.csv("New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_4.csv")
site_data <- st_read("New_Zealand/results/knn_hot_spots_SITES/site_data_no_NAs.shp")

head(site_data)

###correct columns headers
# 1. Remove the first column named "X"
site_data$X <- NULL

# 2. Shift all column names one to the left
names(site_data) <- names(site_data)[c(2:ncol(site_data), 1)]



###############################################
### Define 4-year periods
site_data$period <- cut(
  site_data$seasn_y,
  breaks = c(2004, 2009, 2013, 2017, 2021, 2025),
  labels = c("2005_2009", "2010_2013", "2014_2017", "2018_2021", "2022_2025"),
  right = TRUE,
  include.lowest = TRUE
)

# Keep only valid years
site_data <- site_data %>% filter(!is.na(period))

# Refresh period list
periods <- levels(site_data$period)

head(site_data)




###############################################
### LOOP THROUGH PERIODS
for (p in periods) {
  
  message("Running hotspot analysis for period: ", p)
  
  # Subset to this period
  dat <- site_data %>% filter(period == p)
  
  # Skip if too few points
  if (nrow(dat) < 30) {
    message("Not enough points for period ", p, ", skipping.")
    next
  }
  
  ###############################################
  ### Fit RF model for this period
  rf_model <- randomForest(
    site ~ slp_dgr + aspct_d + wtr_dst + brdr_ds +
      grnd_lv + fdr_dst + frst_nd + frst_br + frst_xt,
    data = dat,
    ntree = 500,
    importance = TRUE
  )
  
  ###############################################
  ### Predict success at site points
  dat$pred_success <- predict(rf_model, dat)
  
  ###############################################
  ### Build spatial weights using kNN (k = 5)
  coords <- st_coordinates(dat)
  
  knn_obj <- knearneigh(coords, k = 5)
  nb <- knn2nb(knn_obj)
  lw <- nb2listw(nb, style = "B")
  
  ###############################################
  ### Compute Gi*
  gi <- localG(dat$pred_success, lw)
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
    "New_Zealand/results/knn_hot_spots_SITES/knn_hotspots_sites/hotspots_k_nn_",
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







#################################################################################################################################################
################comparing hotspot maps across periods


#########################################################################################
### Combine all hotspot shapefiles into one dataset

periods <- c("2005_2009","2010_2013","2014_2017","2018_2021","2022_2025")

hot_list <- lapply(periods, function(p) {
  st_read(paste0("New_Zealand/results/knn_hot_spots_SITES/knn_hotspots_sites/hotspots_k_nn_", p, ".shp")) %>%
    mutate(period = p)
})

hot_all <- do.call(rbind, hot_list)


summary(hot_all)

head(hot_all)

hot_all %>%
  count(period)

nrow(hot_all)

#########################################################################################
### Side‑by‑side hotspot maps

tmap_mode("plot")

tm_facets <- tm_shape(hot_all) +
  tm_dots(
    col = "GiCtgry",
    palette = c(
      "Hot Spot (99%)" = "red4",
      "Hot Spot (95%)" = "red3",
      "Hot Spot (90%)" = "red1",
      "Not Significant" = "grey80",
      "Cold Spot (90%)" = "blue1",
      "Cold Spot (95%)" = "blue3",
      "Cold Spot (99%)" = "blue4"
    ),
    size = 0.03
  ) +
  tm_facets(by = "period", ncol = 3) +
  tm_layout(legend.outside = TRUE)

tm_facets





#########################################################################################
### Hotspot summary statistics per period
hot_all %>%
  st_drop_geometry() %>%
  count(period, GiCtgry)


hot_all_stats <- hot_all %>%
  group_by(period) %>%
  summarise(
    Min      = min(fldgl__, na.rm = TRUE),
    Q1       = quantile(fldgl__, 0.25, na.rm = TRUE),
    Median   = median(fldgl__, na.rm = TRUE),
    Mean     = mean(fldgl__, na.rm = TRUE),
    Q3       = quantile(fldgl__, 0.75, na.rm = TRUE),
    Max      = max(fldgl__, na.rm = TRUE),
    sd       = sd(fldgl__, na.rm = TRUE)
  )


hot_all_stats
hot_all_stats$geometry <- NULL

#####create a box plot

ggplot(hot_all, aes(x = period, y = fldgl__)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(
    title = "Distribution of Fledgling Success per Period",
    x = "Period",
    y = "Fledglings"
  ) +
  theme_minimal(base_size = 14)



ggplot(hot_all, aes(x = fldgl__, fill = period, color = period)) +
  geom_density(alpha = 0.3, adjust = 1.2) +
  labs(
    title = "Distribution of Fledgling Success per Period",
    x = "Fledglings per Site",
    y = "Density"
  ) +
  theme_minimal(base_size = 14)




write.csv(hot_all,"New_Zealand/results/knn_hot_spots_SITES/change_in_hotspots/hotspot_summary_statistics_per_period.csv")

#########################################################################################
### Hotspot persistence analysis

# Convert GiCategory to a binary hotspot indicator
hot_all$hot_bin <- ifelse(grepl("Hot Spot", hot_all$GiCtgry), 1, 0)

# Summarize by nest box
hot_persistence <- hot_all %>%
  group_by(nstb_ID) %>%
  summarise(
    hotspot_count = sum(hot_bin),
    periods_hot = paste(period[hot_bin == 1], collapse = ", ")
  )

#########################################################################################
### Hotspot change detection (gain/loss)
hot_change <- hot_persistence %>%
  mutate(
    status = case_when(
      hotspot_count == 0 ~ "Never hotspot",
      hotspot_count == 1 ~ "Transient hotspot",
      hotspot_count >= 3 ~ "Persistent hotspot",
      TRUE ~ "Occasional hotspot"
    )
  )

tm_shape(hot_change) +
  tm_dots(col = "status", palette = "Dark2", size = 0.04) +
  tm_layout(legend.outside = TRUE)

st_write(hot_change,"New_Zealand/results/knn_hot_spots_SITES/change_in_hotspots/hotspot_change.shp")

#########################################################################################
### Compare hotspot intensity across periods

hot_all %>%
  st_drop_geometry() %>%
  group_by(period) %>%
  summarise(
    mean_Gi = mean(GiZScor, na.rm = TRUE),
    max_Gi  = max(GiZScor, na.rm = TRUE),
    min_Gi  = min(GiZScor, na.rm = TRUE)
  )



#######################################################################################
###creating histograms for Gi* category statistics 

# Create the dataset
df <- tribble(
  ~Period,       ~GiCtgry,           ~n,
  "2005-2009", "Cold Spot (90%)", 2,
  "2005-2009", "Cold Spot (99%)", 6,
  "2005-2009", "Hot Spot (90%)", 2,
  "2005-2009", "Hot Spot (95%)", 23,
  "2005-2009", "Not Significant", 46,
  "2010-2013", "Cold Spot (95%)", 15,
  "2010-2013", "Cold Spot (99%)", 14,
  "2010-2013", "Hot Spot (95%)", 9,
  "2010-2013", "Hot Spot (99%)", 14,
  "2010-2013", "Not Significant", 74,
  "2014-2017", "Cold Spot (90%)", 9,
  "2014-2017", "Cold Spot (95%)", 6,
  "2014-2017", "Cold Spot (99%)", 14,
  "2014-2017", "Hot Spot (90%)", 8,
  "2014-2017", "Hot Spot (95%)", 6,
  "2014-2017", "Hot Spot (99%)", 17,
  "2014-2017", "Not Significant", 118,
  "2018-2021", "Cold Spot (90%)", 11,
  "2018-2021", "Cold Spot (95%)", 7,
  "2018-2021", "Cold Spot (99%)", 10,
  "2018-2021", "Hot Spot (90%)", 2,
  "2018-2021", "Hot Spot (95%)", 7,
  "2018-2021", "Hot Spot (99%)", 11,
  "2018-2021", "Not Significant", 79,
  "2022-2025", "Cold Spot (90%)", 5,
  "2022-2025", "Cold Spot (95%)", 2,
  "2022-2025", "Cold Spot (99%)", 10,
  "2022-2025", "Hot Spot (90%)", 5,
  "2022-2025", "Hot Spot (95%)", 9,
  "2022-2025", "Hot Spot (99%)", 6,
  "2022-2025", "Not Significant", 72
)

### create the palette
gi_palette <- c(
  "Cold Spot (99%)" = "blue4",
  "Cold Spot (95%)" = "blue3",
  "Cold Spot (90%)" = "blue1",
  "Not Significant" = "grey80",
  "Hot Spot (90%)" = "red1",
  "Hot Spot (95%)" = "red3",
  "Hot Spot (99%)" = "red4"
)



# Convert Period to factor for correct ordering
df <- df %>% 
  mutate(Period = factor(Period, levels = unique(Period)))
# make categories appear in the correct order
df$GiCtgry <- factor(df$GiCtgry, levels = names(gi_palette))

# Plot: histogram-like bar charts per Gi* Category
ggplot(df, aes(x = Period, y = n, fill = GiCtgry)) +
  geom_col() +
  facet_wrap(~ GiCtgry, scales = "free_y") +
  scale_fill_manual(values = gi_palette) +
  labs(
    title = "Distribution of Gi* Categories Across Periods",
    x = "Period",
    y = "Count (n)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )


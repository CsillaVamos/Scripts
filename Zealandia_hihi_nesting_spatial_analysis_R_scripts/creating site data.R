##########################################################################################################################################################################
#########################################################################################################################################################
##########Creating the site data from the nest data

#make correct path for libraries
.libPaths("C://Users/vamos003/OneDrive - Universiteit Utrecht/R/win-library/4.1")

library(sf)
library(dplyr)
library(spdep)
library(randomForest)
library(tmap)
library(devtools)

# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("randomForest", lib = "C:/R_temp_library")

# Load the package from that location
library(randomForest, lib.loc = "C:/R_temp_library")



###############################################
### Load nest data shapefile version THIS WILL BE THE SITE LOCATION DATA WITH THE ENVIRONMENTAL VARIABLES

nest_shp <- st_read("New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_4.shp")

head(nest_shp)
nrow(nest_shp)


###############################################
### Create forest dummy variables
nest_shp$forest_indigenous <- ifelse(nest_shp$forst_d == 3, 1, 0)
nest_shp$forest_broadleaf  <- ifelse(nest_shp$forst_d == 1, 1, 0)
nest_shp$forest_exotic     <- ifelse(nest_shp$forst_d == 2, 1, 0)


###find numer of unique values in nestbox id and actual nest id
dplyr::n_distinct(nest_shp$nstb_ID)
dplyr::n_distinct(nest_shp$actl_ns)

##########only keep unique values from nest_shp$actl_ns
nest_shp <- nest_shp %>%
  distinct(actl_ns, .keep_all = TRUE)


head(nest_shp)

###remove columns not related to EFs
nest_shp_2 <- nest_shp[ , !(names(nest_shp) %in% c( "Field1", "season", "seasn_y", "cltch_n", "feml_cm", "cohort",  "band",  "fldglng", "chicks", "eggs",  "FID_", "Descrpt", "Group_", "nst_sc_", "ID_row")) ]

head(nest_shp_2)
nrow(nest_shp_2)


###rename actual nest so it matches woth fledling per site and year data
names(nest_shp_2)[names(nest_shp_2) == 'actl_ns'] <- 'actual_nest'









##########################################################################################################################################################################
#########################################################################################################################################################
##########load nest data csv version THIS WILL BE THE NUMBER OF FLEDGLINGS AT EACH SITE PER YEAR DATA


### Load nest data
nest_csv <- read.csv("New_Zealand/nestboxes_and_EFs_FINAL_NZGD_2000_4.csv")

head(nest_csv)

###correct columns headers
# 1. Remove the first column named "X"
nest_csv$X <- NULL

# 2. Shift all column names one to the left
names(nest_csv) <- names(nest_csv)[c(2:ncol(nest_csv), 1)]


# Remove missing success
nest_csv <- nest_csv[!is.na(nest_csv$nest_success), ]


###find numer of unique values in nestbox id and actual nest id
dplyr::n_distinct(nest_csv$nestbox_ID)
dplyr::n_distinct(nest_csv$actual_nest)

head(nest_csv)

###only keep relevant columns
nest_data <- nest_csv[ , (names(nest_csv) %in% c( "seasn_y", "nestbox_ID", "site", "fledglings", "actual_nest")) ]
head(nest_data)
nrow(nest_data)


######find fledlings per site, per year
fledgs_site_yr <- nest_data %>%
  group_by(actual_nest, seasn_y) %>%
  summarise(
    fledglings_per_site = sum(fledglings, na.rm = TRUE),
    n_nests = n()
  ) %>%
  ungroup()

head(fledgs_site_yr)
nrow(fledgs_site_yr)



####################################################################################################################
###################################################################################################
################################################################################################
########## join geometry and environmental factor data (nest_shp_2) to fledgling per site data (fledgs_site_yr)
#using the datasets 

nrow(fledgs_site_yr)
nrow(nest_shp_2)


##########perform join
fledgs_site_yr_efs_geo <- fledgs_site_yr %>%
  left_join(st_drop_geometry(nest_shp_2), by = "actual_nest")



fledgs_site_yr_efs_geo <- st_drop_geometry(fledgs_site_yr) %>%
  left_join(nest_shp_2, by = "actual_nest") %>%
  st_as_sf()




nrow(fledgs_site_yr_efs_geo)
head(fledgs_site_yr_efs_geo)

class(fledgs_site_yr_efs_geo)


####save data

### save data
st_write(fledgs_site_yr_efs_geo, "New_Zealand/results/knn_hot_spots_SITES/site_data.shp")
write.csv(fledgs_site_yr_efs_geo, "New_Zealand/results/knn_hot_spots_SITES/site_data.csv")

####save data without nas
fledgs_site_yr_efs_geo_2 <- fledgs_site_yr_efs_geo %>%
  filter(seasn_y != 0)

st_write(fledgs_site_yr_efs_geo, "New_Zealand/results/knn_hot_spots_SITES/site_data_no_NAs.shp")
write.csv(fledgs_site_yr_efs_geo, "New_Zealand/results/knn_hot_spots_SITES/site_data_no_NAs.csv")

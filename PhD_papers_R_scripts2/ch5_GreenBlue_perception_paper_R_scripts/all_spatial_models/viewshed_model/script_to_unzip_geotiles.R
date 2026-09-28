################################################################################################################
###############script to unzip geotile files





#set path where zipped files are located
zipped_files_path <- "data_for_viewshed_model/geotiles/geotiles_original/zipped_tiles/"

# Get list of all .zip files in the folder
tif_files_zipped <- list.files(zipped_files_path, pattern = "\\.zip$", full.names = TRUE) 

sapply(tif_files_zipped, unzip, exdir = "")
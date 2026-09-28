
##########################################################################################################################
#############################################################################################################################
###########################################################################################################################
##############VECTOR MODEL

#To be used with all environmental factor data in vector (point) form:

#schools
#road accidents
#hospitals
#food environment



############################################################################################################################
##############################PRIMARY SCHOOLS

library(stars)
library(sp)
library(rgdal)
library(sf)
library(terra)


#points in polygon

setwd()

#####/buffer_calcs_from_R/Buffer_1000m/secondaryschools_buf_1000m/")
setwd("Social_env/schools/alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
primary_schools <- readOGR(".","alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
#secondary_schools <- readOGR("Social_env/schools/secondary_schools_Geocoded/hoofdvestigingen_vo_secondaryschools_Geocoded.shp")



##extract the  essential information to reduce the file size
primary_schools <- primary_schools[,c("Postal","X","Y")]
## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")


#Use for setting coordinates
NDVI2010 <- read_stars("buffer_calcs_from_R/NDVI2010.tif")
NDVI2010 <-rast(NDVI2010)



setwd("buffer_calcs_from_R/Buffer_100m/primaryschools_buf_100m/")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID (this should match the number of rows in BAGdata_2019)
#ID <-1:9202727
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)
##The next codes are for the loop
IDs <- 1 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[1])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(primary_schools))
    v <- st_buffer(sf_BAGdata_2019,dist =100)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(primary_schools)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }







#################################################################################################################
###############secondary schools

#points in polygon

setwd("buffer_calcs_from_R/Buffer_1000m/secondaryschools_buf_1000m")
#setwd("Social_env/schools/secondary_schools_Geocoded")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
secondary_schools <- readOGR(".","hoofdvestigingen_vo_secondaryschools_Geocoded")
#secondary_schools <- readOGR("Social_env/schools/secondary_schools_Geocoded/hoofdvestigingen_vo_secondaryschools_Geocoded.shp")

#primary_schools <- readOGR(".","alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")

##extract the  essential information to reduce the file size
secondary_schools <- secondary_schools[,c("Postal","X","Y")]
## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
#ID <-1:9202727
ID <- 1:9261767
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)
##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(secondary_schools))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(secondary_schools)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



##############################################################################################################
#######################MBO

#points in polygon

setwd("buffer_calcs_from_R/Buffer_1000m/MBO_buf_1000m")
setwd("Social_env/schools/adressen_instellingen_MBO_institutions_Geocoded")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
MBO <- readOGR(".","adressen_instellingen_MBO_institutions_Geocoded")
#secondary_schools <- readOGR("Social_env/schools/secondary_schools_Geocoded/hoofdvestigingen_vo_secondaryschools_Geocoded.shp")



##extract the  essential information to reduce the file size
MBO <- MBO[,c("Postal","X","Y")]
## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
#ID <-1:9202727
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/MBO_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(MBO))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(MBO)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






##############################################################################################################
#######################UNIS and colleges

#points in polygon

setwd("Social_env/schools/instellingen_hbo_en_wo_colleges_and_unis_Geocoded") 
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
unicol <- readOGR(".","instellingen_hbo_en_wo_colleges_and_unis_Geocoded")
#secondary_schools <- readOGR("Social_env/schools/secondary_schools_Geocoded/hoofdvestigingen_vo_secondaryschools_Geocoded.shp")



##extract the  essential information to reduce the file size
unicol <- unicol[,c("Postal","X","Y")]
## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
#ID <-1:9202727
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 1000000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/col_and_uni_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(unicol))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(unicol)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




##################################################################################################################
######################HOSPITALS


#points in polygon

setwd("Social_env/Hospitals/ziekenhuizen_2013") 
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
hospitals<- readOGR(".","ziekenhuizen_2013") 


##extract the  essential information to reduce the file size
hospitals <- hospitals[,c("postcode","POINT_X","POINT_Y")]
## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 1000000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

#set working directory
setwd("buffer_calcs_from_R/Buffer_1000m/hospitals_buf_1000m")


##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(hospitals))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(hospitals)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






################################################################################################################
###########FOOD ENVIRONMENT

####################fastfood

#points in polygon

setwd("All_stores_branches/store_shapefiles/fastfood")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
fastfood <- readOGR(".","fastfood2")
  
##extract the essential information to reduce the file size
fastfood <- fastfood[,c("POSTCODE","XCOORD","YCOORD")]


## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 1000000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/fastfood_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(fastfood))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(fastfood)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





####################social_drinking 
#points in polygon

setwd("All_stores_branches/store_shapefiles/social_drinking_folder")

#Read points data
social_drinking <- readOGR(".","social_drinking")

##extract the essential information to reduce the file size
social_drinking <- social_drinking[,c("POSTCODE","XCOORD","YCOORD")]



## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/social_drinking_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(social_drinking))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(social_drinking)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


####################coffee_and_desserts
#points in polygon

setwd("All_stores_branches/store_shapefiles/coffee_and_desserts_folder")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
coffee_and_desserts <- readOGR(".","coffee_and_desserts")

##extract the essential information to reduce the file size
coffee_and_desserts <- coffee_and_desserts[,c("POSTCODE","XCOORD","YCOORD")]

## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")

####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/coffee_and_desserts_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(coffee_and_desserts))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(coffee_and_desserts)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




####################fruit_vegstore 
#points in polygon

setwd("All_stores_branches/store_shapefiles/fruit_vegstore_folder")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
fruit_vegstore <- readOGR(".","fruit_vegstore")

##extract the essential information to reduce the file size
fruit_vegstore <- fruit_vegstore[,c("POSTCODE","XCOORD","YCOORD")]



## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")
####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/fruit_vegstore_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(fruit_vegstore))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(fruit_vegstore)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }


####################restaurant_bar_pub
#points in polygon

setwd("All_stores_branches/store_shapefiles/restaurant_bar_pub_folder")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
restaurant_bar_pub <- readOGR(".","restaurant_bar_pub")

##extract the essential information to reduce the file size
restaurant_bar_pub <- restaurant_bar_pub[,c("POSTCODE","XCOORD","YCOORD")]



## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")
####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/restaurant_bar_pub_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(restaurant_bar_pub))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(restaurant_bar_pub)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }



####################tobacco_coffeeshop_shishalounge
#points in polygon

setwd("All_stores_branches/store_shapefiles/tobacco_coffeeshop_shishalounge_folder")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
tobacco_coffshop_shisha <- readOGR(".","tobacco_coffeeshop_shishalounge")

##extract the essential information to reduce the file size
tobacco_coffshop_shisha <- tobacco_coffshop_shisha[,c("POSTCODE","XCOORD","YCOORD")]



## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")
####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/tob_cofshp_shisha_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(tobacco_coffshop_shisha))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(tobacco_coffshop_shisha)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }




####################supermarket_and_minisupermarket
#points in polygon

setwd("All_stores_branches/store_shapefiles/supermarket_and_minisupermarket_folder")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
supermarket_minimarket <- readOGR(".","supermarket_and_minisupermarket")

##extract the essential information to reduce the file size
supermarket_minimarket <- supermarket_minimarket[,c("POSTCODE","XCOORD","YCOORD")]



## Read BAG data
BAGdata_2019 <- readr::read_delim("10PERCENT_BAG_Apr2019.csv")
####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
ID <- 1:108962
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)

setwd("buffer_calcs_from_R/Buffer_1000m/superandminimarket_buf_1000m")

##The next codes are for the loop
IDs <- 1:11 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(supermarket_minimarket))
    v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(supermarket_minimarket)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






#####################################################################################################
###################################################################################################
###################################################################################################

########################distance to nearest primary school


#points in polygon

setwd("Social_env/schools/alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")

#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
primary_schools <- readOGR(".","alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")


##extract the  essential information to reduce the file size
primary_schools <- primary_schools[,c("Postal","X","Y")]
## Read BAG data
#BAGdata_2019 <- readr::read_delim("BAG_sept2018.txt")
BAGdata_2019 <- readr::read_delim("BAG_Apr2019.csv")
####extract the  essential information to reduce the file size
BAGdata_2019 <- BAGdata_2019[,c(1,17,18)]
##add a unique ID for each BAGID
#ID <-1:9202727
ID <- 1:9261767
BAGdata_2019 <- cbind(BAGdata_2019,ID)
##Generate a chunck with 100000 BAG
chunk <- 10000
n <- nrow(BAGdata_2019)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(BAGdata_2019,r)


#set wd 
setwd("buffer_calcs_from_R/dist_primaryschooltest") 
##The next codes are for the loop
IDs <- 1:3 ##if you can 9270000 addresses in total, then you would have 927 chunks, and the ID would be 1:927 
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    sf_BAGdata_2019 <- as.data.frame(d[id])
    colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    sf_BAGdata_2019 <-st_transform(sf_BAGdata_2019, st_crs(primary_schools))
    v <- st_distance(sf_BAGdata_2019, primary_schools)
    #v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    v <- st_as_sf(v)
    points_terra <- st_as_sf(primary_schools)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(v,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$ID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = ID) ~ ID, polygons_points, length)
    No_points <- subset(points_count,!(ID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="ID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






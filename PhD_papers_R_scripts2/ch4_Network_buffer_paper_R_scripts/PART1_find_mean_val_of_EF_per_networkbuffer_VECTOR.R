##############################################################################
##########NB POINT DATA MODEL

###find average value of environmental factor per net work buffer

library(stars)
library(sp)
library(rgdal)
library(sf)
library(terra)


nb_1000m <- st_read("/network_buffer_polygons/NB_polygons_1000m.shp")


## Split buffers, each chunck has 10000 buffers
chunk <- 10000
n <- nrow(nb_1000m)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(nb_1000m,r)



######################PRIMARY SCHOOLS

setwd("/Social_env/schools/alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
primary_schools <- readOGR(".","alle_schoolvestigingen_basisonderwijs_primary_schools_Geocoded")
primary_schools <- primary_schools[,c("Postal","X","Y")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/primaryschools_buf_1000m/")

IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    # cores <- detectCores() - 1 
    #cl <- makeCluster(cores, useXDR = F) 
    #registerDoParallel(cl)
    NB_1000m <- d[[id]]
    #colnames(sf_BAGdata_2019) <- c("fid","point_x","point_y","ID")
    #sf_BAGdata_2019 <-st_as_sf(sf_BAGdata_2019,coords=c(2,3))
    #st_crs(sf_BAGdata_2019) <-st_crs(NDVI2010)
    NB_1000m <-st_transform(NB_1000m, st_crs(primary_schools))
    #v <- st_buffer(sf_BAGdata_2019,dist =1000)
    ## create the buffer with distance 100 meter.
    #v <- st_as_sf(v)
    points_terra <- st_as_sf(primary_schools)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    #polygons_without_points <- polygons_points[is.na(polygons_points$X),]## maintain the polygons without points
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    ## calculate the number of points in each polygon.
    #NO_points <-aggregate(cbind(count = ID) ~ ID, polygons_without_points, length)##calculate the number of ploygons without points
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }









############################MBO SCHOOLS

setwd("/Social_env/schools/adressen_instellingen_MBO_institutions_Geocoded")

MBO <- readOGR(".","adressen_instellingen_MBO_institutions_Geocoded")
##etracted the essential information to reduce the file size
MBO <- MBO[,c("Postal","X","Y")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/MBO_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(MBO))
    points_terra <- st_as_sf(MBO)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





############################COLLEGES AND UNIVERSITIES

setwd("/Social_env/schools/instellingen_hbo_en_wo_colleges_and_unis_Geocoded") 

#Read points data
unicol <- readOGR(".","instellingen_hbo_en_wo_colleges_and_unis_Geocoded")

##etracted the essential information to reduce the file size
unicol <- unicol[,c("Postal","X","Y")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/col_and_uni_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(unicol))
    points_terra <- st_as_sf(unicol)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }





###########################HOSPITALS

setwd("/Social_env/Hospitals/ziekenhuizen_2013") 

#Read points data
hospitals<- readOGR(".","ziekenhuizen_2013") 


##etracted the essential information to reduce the file size
hospitals <- hospitals[,c("postcode","POINT_X","POINT_Y")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/hospitals_buf_1000m")

IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(hospitals))
    points_terra <- st_as_sf(hospitals)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






###############################SOCIAL DRINKING
setwd("/All_stores_branches/store_shapefiles/social_drinking_folder")

#Read points data
social_drinking <- readOGR(".","social_drinking")

##extract the essential information to reduce the file size
social_drinking <- social_drinking[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/social_drinking_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(social_drinking))
    points_terra <- st_as_sf(social_drinking)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }









###############################FASTFOOD

setwd("/All_stores_branches/store_shapefiles/fastfood")
#count the number of points in a buffer layer
#secondary_schools_Geocoded
#Read points data
fastfood <- readOGR(".","fastfood2")

##extract the essential information to reduce the file size
fastfood <- fastfood[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/fastfood_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(fastfood))
    points_terra <- st_as_sf(fastfood)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }









###############################COFFEE AND DESSERTS

setwd("/All_stores_branches/store_shapefiles/coffee_and_desserts_folder")

#Read points data
coffee_and_desserts <- readOGR(".","coffee_and_desserts")

##extract the essential information to reduce the file size
coffee_and_desserts <- coffee_and_desserts[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/coffee_and_desserts_buf_1000m")

IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(coffee_and_desserts))
    points_terra <- st_as_sf(coffee_and_desserts)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }







###############################FRUIT AND VEGETABLES
setwd("/All_stores_branches/store_shapefiles/fruit_vegstore_folder")

#Read points data
fruit_vegstore <- readOGR(".","fruit_vegstore")

##extract the essential information to reduce the file size
fruit_vegstore <- fruit_vegstore[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/fruit_vegstore_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(fruit_vegstore))
    points_terra <- st_as_sf(fruit_vegstore)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }







###############################RESTAURANTS BARS AND PUBS

setwd("/All_stores_branches/store_shapefiles/restaurant_bar_pub_folder")

#Read points data
restaurant_bar_pub <- readOGR(".","restaurant_bar_pub")

##extract the essential information to reduce the file size
restaurant_bar_pub <- restaurant_bar_pub[,c("POSTCODE","XCOORD","YCOORD")]


setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/restaurant_bar_pub_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(restaurant_bar_pub))
    points_terra <- st_as_sf(restaurant_bar_pub)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }








###############################TOBACCO COFFEESHOP AND SHISHA LOUNGE

setwd("/All_stores_branches/store_shapefiles/tobacco_coffeeshop_shishalounge_folder")

#Read points data
tobacco_coffshop_shisha <- readOGR(".","tobacco_coffeeshop_shishalounge")

##extract the essential information to reduce the file size
tobacco_coffshop_shisha <- tobacco_coffshop_shisha[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/tob_cofshp_shisha_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(tobacco_coffshop_shisha))
    points_terra <- st_as_sf(tobacco_coffshop_shisha)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }







###############################SUPERMARKET AND MINIMARKET

setwd("/All_stores_branches/store_shapefiles/supermarket_and_minisupermarket_folder")

#Read points data
supermarket_minimarket <- readOGR(".","supermarket_and_minisupermarket")

##extract the essential information to reduce the file size
supermarket_minimarket <- supermarket_minimarket[,c("POSTCODE","XCOORD","YCOORD")]

setwd("/buffer_calcs_from_R/Network_buffers/Buffer_1000m/superandminimarket_buf_1000m")


IDs <- 1:length(d)
idCALCULATION =function (id)
  for (id in IDs) {
    NB_1000m <- d[[id]]
    NB_1000m <-st_transform(NB_1000m, st_crs(supermarket_minimarket))
    points_terra <- st_as_sf(supermarket_minimarket)##transfer the spatialpointdataframe to a sf object.
    polygons_points <- st_join(NB_1000m,points_terra)## detect the point in each polygon
    polygons_with_points <-polygons_points[!is.na(polygons_points$X),]## Maintain the polygons with points
    unique_id <- (polygons_with_points$FacilityID)
    points_count <- aggregate(cbind(count = FacilityID) ~ FacilityID, polygons_points, length)
    No_points <- subset(points_count,!(FacilityID%in%unique_id))
    With_points <- anti_join(points_count,No_points,by="FacilityID")
    No_points$count <-  No_points$count-1## the count of points for polygons without points should be zero
    points_count <- rbind(With_points,No_points)## put all count data of each chunck in one dataframe.
    write.csv(points_count,file = paste(id,".csv",sep=""))## save each chunck into your created folder.
    print(paste("---ID",id,"has been calculated---",sep=""))## Print the calculation process.
  }






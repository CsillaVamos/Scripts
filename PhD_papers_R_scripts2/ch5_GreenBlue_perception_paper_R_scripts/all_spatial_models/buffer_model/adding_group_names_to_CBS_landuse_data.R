###########################################################################
##########ADDING GROUP NAMES TO LANDUSE DATA


#####upload data
landuse_shapefile <- readOGR(dsn = "CBS_Publicatiebestand_BBG2017_v1_SHP/CBS_Publicatiebestand_BBG2017_v1.shp", layer = "CBS_Publicatiebestand_BBG2017_v1")

landuse <- landuse_shapefile


#####add and fill in main group column
landuse$maingroup <- landuse$BG2017
landuse$maingroup[landuse$maingroup == 10] <- "traffic area"
landuse$maingroup[landuse$maingroup == 11] <- "traffic area"
landuse$maingroup[landuse$maingroup == 12] <- "traffic area"
landuse$maingroup[landuse$maingroup == 20] <- "built-up area"
landuse$maingroup[landuse$maingroup == 21] <- "built-up area"
landuse$maingroup[landuse$maingroup == 22] <- "built-up area"
landuse$maingroup[landuse$maingroup == 23] <- "built-up area"
landuse$maingroup[landuse$maingroup == 24] <- "built-up area"
landuse$maingroup[landuse$maingroup == 30] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 31] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 32] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 33] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 34] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 35] <- "semi built-up area"
landuse$maingroup[landuse$maingroup == 40] <- "recreation area"
landuse$maingroup[landuse$maingroup == 41] <- "recreation area"
landuse$maingroup[landuse$maingroup == 42] <- "recreation area"
landuse$maingroup[landuse$maingroup == 43] <- "recreation area"
landuse$maingroup[landuse$maingroup == 44] <- "recreation area"
landuse$maingroup[landuse$maingroup == 50] <- "agricultural land"
landuse$maingroup[landuse$maingroup == 51] <- "agricultural land"
landuse$maingroup[landuse$maingroup == 60] <- "forest and open natural terrain"
landuse$maingroup[landuse$maingroup == 61] <- "forest and open natural terrain"
landuse$maingroup[landuse$maingroup == 62] <- "forest and open natural terrain"

landuse$maingroup[landuse$maingroup == 70] <- "inland water"
landuse$maingroup[landuse$maingroup == 71] <- "inland water"
landuse$maingroup[landuse$maingroup == 72] <- "inland water"
landuse$maingroup[landuse$maingroup == 73] <- "inland water"
landuse$maingroup[landuse$maingroup == 74] <- "inland water"
landuse$maingroup[landuse$maingroup == 75] <- "inland water"
landuse$maingroup[landuse$maingroup == 76] <- "inland water"
landuse$maingroup[landuse$maingroup == 77] <- "inland water"
landuse$maingroup[landuse$maingroup == 78] <- "inland water"

landuse$maingroup[landuse$maingroup == 80] <- "open water"
landuse$maingroup[landuse$maingroup == 81] <- "open water"
landuse$maingroup[landuse$maingroup == 82] <- "open water"
landuse$maingroup[landuse$maingroup == 83] <- "open water"

landuse$maingroup[landuse$maingroup == 90] <- "abroad"

head(landuse)


#####add and fill in category column
landuse$category <- landuse$BG2017
landuse$category[landuse$category == 10] <- "railway"
landuse$category[landuse$category == 11] <- "main road"
landuse$category[landuse$category == 12] <- "airport"
landuse$category[landuse$category == 20] <- "residential area"
landuse$category[landuse$category == 21] <- "retail and catering"
landuse$category[landuse$category == 22] <- "public facility"
landuse$category[landuse$category == 23] <- "socio-cultural provision"
landuse$category[landuse$category == 24] <- "business park"
landuse$category[landuse$category == 30] <- "landfill"
landuse$category[landuse$category == 31] <- "wreck storage facility"
landuse$category[landuse$category == 32] <- "cemetery"
landuse$category[landuse$category == 33] <- "mineral extraction site"
landuse$category[landuse$category == 34] <- "construction site"
landuse$category[landuse$category == 35] <- "semi-paved other terrain"
landuse$category[landuse$category == 40] <- "park and public garden"
landuse$category[landuse$category == 41] <- "sports area"
landuse$category[landuse$category == 42] <- "allotment garden"
landuse$category[landuse$category == 43] <- "day recreational area"
landuse$category[landuse$category == 44] <- "agricultural land"
landuse$category[landuse$category == 50] <- "green house horticulture"
landuse$category[landuse$category == 51] <- "other agricultural land"
landuse$category[landuse$category == 60] <- "forest"
landuse$category[landuse$category == 61] <- "open dry natural terrain"
landuse$category[landuse$category == 62] <- "open wet natural terrain"

landuse$category[landuse$category == 70] <- "Ijsselmeer & Markermeer"
landuse$category[landuse$category == 71] <- "closed estuary"
landuse$category[landuse$category == 72] <- "Rhine and Meuse"
landuse$category[landuse$category == 73] <- "Randmeer"
landuse$category[landuse$category == 74] <- "savings basin"
landuse$category[landuse$category == 75] <- "recreational inland water"
landuse$category[landuse$category == 76] <- "inland water for mineral extraction"
landuse$category[landuse$category == 77] <- "flow and/or sludge field"
landuse$category[landuse$category == 78] <- "other inland water"

landuse$category[landuse$category == 80] <- "Wadden Sea, Eems, & Dollard"
landuse$category[landuse$category == 81] <- "Oosterschelde"
landuse$category[landuse$category == 82] <- "Western Scheldt"
landuse$category[landuse$category == 83] <- "North Sea"

landuse$category[landuse$category == 90] <- "abroad"

head(landuse, 50)



####create another column identifying the categories as green space, blue space, or other

landuse$Type_of_space <- landuse$category

landuse$Type_of_space[landuse$Type_of_space == "railway"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "main road"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "airport"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "residential area"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "retail and catering"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "public facility"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "socio-cultural provision"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "business park"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "landfill"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "wreck storage facility"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "cemetery"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "mineral extraction site"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "construction site"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "semi-paved other terrain"] <- "other"
landuse$Type_of_space[landuse$Type_of_space == "park and public garden"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "sports area"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "allotment garden"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "day recreational area"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "agricultural land"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "green house horticulture"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "other agricultural land"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "forest"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "open dry natural terrain"] <- "green"
landuse$Type_of_space[landuse$Type_of_space == "open wet natural terrain"] <- "green"

landuse$Type_of_space[landuse$Type_of_space == "Ijsselmeer & Markermeer"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "closed estuary"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "Rhine and Meuse"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "Randmeer"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "savings basin"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "recreational inland water"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "inland water for mineral extraction"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "flow and/or sludge field"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "other inland water"] <- "blue"

landuse$Type_of_space[landuse$Type_of_space == "Wadden Sea, Eems, & Dollard"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "Oosterschelde"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "Western Scheldt"] <- "blue"
landuse$Type_of_space[landuse$Type_of_space == "North Sea"] <- "blue"

landuse$Type_of_space[landuse$Type_of_space == "abroad"] <- "other"

head(landuse)

# save as a shapefile
writeOGR(obj= landuse, dsn = "Data/BBG2017_v1_SHP/CBS_Publicatiebestand_BBG2017_v1_SHP/CBS_landuse_data_2017.shp", layer = "CBS_landuse_data_2017", driver = "ESRI Shapefile")


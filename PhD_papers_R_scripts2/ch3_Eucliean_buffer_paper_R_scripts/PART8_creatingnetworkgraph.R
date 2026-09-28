###############
###selection of pc values higher/less than +/- 0.7



# 1 # Heatmaps ####
library(huge)
library(igraph)
library(ggplot2)
library(MASS) 
library(reshape2) 
library(reshape)
library(circlize)
library(itsadug)

# 3 a # First a network for a single dataset ####
library(igraph)
library(huge)

############################################################################################
############################################################################################
###########################################################################################
###for 100 m Pearson correlations

#upload data 
data100m <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_100m.csv")

#omit rows where var1 == var2
data100m <- data100m %>% filter(Var1 != Var2)

#subset all rows where > 0.7
higherthan0.7_100m <- subset(data100m, value >= 0.7)
uniquevar1valuespos <- unique(higherthan0.7_100m$Var1)
uniquevar2valuespos <- unique(higherthan0.7_100m$Var2)

#subset all rows where > 0.7
lessthanneg0.7_100m <- subset(data100m, value <= -0.7)
uniquevar1valuesneg <- unique(lessthanneg0.7_100m$Var1)
uniquevar2valuesneg <- unique(lessthanneg0.7_100m$Var2)

#save data
write.csv(higherthan0.7_100m,"model_versions/networkbuffer_results/pc_values/morethan_0.7/buf100m_morethan_0.7.csv")


write.csv(lessthanneg0.7_100m,"model_versions/networkbuffer_results/pc_values/lessthan_neg0.7/buf100m_lessthan_neg_0.7.csv")


##go back to origional data and pick out relevant variables
buffer100mvalues <- read.csv("model_versions/buf100m_103690_addrss_5.csv")


setwd("model_versions/final_eu_analysis/networkgraphsnew/")


############################################################################################
###########################################################################################
######buffer100mvaluepos0.7
buffer100mvaluepos0.7 <- dplyr::select(buffer100mvalues, "NO2", "PM2.5", "BC", "pm25_cu_slr", "pm25_ni_slr", "pm25_v_slr", "pm25_si_slr", "pm25_ni_slr", "pm25_zn_slr", "pmc_fe_slr", "pm25_mass_slr", "temp_may_2019", "temp_feb_2019", "AllSound", "UHI", "MSAVI_ME300", "AvIncmPIncRec", "urbanity", "NsnceIncrty", "popdensity", "T_dest_vio", "property_crm", "pmc_si_slr", "pmc_k_slr", "pmc_cu_slr", "temp_aug_2019", "temp_nov_2019", "TrafficNoise", "NightLightExpanse", "NDVI_ME300", "Imp300m", "HghstIncmPcnt", "SoCoh", "Facilities", "property_crm", "T_theft")

X <- as.matrix(buffer100mvaluepos0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
# The lambda min ratio = 0.1 is the default

glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'

refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)


jpeg("buffer100m_pos0.7value.jpg")
com <- cluster_walktrap(AdjGraph) #performs random walks through the graph to identify communities. Note that there are several community clustering algorithms available. Other good option: cluster_edgebetweenness
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=0.6, vertex.label.color="black", mark.border="white", vertex.label.cex=0.5, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer100m_pos0.7value",vertex.label.font=0.05)
dev.off()


############################################################################################
###########################################################################################
########buffer100mvalueRELEVANTneg0.7
buffer100mvalueRELEVANTneg0.7 <- dplyr::select(buffer100mvalues, "NO2","PM2.5","Ozone","UHI","BC","temp_feb_2019","NightLightExpanse","MSAVI_ME300","NDVI_ME300","EduLow","AvIncmPIncRec","LowestIncmPcnt","SS83","popdensity","urbanity","NsnceIncrty","SoCoh","Ozone"         ,"pm25_cu_slr","pm25_fe_slr","MSAVI_ME300","NDVI_ME300","urbanity","Imp300m","EduHigh","LowestIncmPcnt" ,"HghstIncmPcnt" , "NsnceIncrty"    ,"SoCoh","Facilities")


X <- as.matrix(buffer100mvalueRELEVANTneg0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer100m_neg0.7value.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer100m_neg0.7value",vertex.label.font=2)
dev.off()

###########################################################################################
############################################################################################
###########################################################################################
###for 250 m Pearson correlations

#upload data 
data250m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_250m.csv")

#omit rows where var1 == var2
data250m <- data250m %>% filter(Var1 != Var2)

#subset all rows where > 0.7
higherthan0.7 <- subset(data250m, value >= 0.7)
uniquevar1values <- unique(higherthan0.7$Var1)
uniquevar2values <- unique(higherthan0.7$Var2)

#subset all rows where > 0.7
lessthanneg0.7 <- subset(data250m, value <= -0.7)
uniquevar1values <- unique(lessthanneg0.7$Var1)
uniquevar2values <- unique(lessthanneg0.7$Var2)

#save data
write.csv(higherthan0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf250m_morethan_0.7.csv")

write.csv(lessthanneg0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf250m_lessthan_neg_0.7.csv")


##go back to origional data and pick out relevant variables
buffer250mvalues <- read.csv("model_versions/buf250m_105331_addrss_5.csv")


setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer250m_pos0.7 <- dplyr::select(buffer250mvalues, "NO2","PM2.5","pm25_cu_slr","pm25_fe_slr","pm25_k_slr", "pm25_s_slr" ,   "pm25_ni_slr", "pm25_v_slr" ,"pm25_si_slr", "pm25_zn_slr","pmc_si_slr", "pmc_fe_slr","pmc_cu_slr", "BC" , "temp_may_2019" ,"temp_feb_2019","AllSound" ,"UHI","MSAVI_ME300","main_railroad", "AvIncmPIncRec" ,"urbanity","NsnceIncrty","popdensity" ,"EduHigh" , "T_dest_vio",    "property_crm" , "MBO", "PM2.5","BC", "pm25_fe_slr",  "pm25_k_slr" , "pm25_s_slr","pm25_si_slr" , "pm25_v_slr" ,"pm25_zn_slr", "pmc_si_slr","pmc_k_slr" ,"pmc_fe_slr" ,"pmc_cu_slr" ,"pm25_mass_slr","temp_feb_2019", "temp_may_2019", "temp_aug_2019","temp_nov_2019" ,"TrafficNoise" ,"UHI" ,"NightLightExpanse" ,"NDVI_ME300", "popdensity","Imp300m","railroad_lightrail_tram", "HghstIncmPcnt" ,"NsnceIncrty" ,"SoCoh","Facilities","property_crm" ,"T_theft" ,"col_and_uni")



X <- as.matrix(buffer250m_pos0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer250m_pos0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer250m_pos0.7",vertex.label.font=2)
dev.off()


############################################################################################
###########################################################################################
buffer250m_neg0.7 <- dplyr::select(buffer250mvalues, "NO2", "PM2.5", "Ozone","UHI" , "temp_may_2019" , "BC", "temp_feb_2019" ,    "NightLightExpanse", "urbanity" , "MSAVI_ME300", "NDVI_ME300", "EduLow" , "AvIncmPIncRec" , "LowestIncmPcnt", "SS83","popdensity","NsnceIncrty" ,"SoCoh","Ozone","BC" ,"MSAVI_ME300","NDVI_ME300","urbanity","popdensity", "Imp300m", "EduHigh" ,"LowestIncmPcnt", "HghstIncmPcnt",  "NsnceIncrty" ,"SoCoh","Facilities")


X <- as.matrix(buffer250m_neg0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer250m_neg0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer250m_neg0.7",vertex.label.font=2)
dev.off()





############################################################################################
###########################################################################################
########################################################################################
###for 500 m Pearson correlations

#upload data 
data500m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_500m.csv")

#omit rows where var1 == var2
data500m <- data500m %>% filter(Var1 != Var2)

#subset all rows where > 0.7
higherthan0.7 <- subset(data500m, value >= 0.7)
uniquevar1values <- unique(higherthan0.7$Var1)
uniquevar2values <- unique(higherthan0.7$Var2)

#subset all rows where > 0.7
lessthanneg0.7 <- subset(data500m, value <= -0.7)
uniquevar1values <- unique(lessthanneg0.7$Var1)
uniquevar2values <- unique(lessthanneg0.7$Var2)

#save data
write.csv(higherthan0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf500m_morethan_0.7.csv")

write.csv(lessthanneg0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf500m_lessthan_neg_0.7.csv")


##go back to origional data and pick out relevant variables
buffer500mvalues <- read.csv("model_versions/buf500m_105001_addrss_5.csv")

setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer500mpos0.7 <- dplyr::select(buffer500mvalues,"NO2","PM2.5","pm25_cu_slr","pm25_fe_slr", "pm25_k_slr","pm25_s_slr" ,   "pm25_ni_slr", "pm25_v_slr", "pm25_si_slr","pm25_zn_slr","pmc_si_slr" , "pmc_fe_slr", "pmc_cu_slr","BC","temp_may_2019" ,"temp_feb_2019",
 "AllSound", "UHI" ,"MSAVI_ME300","main_railroad", "AvIncmPIncRec", "urbanity" ,"NsnceIncrty","popdensity","EduHigh","T_dest_vio","property_crm","MBO","PM2.5","BC", "pm25_fe_slr","pm25_k_slr","pm25_s_slr","pm25_si_slr","pm25_v_slr","pm25_zn_slr","pmc_si_slr",              "pmc_k_slr" , "pmc_fe_slr", "pmc_cu_slr","pm25_mass_slr","temp_feb_2019","temp_may_2019", "temp_aug_2019" , "temp_nov_2019" ,          "TrafficNoise","UHI","NightLightExpanse", "NDVI_ME300", "popdensity","Imp300m" , "railroad_lightrail_tram", "HghstIncmPcnt","NsnceIncrty"   ,"SoCoh" ,"Facilities", "property_crm" ,"T_theft" , "col_and_uni")

X <- as.matrix(buffer500mpos0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer500mpos0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer500mpos0.7",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
buffer500mneg0.7 <- dplyr::select(buffer500mvalues, "NO2","PM2.5","Ozone","temp_may_2019" ,"UHI","BC","temp_feb_2019" ,    "NightLightExpanse", "urbanity" ,"grassland" ,"MSAVI_ME300", "NDVI_ME300" , "EduLow", "EduSec","AvIncmPIncRec", "LowestIncmPcnt",    "popdensity","SS83", "NsnceIncrty","SoCoh","Ozone", "BC" ,"MSAVI_ME300" ,"NDVI_ME300","urbanity","popdensity", "Imp300m","EduHigh","LowestIncmPcnt", "HghstIncmPcnt" , "NsnceIncrty","SoCoh","Facilities")

X <- as.matrix(buffer500mneg0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer500mneg0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer500mneg0.7",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
########################################################################################
###for 1000 m Pearson correlations

#upload data 
data1000m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_1000m.csv")

#omit rows where var1 == var2
data1000m <- data1000m %>% filter(Var1 != Var2)

#subset all rows where > 0.7
higherthan0.7 <- subset(data1000m, value >= 0.7)
uniquevar1values <- unique(higherthan0.7$Var1)
uniquevar2values <- unique(higherthan0.7$Var2)

#subset all rows where > 0.7
lessthanneg0.7 <- subset(data1000m, value <= -0.7)
uniquevar1values <- unique(lessthanneg0.7$Var1)
uniquevar2values <- unique(lessthanneg0.7$Var2)

#save data
write.csv(higherthan0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf1000m_morethan_0.7.csv")

write.csv(lessthanneg0.7,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf1000m_lessthan_neg_0.7.csv")


##go back to origional data and pick out relevant variables
buffer1000mvalues <- read.csv("model_versions/buf1000m_106404_addrss_5.csv")

setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer1000m_pos0.7 <- dplyr::select(buffer1000mvalues,"NO2","PM2.5","pm25_cu_slr", "pm25_fe_slr","pm25_k_slr","pm25_s_slr",              "pm25_ni_slr","pm25_v_slr", "pm25_si_slr","pm25_zn_slr","pmc_si_slr", "pmc_fe_slr", "pmc_cu_slr","BC","temp_feb_2019","temp_may_2019"    ,"AllSound" ,"TrafficNoise", "UHI", "np_ind_crops", "fodder","cereals","grassland", "MSAVI_ME300","NDVI_ME300", "NightLightExpanse",       "popdensity","AvIncmPIncRec","urbanity","NsnceIncrty", "UFP","Imp300m", "railroad_lightrail_tram", "EduHigh","T_dest_vio","property_crm",  "PM2.5", "BC","pm25_fe_slr","pm25_k_slr", "pm25_s_slr" ,"pm25_si_slr","pm25_v_slr", "pm25_zn_slr", "pmc_si_slr","pmc_k_slr","pmc_fe_slr"    , "pmc_cu_slr","pm25_mass_slr" , "temp_feb_2019" , "temp_may_2019","temp_aug_2019","temp_nov_2019","AllSound","TrafficNoise","UHI" ,"NightLightExpanse","flowerbulbs" ,"grains" ,"MSAVI_ME300" , "NDVI_ME300" , "urbanity", "popdensity","Imp300m","major_roads",             "railroad_lightrail_tram","HghstIncmPcnt" , "NsnceIncrty", "SoCoh" , "Facilities", "property_crm", "T_theft")

X <- as.matrix(buffer1000m_pos0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer1000m_pos0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer1000m_pos0.7",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
buffer1000mneg0.7 <- dplyr::select(buffer1000mvalues,"NO2", "PM2.5","Ozone", "temp_may_2019", "UHI", "BC" ,"temp_feb_2019" ,    "NightLightExpanse", "urbanity","grassland", "MSAVI_ME300" , "NDVI_ME300", "EduLow" , "EduSec", "AvIncmPIncRec" , "LowestIncmPcnt",    "popdensity","Imp300m", "SS83","NsnceIncrty","SoCoh" ,"Ozone", "BC", "TrafficNoise", "grassland", "MSAVI_ME300" ,"NDVI_ME300", "urbanity","popdensity" ,"Imp300m", "major_roads","EduHigh", "LowestIncmPcnt", "HghstIncmPcnt",  "NsnceIncrty" , "SoCoh", "Facilities")

X <- as.matrix(buffer250m_neg0.7) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer1000mneg0.7.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer1000mneg0.7",vertex.label.font=2)
dev.off()




############################################################################################33
#############################################################################################
###############################################################################################

###############
###selection of pc values higher/less than +/- 0.9


############################################################################################
############################################################################################
###########################################################################################
###for 100 m Pearson correlations

#upload data 
data100m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_100m.csv")

#omit rows where var1 == var2
data100m <- data100m %>% filter(Var1 != Var2)

#subset all rows where > 0.9
higherthan0.9 <- subset(data100m, value >= 0.9)
uniquevar1valuespos <- unique(higherthan0.9$Var1)
uniquevar2valuespos <- unique(higherthan0.9$Var2)

#subset all rows where > 0.9
lessthanneg0.9 <- subset(data100m, value <= -0.9)
uniquevar1valuesneg <- unique(lessthanneg0.9$Var1)
uniquevar2valuesneg <- unique(lessthanneg0.9$Var2)

#save data
write.csv(higherthan0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf100m_morethan_0.9.csv")

write.csv(lessthanneg0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf100m_lessthan_neg_0.9.csv")


##go back to origional data and pick out relevant variables
buffer100mvalues <- read.csv("model_versions/buf100m_103690_addrss_5.csv")


setwd("model_versions/final_eu_analysis/networkgraphsnew/")


############################################################################################
###########################################################################################
######buffer100mvaluepos0.9
buffer100mvaluepos0.9 <- dplyr::select(buffer100mvalues, "NO2", "PM2.5", "BC", "pm25_cu_slr", "pm25_ni_slr", "pm25_v_slr", "pm25_si_slr", "pm25_ni_slr", "pm25_zn_slr", "pmc_fe_slr", "pm25_mass_slr", "temp_may_2019", "temp_feb_2019", "AllSound", "UHI", "MSAVI_ME300", "AvIncmPIncRec", "urbanity", "NsnceIncrty", "popdensity", "T_dest_vio", "property_crm", "pmc_si_slr", "pmc_k_slr", "pmc_cu_slr", "temp_aug_2019", "temp_nov_2019", "TrafficNoise", "NightLightExpanse", "NDVI_ME300", "Imp300m", "HghstIncmPcnt", "SoCoh", "Facilities", "property_crm", "T_theft")

X <- as.matrix(buffer100mvaluepos0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
# The lambda min ratio = 0.1 is the default

glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'

refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)


jpeg("buffer100m_pos0.9value.jpg")
com <- cluster_walktrap(AdjGraph) #performs random walks through the graph to identify communities. Note that there are several community clustering algorithms available. Other good option: cluster_edgebetweenness
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer100m_pos0.9value",vertex.label.font=2)
dev.off()


############################################################################################
###########################################################################################
########buffer100mvalueRELEVANTneg0.9
buffer100mvalueRELEVANTneg0.9 <- dplyr::select(buffer100mvalues, "NO2","PM2.5","Ozone","UHI","BC","temp_feb_2019","NightLightExpanse","MSAVI_ME300","NDVI_ME300","EduLow","AvIncmPIncRec","LowestIncmPcnt","SS83","popdensity","urbanity","NsnceIncrty","SoCoh","Ozone"         ,"pm25_cu_slr","pm25_fe_slr","MSAVI_ME300","NDVI_ME300","urbanity","Imp300m","EduHigh","LowestIncmPcnt" ,"HghstIncmPcnt" , "NsnceIncrty"    ,"SoCoh","Facilities")


X <- as.matrix(buffer100mvalueRELEVANTneg0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer100m_neg0.9value.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer100m_neg0.9value",vertex.label.font=2)
dev.off()

###########################################################################################
############################################################################################
###########################################################################################
###for 250 m Pearson correlations

#upload data 
data250m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_250m.csv")

#omit rows where var1 == var2
data250m <- data250m %>% filter(Var1 != Var2)

#subset all rows where > 0.9
higherthan0.9 <- subset(data250m, value >= 0.9)
uniquevar1values <- unique(higherthan0.9$Var1)
uniquevar2values <- unique(higherthan0.9$Var2)

#subset all rows where > 0.9
lessthanneg0.9 <- subset(data250m, value <= -0.9)
uniquevar1values <- unique(lessthanneg0.9$Var1)
uniquevar2values <- unique(lessthanneg0.9$Var2)

#save data
write.csv(higherthan0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf250m_morethan_0.9.csv")

write.csv(lessthanneg0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf250m_lessthan_neg_0.9.csv")


##go back to origional data and pick out relevant variables
buffer250mvalues <- read.csv("model_versions/buf250m_105331_addrss_5.csv")


setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer250m_pos0.9 <- dplyr::select(buffer250mvalues, "NO2","PM2.5","pm25_cu_slr","pm25_fe_slr","pm25_k_slr", "pm25_s_slr" ,   "pm25_ni_slr", "pm25_v_slr" ,"pm25_si_slr", "pm25_zn_slr","pmc_si_slr", "pmc_fe_slr","pmc_cu_slr", "BC" , "temp_may_2019" ,"temp_feb_2019","AllSound" ,"UHI","MSAVI_ME300","main_railroad", "AvIncmPIncRec" ,"urbanity","NsnceIncrty","popdensity" ,"EduHigh" , "T_dest_vio",    "property_crm" , "MBO", "PM2.5","BC", "pm25_fe_slr",  "pm25_k_slr" , "pm25_s_slr","pm25_si_slr" , "pm25_v_slr" ,"pm25_zn_slr", "pmc_si_slr","pmc_k_slr" ,"pmc_fe_slr" ,"pmc_cu_slr" ,"pm25_mass_slr","temp_feb_2019", "temp_may_2019", "temp_aug_2019","temp_nov_2019" ,"TrafficNoise" ,"UHI" ,"NightLightExpanse" ,"NDVI_ME300", "popdensity","Imp300m","railroad_lightrail_tram", "HghstIncmPcnt" ,"NsnceIncrty" ,"SoCoh","Facilities","property_crm" ,"T_theft" ,"col_and_uni")



X <- as.matrix(buffer250m_pos0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer250m_pos0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer250m_pos0.9",vertex.label.font=2)
dev.off()


############################################################################################
###########################################################################################
buffer250m_neg0.9 <- dplyr::select(buffer250mvalues, "NO2", "PM2.5", "Ozone","UHI" , "temp_may_2019" , "BC", "temp_feb_2019" ,    "NightLightExpanse", "urbanity" , "MSAVI_ME300", "NDVI_ME300", "EduLow" , "AvIncmPIncRec" , "LowestIncmPcnt", "SS83","popdensity","NsnceIncrty" ,"SoCoh","Ozone","BC" ,"MSAVI_ME300","NDVI_ME300","urbanity","popdensity", "Imp300m", "EduHigh" ,"LowestIncmPcnt", "HghstIncmPcnt",  "NsnceIncrty" ,"SoCoh","Facilities")


X <- as.matrix(buffer250m_neg0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer250m_neg0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer250m_neg0.9",vertex.label.font=2)
dev.off()





############################################################################################
###########################################################################################
########################################################################################
###for 500 m Pearson correlations

#upload data 
data500m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_500m.csv")

#omit rows where var1 == var2
data500m <- data500m %>% filter(Var1 != Var2)

#subset all rows where > 0.9
higherthan0.9 <- subset(data500m, value >= 0.9)
uniquevar1values <- unique(higherthan0.9$Var1)
uniquevar2values <- unique(higherthan0.9$Var2)

#subset all rows where > 0.9
lessthanneg0.9 <- subset(data500m, value <= -0.9)
uniquevar1values <- unique(lessthanneg0.9$Var1)
uniquevar2values <- unique(lessthanneg0.9$Var2)

#save data
write.csv(higherthan0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf500m_morethan_0.9.csv")

write.csv(lessthanneg0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf500m_lessthan_neg_0.9.csv")


##go back to origional data and pick out relevant variables
buffer500mvalues <- read.csv("model_versions/buf500m_105001_addrss_5.csv")

setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer500mpos0.9 <- dplyr::select(buffer500mvalues,"NO2","PM2.5","pm25_cu_slr","pm25_fe_slr", "pm25_k_slr","pm25_s_slr" ,   "pm25_ni_slr", "pm25_v_slr", "pm25_si_slr","pm25_zn_slr","pmc_si_slr" , "pmc_fe_slr", "pmc_cu_slr","BC","temp_may_2019" ,"temp_feb_2019",
                                  "AllSound", "UHI" ,"MSAVI_ME300","main_railroad", "AvIncmPIncRec", "urbanity" ,"NsnceIncrty","popdensity","EduHigh","T_dest_vio","property_crm","MBO","PM2.5","BC", "pm25_fe_slr","pm25_k_slr","pm25_s_slr","pm25_si_slr","pm25_v_slr","pm25_zn_slr","pmc_si_slr",              "pmc_k_slr" , "pmc_fe_slr", "pmc_cu_slr","pm25_mass_slr","temp_feb_2019","temp_may_2019", "temp_aug_2019" , "temp_nov_2019" ,          "TrafficNoise","UHI","NightLightExpanse", "NDVI_ME300", "popdensity","Imp300m" , "railroad_lightrail_tram", "HghstIncmPcnt","NsnceIncrty"   ,"SoCoh" ,"Facilities", "property_crm" ,"T_theft" , "col_and_uni")

X <- as.matrix(buffer500mpos0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer500mpos0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer500mpos0.9",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
buffer500mneg0.9 <- dplyr::select(buffer500mvalues, "NO2","PM2.5","Ozone","temp_may_2019" ,"UHI","BC","temp_feb_2019" ,    "NightLightExpanse", "urbanity" ,"grassland" ,"MSAVI_ME300", "NDVI_ME300" , "EduLow", "EduSec","AvIncmPIncRec", "LowestIncmPcnt",    "popdensity","SS83", "NsnceIncrty","SoCoh","Ozone", "BC" ,"MSAVI_ME300" ,"NDVI_ME300","urbanity","popdensity", "Imp300m","EduHigh","LowestIncmPcnt", "HghstIncmPcnt" , "NsnceIncrty","SoCoh","Facilities")

X <- as.matrix(buffer500mneg0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer500mneg0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer500mneg0.9",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
########################################################################################
###for 1000 m Pearson correlations

#upload data 
data1000m <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_1000m.csv")

#omit rows where var1 == var2
data1000m <- data1000m %>% filter(Var1 != Var2)

#subset all rows where > 0.9
higherthan0.9 <- subset(data1000m, value >= 0.9)
uniquevar1values <- unique(higherthan0.9$Var1)
uniquevar2values <- unique(higherthan0.9$Var2)

#subset all rows where > 0.9
lessthanneg0.9 <- subset(data1000m, value <= -0.9)
uniquevar1values <- unique(lessthanneg0.9$Var1)
uniquevar2values <- unique(lessthanneg0.9$Var2)

#save data
write.csv(higherthan0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf1000m_morethan_0.9.csv")

write.csv(lessthanneg0.9,"model_versions/final_eu_analysis/pc_values/selectedPCvalues/buf1000m_lessthan_neg_0.9.csv")


##go back to origional data and pick out relevant variables
buffer1000mvalues <- read.csv("model_versions/buf1000m_106404_addrss_5.csv")

setwd("model_versions/final_eu_analysis/networkgraphsnew/")
############################################################################################
###########################################################################################
buffer1000m_pos0.9 <- dplyr::select(buffer1000mvalues,"NO2","PM2.5","pm25_cu_slr", "pm25_fe_slr","pm25_k_slr","pm25_s_slr",              "pm25_ni_slr","pm25_v_slr", "pm25_si_slr","pm25_zn_slr","pmc_si_slr", "pmc_fe_slr", "pmc_cu_slr","BC","temp_feb_2019","temp_may_2019"    ,"AllSound" ,"TrafficNoise", "UHI", "np_ind_crops", "fodder","cereals","grassland", "MSAVI_ME300","NDVI_ME300", "NightLightExpanse",       "popdensity","AvIncmPIncRec","urbanity","NsnceIncrty", "UFP","Imp300m", "railroad_lightrail_tram", "EduHigh","T_dest_vio","property_crm",  "PM2.5", "BC","pm25_fe_slr","pm25_k_slr", "pm25_s_slr" ,"pm25_si_slr","pm25_v_slr", "pm25_zn_slr", "pmc_si_slr","pmc_k_slr","pmc_fe_slr"    , "pmc_cu_slr","pm25_mass_slr" , "temp_feb_2019" , "temp_may_2019","temp_aug_2019","temp_nov_2019","AllSound","TrafficNoise","UHI" ,"NightLightExpanse","flowerbulbs" ,"grains" ,"MSAVI_ME300" , "NDVI_ME300" , "urbanity", "popdensity","Imp300m","major_roads",             "railroad_lightrail_tram","HghstIncmPcnt" , "NsnceIncrty", "SoCoh" , "Facilities", "property_crm", "T_theft")

X <- as.matrix(buffer1000m_pos0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer1000m_pos0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer1000m_pos0.9",vertex.label.font=2)
dev.off()

############################################################################################
###########################################################################################
buffer1000mneg0.9 <- dplyr::select(buffer1000mvalues,"NO2", "PM2.5","Ozone", "temp_may_2019", "UHI", "BC" ,"temp_feb_2019" ,    "NightLightExpanse", "urbanity","grassland", "MSAVI_ME300" , "NDVI_ME300", "EduLow" , "EduSec", "AvIncmPIncRec" , "LowestIncmPcnt",    "popdensity","Imp300m", "SS83","NsnceIncrty","SoCoh" ,"Ozone", "BC", "TrafficNoise", "grassland", "MSAVI_ME300" ,"NDVI_ME300", "urbanity","popdensity" ,"Imp300m", "major_roads","EduHigh", "LowestIncmPcnt", "HghstIncmPcnt",  "NsnceIncrty" , "SoCoh", "Facilities")

X <- as.matrix(buffer250m_neg0.9) 

out.glasso <- huge(X, method="glasso", nlambda = 10, lambda.min.ratio = 0.1)
glasso.stars = huge.select(out.glasso, criterion = "stars", stars.thresh = 0.1) 
glasso.stars.flehs1 <- glasso.stars #Save with the name of your dataset to avoid rerunning 'huge'
refit.glasso.stars <- glasso.stars.flehs1$refit
colnames(refit.glasso.stars) <- rownames(refit.glasso.stars) <- colnames(X)
AdjGraph <- graph_from_adjacency_matrix(refit.glasso.stars, mode = "undirected") 
#dev.off()

plot(AdjGraph, layout = layout.circle)

jpeg("buffer1000mneg0.9.jpg")
com <- cluster_walktrap(AdjGraph) 
V(AdjGraph)$color <- com$membership+1
new_cols <- c("white", "white", "white", "white", "white", "white","white", "white")[membership(com)] #this was just initiated to color the inside of the nodes white, can ofcourse be changed to any other color
#AdjGraph <- set_graph_attr(AdjGraph, "layout", layout_with_kk(AdjGraph))
plot(com, AdjGraph, col=new_cols, vertex.label.dist=2.6, vertex.label.color="black", mark.border="white", vertex.label.cex=1.1, mark.col=c("lightpink1", "darkolivegreen1", "lavender", "plum1", "grey","blue", "yellow", "yellow") , main="buffer1000mneg0.9",vertex.label.font=2)
dev.off()


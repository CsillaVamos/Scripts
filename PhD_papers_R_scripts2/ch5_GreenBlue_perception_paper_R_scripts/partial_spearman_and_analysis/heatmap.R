############################################################################################
###########VISUALIZING SPEARMAN CORRELATION RESULTS

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
library(sf)
library(tidyverse)
library(rgeos)
library(sp)
library(tmap) 
library(raster)
library(sfheaders)
library(knitr)


setwd()

library(huge)
library(igraph)
library(ggplot2)
library(MASS) 
library(reshape2) 
library(reshape)
library(circlize)
library(itsadug)



##First initiate some functions we need
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
} # Get lower triangle of the correlation matrix

get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
} # Get upper triangle of the correlation matrix

reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}



test1 <- read.csv("final_results/final_results3.csv")
head(test1)
nrow(test1)

mydata <- test1

#colnames(mydata)
nrow(mydata)
ncol(mydata)

#take out problematic columns
mydata <- mydata[,!(names(mydata) %in% c("X", "geoid"))]

head(mydata)

colnames(mydata)

cormat <- cor(mydata)


upper_tri_1 <- get_upper_tri(cormat)
upper_tri <- round(upper_tri_1, digits=2)
# Melt the correlation matrix
melted_cormat <- melt(upper_tri, na.rm = TRUE)
melted_cormat <- na.omit(melted_cormat)
names(melted_cormat) <- c("Var1", "Var2", "value")
melted_cormat$Var2 <- as.character(melted_cormat$Var2) ##for some reason the order changed on my pc, so added these lines to keep the order of var2 and var 1
melted_cormat$Var2 <- factor(melted_cormat$Var2, levels=unique(melted_cormat$Var2))
melted_cormat$Var1 <- as.character(melted_cormat$Var1)
melted_cormat$Var1 <- factor(melted_cormat$Var1, levels = unique(melted_cormat$Var1))

#save data for summary statistics

write.csv(melted_cormat, "RESULTS/PC_values.csv")

###################################################################################
########CREATE HEATMAP

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 5, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 5, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("Pearson_correlation_values_heatmap.pdf")
ggheatmap + 
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 0.5) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.5, 0.77),
    legend.direction = "horizontal")+ ggtitle("Pearson correlation values")+
  #scale_x_discrete(labels = colnamesFLEHS2) +
  #scale_y_discrete(labels = colnamesFLEHS2) +
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()












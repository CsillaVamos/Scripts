####################################################################
###########subtracting pearson correlation datasets

###100 m

#upload euclidean buffer dataset

Eu_100m_PC <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_100m.csv")
#take out x column
Eu_100m_PC <- Eu_100m_PC[,!(names(Eu_100m_PC) %in% c("X"))]

#upload network buffer dataset
NB_100m_PC <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_100m.csv")
#take out x column
NB_100m_PC <- NB_100m_PC[,!(names(NB_100m_PC) %in% c("X"))]

#create new dataframe with variable 1 and 2
PC_diff_100m <- NB_100m_PC[,!(names(NB_100m_PC) %in% c("value"))]

#create a new column and subtract the nb and eu values from each other
PC_diff_100m$value <- Eu_100m_PC$value - NB_100m_PC$value


#save as a csv file
write.csv(PC_diff_100m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/Eu_NB_PC_values_100m.csv")


#select most significant values (greater than 0.3 and less than -0.3)
significant_PC_diffs_100m <- subset(PC_diff_100m, PC_diff_100m$'value' > 0.3 | PC_diff_100m$'value' < -0.3)

#save as a csv file
write.csv(significant_PC_diffs_100m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/significant_PC_diffs_100m.csv")



##############################################################################

###250m

#upload euclidean buffer dataset

Eu_250m_PC <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_250m.csv")
#take out x column
Eu_250m_PC <- Eu_250m_PC[,!(names(Eu_250m_PC) %in% c("X"))]

#upload network buffer dataset
NB_250m_PC <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_250m.csv")
#take out x column
NB_250m_PC <- NB_250m_PC[,!(names(NB_250m_PC) %in% c("X"))]

#create new dataframe with variable 1 and 2
PC_diff_250m <- NB_250m_PC[,!(names(NB_250m_PC) %in% c("value"))]

#create a new column and subtract the nb and eu values from each other
PC_diff_250m$value <- Eu_250m_PC$value - NB_250m_PC$value


#save as a csv file
write.csv(PC_diff_250m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/Eu_NB_PC_values_250m.csv")


#select most significant values (greater than 0.3 and less than -0.3)
significant_PC_diffs_250m <- subset(PC_diff_250m, PC_diff_250m$'value' > 0.3 | PC_diff_250m$'value' < -0.3)

#save as a csv file
write.csv(significant_PC_diffs_250m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/significant_PC_diffs_250m.csv")


##############################################################################

###500m

#upload euclidean buffer dataset

Eu_500m_PC <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_500m.csv")
#take out x column
Eu_500m_PC <- Eu_500m_PC[,!(names(Eu_500m_PC) %in% c("X"))]

#upload network buffer dataset
NB_500m_PC <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_500m.csv")
#take out x column
NB_500m_PC <- NB_500m_PC[,!(names(NB_500m_PC) %in% c("X"))]

#create new dataframe with variable 1 and 2
PC_diff_500m <- NB_500m_PC[,!(names(NB_500m_PC) %in% c("value"))]

#create a new column and subtract the nb and eu values from each other
PC_diff_500m$value <- Eu_500m_PC$value - NB_500m_PC$value


#save as a csv file
write.csv(PC_diff_500m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/Eu_NB_PC_values_500m.csv")


#select most significant values (greater than 0.3 and less than -0.3)
significant_PC_diffs_500m <- subset(PC_diff_500m, PC_diff_500m$'value' > 0.3 | PC_diff_500m$'value' < -0.3)

#save as a csv file
write.csv(significant_PC_diffs_500m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/significant_PC_diffs_500m.csv")


##############################################################################

###1000m

#upload euclidean buffer dataset

Eu_1000m_PC <- read.csv("model_versions/final_eu_analysis/pc_values/Euclid_buf_1000m.csv")
#take out x column
Eu_1000m_PC <- Eu_1000m_PC[,!(names(Eu_1000m_PC) %in% c("X"))]

#upload network buffer dataset
NB_1000m_PC <- read.csv("model_versions/networkbuffer_results/pc_values/all_PC_values_1000m.csv")
#take out x column
NB_1000m_PC <- NB_1000m_PC[,!(names(NB_1000m_PC) %in% c("X"))]

#create new dataframe with variable 1 and 2
PC_diff_1000m <- NB_1000m_PC[,!(names(NB_1000m_PC) %in% c("value"))]

#create a new column and subtract the nb and eu values from each other
PC_diff_1000m$value <- Eu_1000m_PC$value - NB_1000m_PC$value


#save as a csv file
write.csv(PC_diff_1000m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/Eu_NB_PC_values_1000m.csv")


#select most significant values (greater than 0.3 and less than -0.3)
significant_PC_diffs_1000m <- subset(PC_diff_1000m, PC_diff_1000m$'value' > 0.3 | PC_diff_1000m$'value' < -0.3)

#save as a csv file
write.csv(significant_PC_diffs_1000m, "model_versions/networkbuffer_results/diff_between_Eu_NB_PC_values/significant_PC_diffs_1000m.csv")




###find unique values for each distance

#100m 

uni_pc_diffs_100m1 <- unique(significant_PC_diffs_100m$Var1)

uni_pc_diffs_100m2 <- unique(significant_PC_diffs_100m$Var2)

uni_pc_diffs_100m1

uni_pc_diffs_100m2



unique_EFs_100m <- length(unique(significant_PC_diffs_100m$Var1))
  aggregate(data.frame(count = v), list(value = v), length)


#250m 

uni_pc_diffs_250m1 <- unique(significant_PC_diffs_250m$Var1)

uni_pc_diffs_250m2 <- unique(significant_PC_diffs_250m$Var2)

uni_pc_diffs_250m1

uni_pc_diffs_250m2

#500m 

uni_pc_diffs_500m1 <- unique(significant_PC_diffs_500m$Var1)

uni_pc_diffs_500m2 <- unique(significant_PC_diffs_500m$Var2)

uni_pc_diffs_500m1

uni_pc_diffs_500m2

#1000m 

uni_pc_diffs_1000m1 <- unique(significant_PC_diffs_1000m$Var1)

uni_pc_diffs_1000m2 <- unique(significant_PC_diffs_1000m$Var2)

uni_pc_diffs_1000m1

uni_pc_diffs_1000m2








###########################################################################################################
###create heatmap
setwd("model_versions/networkbuffer_results/heatmaps/")

melted_cormat <- PC_diff_100m

melted_cormat$value <- round(melted_cormat$value, digits=2)

# Create a ggheatmap
ggheatmap <- ggplot(melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "yellow", high = "blue", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson Correlation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 6, hjust = 1))+
  theme(axis.text.y = element_text(vjust = 1, 
                                   size = 6, hjust = 1))+
  coord_fixed()

# Print the heatmap
print(ggheatmap)

pdf("networkbuffer_diff_eu_nb_PC_100m.pdf")
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
    legend.direction = "horizontal")+ ggtitle("Difference between Eu and NB Pearson correlation values, 100m ")+
  #scale_x_discrete(labels = colnamesFLEHS2) +
  #scale_y_discrete(labels = colnamesFLEHS2) +
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))
dev.off()

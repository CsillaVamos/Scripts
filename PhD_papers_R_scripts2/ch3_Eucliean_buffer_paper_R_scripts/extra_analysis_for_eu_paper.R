#####################################################################################
##########EU buffer paper extra analysis

###upload all pc data

pc_vals <- read.csv("ALL_PCVALUES.csv")


###############################################################
#####create new columns

###create new column: 1000m - 100m
pc_vals$x1000_minus_100 <- pc_vals$X1000m_pvalue - pc_vals$X100m_pvalue

###create new column: 1000m - 250m
pc_vals$x1000_minus_250 <- pc_vals$X1000m_pvalue - pc_vals$X250m_pvalue

###create new column: 1000m - 500m
pc_vals$x1000_minus_500 <- pc_vals$X1000m_pvalue - pc_vals$X500m_pvalue

###create new column: 500m - 100m
pc_vals$x500_minus_100 <- pc_vals$X500m_pvalue - pc_vals$X100m_pvalue

###create new column: 500m - 250m
pc_vals$x500_minus_250 <- pc_vals$X500m_pvalue - pc_vals$X250m_pvalue

###create new column: 250m - 100m
pc_vals$x250_minus_100 <- pc_vals$X250m_pvalue - pc_vals$X100m_pvalue



#################################################################
###find significant values for each create columns

###1000m_minus_100m : select all values > 0.5 or < -0.5
sig_pc_vals_1000_minus100m <- pc_vals[pc_vals$x1000_minus_100 > 0.5 | pc_vals$x1000_minus_100 < -0.5, c("x1000_minus_100", "variable1", "variable2")]

###1000m_minus_250m : select all values > 0.5 or < -0.5
sig_pc_vals_1000_minus250m <- pc_vals[pc_vals$x1000_minus_250 > 0.5 | pc_vals$x1000_minus_250 < -0.5, c("x1000_minus_250", "variable1", "variable2")]

###1000m_minus_500m : select all values > 0.5 or < -0.5
sig_pc_vals_1000_minus500m <- pc_vals[pc_vals$x1000_minus_500 > 0.5 | pc_vals$x1000_minus_500 < -0.5, c("x1000_minus_500", "variable1", "variable2")]

###500m_minus_100m : select all values > 0.5 or < -0.5
sig_pc_vals_500_minus100m <- pc_vals[pc_vals$x500_minus_100 > 0.5 | pc_vals$x500_minus_100 < -0.5, c("x500_minus_100", "variable1", "variable2")]

###500m_minus_250m : select all values > 0.5 or < -0.5
sig_pc_vals_500_minus250m <- pc_vals[pc_vals$x500_minus_250 > 0.5 | pc_vals$x500_minus_250 < -0.5, c("x500_minus_250", "variable1", "variable2")]

###250m_minus_100m : select all values > 0.5 or < -0.5
sig_pc_vals_250_minus100m <- pc_vals[pc_vals$x250_minus_100 > 0.5 | pc_vals$x250_minus_100 < -0.5, c("x250_minus_100", "variable1", "variable2")]



###########################################################################
###save each result as its own csv

write.csv(sig_pc_vals_1000_minus100m,"sig_pc_vals_1000_minus100m.csv")

write.csv(sig_pc_vals_1000_minus250m,"sig_pc_vals_1000_minus250m.csv")

write.csv(sig_pc_vals_1000_minus500m,"sig_pc_vals_1000_minus500m.csv")

write.csv(sig_pc_vals_500_minus100m,"sig_pc_vals_500_minus100m.csv")

write.csv(sig_pc_vals_500_minus250m,"sig_pc_vals_500_minus250m.csv")

write.csv(sig_pc_vals_250_minus100m,"sig_pc_vals_250_minus100m.csv")

head(sig_pc_vals_1000_minus100m)

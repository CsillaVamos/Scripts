##################################Core concepts catagorization for PC values from euclidean buffer analysis

###upload PC data
PC_data <- read.csv("model_versions/final_eu_analysis/ALL_PCVALUES.csv")
nrow(PC_data)

###take out all EFs correlated with themselves
PC_data2 <-subset(PC_data, PC_data$variable1 != PC_data$variable2)
nrow(PC_data2)



######################NEW VERSION

# create rules for new column based on correlation patterns
PC_data2 <- PC_data2 %>%
  mutate(Pattern = case_when(
    (abs(X1000m_pvalue - X100m_pvalue)) <= 0.1 ~ "little to no change",
    (X1000m_pvalue - X100m_pvalue) > 0.1 ~ "positive increase",
    (X100m_pvalue - X1000m_pvalue) > -1 ~ "negative increase",
    TRUE ~ NA_character_
  ))

# add extra rule
PC_data2 <- PC_data2 %>%
  mutate(Pattern2 = case_when(
    (abs(X100m_pvalue) - abs(X250m_pvalue)) > 0.25 ~ "sudden decrease",
    TRUE ~ NA_character_
  ))

PC_data3 <- PC_data2

#combine extra rule into main pattern column
PC_data3 <- PC_data3 %>%
  mutate(Pattern = if_else(is.na(Pattern2) | Pattern2 != "sudden decrease", Pattern, "sudden decrease"))

#delete extra column
PC_data3$Pattern2 <- NULL

# add extra rule
PC_data3 <- PC_data3 %>%
  mutate(Pattern2 = case_when(
    (-0.3 <= X100m_pvalue & X100m_pvalue <= 0.3) & 
      (-0.3 <= X250m_pvalue & X250m_pvalue <= 0.3) & 
      (-0.3 <= X500m_pvalue & X500m_pvalue <= 0.3) & 
      (-0.3 <= X1000m_pvalue & X1000m_pvalue <= 0.3) ~ "no correlation",
    TRUE ~ NA_character_
  ))

PC_data4 <- PC_data3

#combine extra rule into main pattern column
PC_data4 <- PC_data4 %>%
  mutate(Pattern = if_else(is.na(Pattern2) | Pattern2 != "no correlation", Pattern, "no correlation"))

#delete extra column
PC_data4$Pattern2 <- NULL


# add extra rule
PC_data4 <- PC_data4 %>%
  mutate(Pattern2 = case_when(
    (X250m_pvalue - abs(X100m_pvalue)) > 0.5 ~ "sudden increase",
    TRUE ~ NA_character_
  ))

PC_data5 <- PC_data4

#combine extra rule into main pattern column
PC_data5 <- PC_data5 %>%
  mutate(Pattern = if_else(is.na(Pattern2) | Pattern2 != "sudden increase", Pattern, "sudden increase"))

#delete extra column
PC_data5$Pattern2 <- NULL

#save the dataframe
write.csv(PC_data5, "model_versions/final_eu_analysis/pcdata_and_patterns.csv")



allsuddendecreases <- subset(PC_data5, PC_data5$Pattern == "sudden decrease")
allsuddenincreases <- subset(PC_data5, PC_data5$Pattern == "sudden increase")




####################################################################
###########PART 2: determine how often each correlation pattern emerges for each EF

###create a dataframe with a row for each EF and a column for each correlation pattern.


############################################
##########################################
EF_var1 <- subset(PC_data5, PC_data5$variable1 == "fruit_vegstore")
EF_var1 %>% count(EF_var1$Pattern)
EF_var2 <- subset(PC_data5, PC_data5$variable2 == "fruit_vegstore")
EF_var2 %>% count(EF_var2$Pattern)
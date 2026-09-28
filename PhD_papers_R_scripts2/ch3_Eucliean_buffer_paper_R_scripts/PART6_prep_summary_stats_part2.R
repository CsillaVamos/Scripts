#######################PART 2

#upload all p values from previous summary stats R script

all_pvalues3 <- all_pvalues

#create physico chemical csv file
physico_chemold <- subset(all_pvalues3, env_var1 == "physico_chem", )
physico_chem <- subset(physico_chemold, env_var2 == "physico_chem")

#create built csv file
builtold <- subset(all_pvalues3, env_var1 == "built")
built <- subset(builtold, env_var2 == "built")

#create social csv file
socialold <- subset(all_pvalues3, env_var1 == "social")
social <- subset(socialold, env_var2 == "social")

#create food csv file
foodold <- subset(all_pvalues3, env_var1 == "food")
food <- subset(foodold, env_var2 == "food")


#built and food
built_food1 <- subset(all_pvalues3, env_var1 == "built")
built_food2<- subset(built_food1, env_var2 == "food")
write.csv(built_food2, "model_versions/pvalues/new_comparisons/Environments/between/combined/built_food.csv")

#built and social
built_socal1 <- subset(all_pvalues3, env_var1 == "built")
built_socal2 <- subset(built_socal1, env_var2 == "social")
write.csv(built_socal2, "model_versions/pvalues/new_comparisons/Environments/between/combined/built_social.csv")

#physicochem and built
pc_built1 <- subset(all_pvalues3, env_var1 == "physico_chem")
pc_built2 <- subset(pc_built1, env_var2 == "built")
write.csv(pc_built2, "model_versions/pvalues/new_comparisons/Environments/between/combined/physicochem_built.csv")

#physicochem and food
pc_food1 <- subset(all_pvalues3, env_var1 == "physico_chem")
pc_food2 <- subset(pc_food1, env_var2 == "food")
write.csv(pc_food2, "model_versions/pvalues/new_comparisons/Environments/between/combined/physicochem_food.csv")

#physicochem and social
pc_social1 <- subset(all_pvalues3, env_var1 == "physico_chem")
pc_social2 <- subset(pc_social1, env_var2 == "social")
write.csv(pc_social2, "model_versions/pvalues/new_comparisons/Environments/between/combined/physicochem_social.csv")

#social and food
social_food1 <- subset(all_pvalues3, env_var1 == "social")
social_food2 <- subset(social_food1, env_var2 == "food")
write.csv(social_food2, "model_versions/pvalues/new_comparisons/Environments/between/combined/social_food.csv")



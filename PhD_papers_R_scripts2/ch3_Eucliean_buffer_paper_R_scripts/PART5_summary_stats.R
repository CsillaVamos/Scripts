##################Summary Statistics

library(dplyr)


#creating subsetted versions of euclidean buffer model resutls

#environments

#upload data
results_1000m <- read.csv("model_versions/buf1000m_106404_addrss_1.csv")

#subset data
colnames(results_1000m)

results_1000m_physico_chem <- results_1000m %>% dplyr::select(1:28)
colnames(results_1000m_physico_chem)

results_1000m_built <- results_1000m %>% dplyr::select(29:59)
colnames(results_1000m_built)

results_1000m_social <- results_1000m %>% dplyr::select(60:82)
colnames(results_1000m_social)

results_1000m_food <- results_1000m %>% dplyr::select(83:89)
colnames(results_1000m_food)

#save data (then run it through network analysis correlation script)

write.csv(results_1000m_physico_chem, "model_versions/subsetted_Versions/environment/1000m/results_1000m_physico_chem.csv")

write.csv(results_1000m_built, "model_versions/subsetted_Versions/environment/1000m/results_1000m_built.csv")

write.csv(results_1000m_social, "model_versions/subsetted_Versions/environment/1000m/results_1000m_social.csv")

write.csv(results_1000m_food, "model_versions/subsetted_Versions/environment/1000m/results_1000m_food.csv")


###summary statistics questions
install.packages("kableExtra")
library(kableExtra)


##1 How do correlations within families vary in the different Euclidean buffer sizes?
#create a table to show 

#physico-chemical environment
physico_chem_env <- read.csv("model_versions/pvalues/subsetted_versions/environments/combined/physicochem_2.csv")

df <- dplyr::select(physico_chem_env, c(5:8))

##2 How do correlations within families vary in the different network buffer sizes?

##3 How do correlations within environments vary in the different Euclidean buffer sizes?

##4 How do correlations within environments vary in the different network buffer sizes?

##5 Are there any outstanding correlations present in any of the buffers analyses? If so, how does this particular correlation compare to the other buffer analyses? (need to define what is considered an outstanding correlation)

##6 How do correlations within families vary between buffer sizes of the same distance for both the Euclidean and network buffers?

##7 How do correlations within environments vary between buffer sizes of the same distance for both the Euclidean and network buffers?






##################trial


# Sample dataframe
data <- data.frame(
  A = c(1, 2, 3, 4, 5),
  B = c(5, 4, 3, 2, 1),
  C = c(2, 3, 4, 5, 6),
  D = c(3, 4, 3, 2, 1)
)

# Calculate Pearson correlation matrix
cor_matrix <- cor(data)

# Define a color palette (e.g., blue to red)
color_palette <- colorRampPalette(c("blue", "white", "red"))(100)

# Create the heatmap with color bars and labels
heatmap(cor_matrix, 
        col = color_palette,  # Set the color palette
        scale = "none",       # Use "none" to keep the original correlation values
        margins = c(5, 10),    # Add margins to accommodate color bars and labels
        main = "Correlation Heatmap",  # Add a title
        labCol = colnames(data),      # Add column labels
        labRow = rownames(data),      # Add row labels
        cexCol = 0.8,        # Adjust column label size
        cexRow = 0.8         # Adjust row label size
)

# Add color bar
legend("bottomleft", legend = "Correlation", fill = color_palette, bty = "n")


#################################trial 2

install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

color_scale <- scale_color_gradient(low = "yellow", high = "blue")

df <- df %>%
  mutate(color_column = color_scale(value_column))

ggplot(df, aes(x = x_column, y = y_column, color = color_column)) +
  geom_point() +
  color_scale +
  labs(color = "Value Range")



# Example DataFrame
df <- data.frame(
  x_column = 1:10,
  y_column = 11:20,
  value_column = c(5, 8, 12, 15, 20, 25, 30, 35, 40, 50)
)

# Define your color scale
color_scale <- scale_color_gradient(low = "red", high = "green")

# Apply conditional formatting to the DataFrame using mutate
df <- df %>%
  mutate(color_column = value_column) # We're using value_column as-is

# Create the scatterplot and apply the color scale
ggplot(df, aes(x = x_column, y = y_column, color = color_column)) +
  geom_point() +
  color_scale +
  labs(color = "Value Range")



############################trial 3

# Install and load the DT package if you haven't already
install.packages("DT")
library(DT)

# Sample dataframe
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Score = c(85, 70, 95)
)

# Define a color function
color_cells <- function(value) {
  if (value >= 90) {
    color <- "green"
  } else if (value >= 80) {
    color <- "orange"
  } else {
    color <- "red"
  }
  list(background = color)
}

# Apply the color function to the Score column
df$Score <- sapply(df$Score, function(x) {
  color_cells(x)
})

# Create an interactive datatable
datatable(df, options = list(
  columnDefs = list(list(targets = 2, className = 'dt-right')),
  rowCallback = JS(
    "function(row, data) {
      var color = data[1];
      if (color) {
        $(row).find('td:eq(1)').css('background-color', color.background);
      }
    }"
  )
))

##############################################################################################3
################################################################################################3
################################################################################################
########3NEW

#upload all physico chem data

physico_chem_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_100m_physicochemial.csv")

physico_chem_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_250m_physicochem.csv")

physico_chem_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_500m_physicochem.csv")

physico_chem_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_1000m_physicochem.csv")


#combine all into one csv file

all_pvalues <- data.frame(physico_chem_100$Var1, physico_chem_100$Var2, physico_chem_100$value, physico_chem_250$value, physico_chem_500$value, physico_chem_1000$value)

names(all_pvalues)[names(all_pvalues) == "physico_chem_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "physico_chem_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "physico_chem_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physico_chem_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physico_chem_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physico_chem_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/within/combined/physicochem_all_eubuffers.csv")


#upload all built data

built_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_100m_built.csv")

built_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_250m_built.csv")

built_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_500m_built.csv")

built_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_1000m_built.csv")


#combine all into one csv file

all_pvalues <- data.frame(built_100$Var1, built_100$Var2, built_100$value, built_250$value, built_500$value, built_1000$value)

names(all_pvalues)[names(all_pvalues) == "built_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "built_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "built_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/within/combined/built_all_eubuffers.csv")


#upload all social data

social_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_100m_social.csv")

social_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_250m_social.csv")

social_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_500m_social.csv")

social_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_1000m_social.csv")


#combine all into one csv file

all_pvalues <- data.frame(social_100$Var1, social_100$Var2, social_100$value, social_250$value, social_500$value, social_1000$value)

names(all_pvalues)[names(all_pvalues) == "social_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "social_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "social_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/within/combined/social_all_eubuffers.csv")


#upload all food data

food_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_100m_food.csv")

food_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_250m_food.csv")

food_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_500m_food.csv")

food_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/within/Euclid_buf_1000m_food.csv")


#combine all into one csv file

all_pvalues <- data.frame(food_100$Var1, food_100$Var2, food_100$value, food_250$value, food_500$value, food_1000$value)

names(all_pvalues)[names(all_pvalues) == "food_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "food_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "food_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "food_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "food_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "food_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/within/combined/food_all_eubuffers.csv")


#####################
###combined environments

##physicochem_built

physicochem_built_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_physicochem_built.csv")

physicochem_built_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_physicochem_built.csv")

physicochem_built_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_physicochem_built.csv")

physicochem_built_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_physicochem_built.csv")

nrow(physicochem_built_100)
nrow(physicochem_built_250)
nrow(physicochem_built_500)
nrow(physicochem_built_1000)

all_pvalues <- data.frame(physicochem_built_100$Var1, physicochem_built_100$Var2, physicochem_built_100$value, physicochem_built_250$value, physicochem_built_500$value, physicochem_built_1000$value)

names(all_pvalues)[names(all_pvalues) == "physicochem_built_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "physicochem_built_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "physicochem_built_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_built_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_built_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_built_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/physicochem_built_all_eubuffers.csv")


##physicochem_social 

physicochem_social_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_physicochem_social.csv")

physicochem_social_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_physicochem_social.csv")

physicochem_social_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_physicochem_social.csv")

physicochem_social_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_physicochem_social.csv")

nrow(physicochem_social_100)
nrow(physicochem_social_250)
nrow(physicochem_social_500)
nrow(physicochem_social_1000)

all_pvalues <- data.frame(physicochem_social_100$Var1, physicochem_social_100$Var2, physicochem_social_100$value, physicochem_social_250$value, physicochem_social_500$value, physicochem_social_1000$value)

names(all_pvalues)[names(all_pvalues) == "physicochem_social_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "physicochem_social_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "physicochem_social_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_social_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_social_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_social_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/physicochem_social_all_eubuffers.csv")


##physicochem_food 
physicochem_food_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_physicochem_food.csv")

physicochem_food_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_physicochem_food.csv")

physicochem_food_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_physicochem_food.csv")

physicochem_food_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_physicochem_food.csv")

nrow(physicochem_food_100)
nrow(physicochem_food_250)
nrow(physicochem_food_500)
nrow(physicochem_food_1000)


all_pvalues <- data.frame(physicochem_food_100$Var1, physicochem_food_100$Var2, physicochem_food_100$value, physicochem_food_250$value, physicochem_food_500$value, physicochem_food_1000$value)

names(all_pvalues)[names(all_pvalues) == "physicochem_food_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "physicochem_food_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "physicochem_food_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_food_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_food_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "physicochem_food_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/physicochem_food_all_eubuffers.csv")


##built_social 

built_social_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_built_social.csv")

built_social_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_built_social.csv")

built_social_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_built_social.csv")

built_social_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_built_social.csv")

nrow(built_social_100)
nrow(built_social_250)
nrow(built_social_500)
nrow(built_social_1000)


all_pvalues <- data.frame(built_social_100$Var1, built_social_100$Var2, built_social_100$value, built_social_250$value, built_social_500$value, built_social_1000$value)

names(all_pvalues)[names(all_pvalues) == "built_social_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "built_social_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "built_social_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_social_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_social_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_social_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/built_social_all_eubuffers.csv")



##built_food 
built_food_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_built_food.csv")

built_food_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_built_food.csv")

built_food_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_built_food.csv")

built_food_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_built_food.csv")

nrow(built_food_100)
nrow(built_food_250)
nrow(built_food_500)
nrow(built_food_1000)

all_pvalues <- data.frame(built_food_100$Var1, built_food_100$Var2, built_food_100$value, built_food_250$value, built_food_500$value, built_food_1000$value)

names(all_pvalues)[names(all_pvalues) == "built_food_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "built_food_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "built_food_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_food_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_food_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "built_food_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/built_food_all_eubuffers.csv")


##social_food 
social_food_100 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_100m_social_food.csv")

social_food_250 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_250m_social_food.csv")

social_food_500 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_500m_social_food.csv")

social_food_1000 <- read.csv("model_versions/pvalues/new_comparisons/Environments/between/Euclid_buf_1000m_social_food.csv")

nrow(social_food_100)
nrow(social_food_250)
nrow(social_food_500)
nrow(social_food_1000)

all_pvalues <- data.frame(social_food_100$Var1, social_food_100$Var2, social_food_100$value, social_food_250$value, social_food_500$value, social_food_1000$value)

names(all_pvalues)[names(all_pvalues) == "social_food_100.Var1"] = "variable1"
names(all_pvalues)[names(all_pvalues) == "social_food_100.Var2"] = "variable2"
names(all_pvalues)[names(all_pvalues) == "social_food_100.value"] = "100m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_food_250.value"] = "250m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_food_500.value"] = "500m_pvalue"
names(all_pvalues)[names(all_pvalues) == "social_food_1000.value"] = "1000m_pvalue"

write.csv(all_pvalues, "model_versions/pvalues/new_comparisons/environments/between/combined/social_food_all_eubuffers.csv")

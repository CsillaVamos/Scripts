#####################################################################
###########analysis of results for fourth paper


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("glmnet", lib = "C:/R_temp_library")

# Load the package from that location
library(glmnet, lib.loc = "C:/R_temp_library")


# Create a local folder for R packages
dir.create("C:/R_temp_library", showWarnings = FALSE)

# Install glmnet to that folder
install.packages("ordinalNet", lib = "C:/R_temp_library")

# Load the package from that location
library(ordinalNet, lib.loc = "C:/R_temp_library")





# Load the library
library(MASS)
library(ggplot2)



###upload final results
results <- read.csv("final_results/final_results3.csv", sep = ";")
svi_results <- read.csv("streetview_image_analysis/svi_CORRECTED_ip_geoid.csv", sep = ",")

head(svi_results)

###take out irrelevant columns
svi_results$buf20m_sum_pix <- NULL
svi_results$buf50m_sum_pix <- NULL
svi_results$buf150m_sum_pix <- NULL
svi_results$buf300m_sum_pix <- NULL
svi_results$buf600m_sum_pix <- NULL


###join both datasets
all_results <- merge(results, svi_results, by = "geoid", all = TRUE) 

###select relevant columns
svi_results2 <- all_results[, c("geoid", "bsex", "education", "gage", "houseview", "street", "nghbrhd", "buf20m_svi_count", "buf20m_mean_pix", "buf50m_svi_count", "buf50m_mean_pix", "buf150m_svi_count", "buf150m_mean_pix", "buf300m_svi_count", "buf300m_mean_pix", "buf600m_svi_count", "buf600m_mean_pix")]

head(svi_results2)
nrow(svi_results3)

svi_results3 <- na.omit(svi_results2)


results <- svi_results3

###separate results
street_results <- subset(results, select = -c(geoid, nghbrhd, houseview) )
nghbrd_results <- subset(results, select = -c(geoid, street, houseview) )
houseview_results <- subset(results, select = -c(geoid, street, nghbrhd) )



###################################################################
########regression analysis for street results 

street_results$street <- ordered(street_results$street, levels = 1:5)


# Fit model with multiple green space predictors
model <- polr(
  street ~ N_NDVI_mean + N_NDVI_bl_mean + N_TH_mean + N_TH_bl_mean + N_allgrn_pcnt,
  data = street_results,
  Hess = TRUE
)


# Coefficient table
ctable <- coef(summary(model))

# Calculate p-values
pvals <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2

# Add p-values to the coefficient table
ctable <- cbind(ctable, "p value" = pvals)
print(ctable)


summary(model)


#############################################################################################3
#################performing a lasso regression with the street view data

# Convert Likert to numeric if it's a factor
street_results$street <- as.numeric(as.character(street_results$street))

# Define predictor matrix (excluding 'street')
x <- model.matrix(street ~ ., data = street_results)[, -1]  # Remove intercept

# Define response vector
y <- street_results$street


# Run cross-validated Lasso regression
lasso_cv <- cv.glmnet(x, y, alpha = 1)

# Plot the cross-validation error curve
plot(lasso_cv)

# Get the best lambda (minimizes error)
best_lambda <- lasso_cv$lambda.min
print(best_lambda)



# Extract coefficients at best lambda
coef(lasso_cv, s = best_lambda)


# Predict on new data or the same dataset
predictions <- predict(lasso_cv, s = best_lambda, newx = x)



##############################################################################
######Ordinal regression analysis on street view data


# Convert 'street' to an ordered factor (Likert scale)
street_results$street <- ordered(street_results$street,
                                 levels = c("1", "2", "3", "4", "5"))  # Adjust levels if needed

# Fit the ordinal regression model
model <- polr(street ~ ., data = street_results, Hess = TRUE)

# View model summary
summary(model)

# Get p-values for coefficients
ctable <- coef(summary(model))
p_values <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
ctable <- cbind(ctable, "p value" = p_values)
print(ctable)




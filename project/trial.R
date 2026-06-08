install.packages("readr")


# Step 1: Load Required Libraries
library(dplyr)
library(ggplot2)
library(readr)


# Step 2: Load Datasets
videogame_ratings <- read_csv("F1_23_videogame_driver_ratings_dec2023.csv")
driver_of_day_votes <- read_csv("Formula1_2023season_driverOfTheDayVotes.csv")
qualifying_results <- read_csv("Formula1_2023season_qualifyingResults.csv")
race_results <- read_csv("Formula1_2023season_raceResults.csv")

# Step 3: Standardize Column Names
names(videogame_ratings) <- tolower(gsub(" ", "_", names(videogame_ratings)))
names(driver_of_day_votes) <- tolower(gsub(" ", "_", names(driver_of_day_votes)))
names(qualifying_results) <- tolower(gsub(" ", "_", names(qualifying_results)))
names(race_results) <- tolower(gsub(" ", "_", names(race_results)))

# Rename problematic column for easier use
driver_of_day_votes <- driver_of_day_votes %>%
  rename(first_place_percent = `1st_place(%)`)

# Step 4: Merge Datasets
combined_data <- race_results %>%
  left_join(videogame_ratings, by = "driver") %>%
  left_join(driver_of_day_votes %>%
              rename(driver = `1st_place`), by = "driver")

# Step 5: Feature Engineering
# Calculate average race performance
combined_data <- combined_data %>%
  group_by(driver) %>%
  mutate(avgraceperformance = mean(points, na.rm = TRUE)) %>%
  ungroup()

# Calculate Driver of the Day frequency
combined_data <- combined_data %>%
  mutate(driverofthedayfrequency = first_place_percent / 100)

# Step 6: Exploratory Data Analysis
# Correlation Matrix
correlation_data <- combined_data %>%
  select(avgraceperformance, rtg, exp, salary, driverofthedayfrequency) %>%
  na.omit()
cor_matrix <- cor(correlation_data)
print(cor_matrix)

# Visualize Pairwise Relationships
pairs(correlation_data, main = "Pairwise Relationships", pch = 21, bg = "blue")

# Step 7: Linear Regression Model
linear_model <- lm(avgraceperformance ~ rtg + exp + salary + driverofthedayfrequency, data = correlation_data)
summary(linear_model)

# Step 8: Random Forest Regression (Non-Linear)
library(randomForest)

# Split into training and testing sets
set.seed(42)
train_indices <- sample(1:nrow(correlation_data), size = 0.7 * nrow(correlation_data))
train_data <- correlation_data[train_indices, ]
test_data <- correlation_data[-train_indices, ]

# Train Random Forest Model
rf_model <- randomForest(avgraceperformance ~ rtg + exp + salary + driverofthedayfrequency,
                         data = train_data, ntree = 100, importance = TRUE)

# Evaluate Random Forest Model
rf_predictions <- predict(rf_model, test_data)
rf_mse <- mean((rf_predictions - test_data$avgraceperformance)^2)
rf_r2 <- 1 - (sum((rf_predictions - test_data$avgraceperformance)^2) /
                sum((test_data$avgraceperformance - mean(test_data$avgraceperformance))^2))
print(paste("Random Forest MSE:", rf_mse))
print(paste("Random Forest R2:", rf_r2))

# Feature Importance
importance <- importance(rf_model)
print(importance)
varImpPlot(rf_model, main = "Feature Importance (Random Forest)")

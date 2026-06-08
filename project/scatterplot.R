# Load Required Libraries
library(ggplot2)
library(dplyr)

# Correct Scatterplot with Regression Line for Each Predictor
predictors <- c("rtg", "exp", "salary", "driverofthedayfrequency")

# Loop Through Each Predictor and Plot
for (predictor in predictors) {
  p <- ggplot(data = combined_data, aes(x = .data[[predictor]], y = avgraceperformance)) +
    geom_point(color = "blue", alpha = 0.6) +
    geom_smooth(method = "lm", color = "red", se = FALSE) +
    labs(title = paste("Regression: AvgRacePerformance vs", predictor),
         x = predictor,
         y = "AvgRacePerformance") +
    theme_minimal()
  
  print(p)  # Correctly print each plot
}

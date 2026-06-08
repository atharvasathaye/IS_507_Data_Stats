# Fit a linear regression model
linear_model <- lm(avgraceperformance ~ rtg + exp + salary + driverofthedayfrequency, data = combined_data)

# Summarize the model
summary(linear_model)

# Predicted vs Actual plot
combined_data <- combined_data %>%
  mutate(predicted = predict(linear_model, .))

ggplot(data = combined_data, aes(x = avgraceperformance, y = predicted)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Predicted vs Actual Performance",
       x = "Actual Performance (AvgRacePerformance)",
       y = "Predicted Performance") +
  theme_minimal()

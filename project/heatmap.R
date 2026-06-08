# Calculate the correlation matrix
correlation_data <- combined_data %>%
  select(avgraceperformance, rtg, exp, salary, driverofthedayfrequency) %>%
  na.omit()
cor_matrix <- cor(correlation_data)

# Visualize the correlation matrix as a heatmap
library(ggplot2)
library(reshape2)

# Melt the correlation matrix into a long format for ggplot
cor_melt <- melt(cor_matrix)

# Create the heatmap
ggplot(data = cor_melt, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1)) +
  theme_minimal() +
  labs(title = "Correlation Heatmap", x = "Variables", y = "Variables") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

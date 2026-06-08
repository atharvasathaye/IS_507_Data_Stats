
mean_height <- 55  
sd_height <- 6     
ride_height <- 52 

z_score <- (ride_height - mean_height) / sd_height

cat("Z-score:", z_score, "\n")

prob_shorter <- pnorm(z_score)

cat("Probability of being shorter than 52 inches:", prob_shorter, "\n")
cat("Percentage who cannot ride:", prob_shorter * 100, "%\n")


# Calculate the probability of being taller than the ride height
prob_can_ride <- 1 - pnorm(z_score)

# Print the probability
cat("Probability of being able to ride:", prob_can_ride, "\n")




   p <- 0.6914625

   prob <- dnbinom(12 - 5, size = 5, prob = p)

   cat("Probability that the 5th person who can ride is the 12th person:", prob, "\n")
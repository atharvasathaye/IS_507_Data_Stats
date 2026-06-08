n <- 150
p <- 0.90
sd <- 3.67423461417477
expected <- 135

z_score <- (105 - expected) / sd
print(paste("Z-score for 105 people:", z_score))


prob <- pnorm((105.5 - expected) / sd)
print(paste("Probability of 105 or fewer people:", prob))
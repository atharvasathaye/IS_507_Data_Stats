mean_score <- 1100
sd_score <- 200

z_score_1350 <- (1350 - mean_score) / sd_score
z_score_1550 <- (1550 - mean_score) / sd_score

cat("Z-score for 1350:", z_score_1350, "\n")
cat("Z-score for 1550:", z_score_1550, "\n")

prob_above_1350 <- 1 - pnorm(z_score_1350)
prob_above_1550 <- 1 - pnorm(z_score_1550)

cat("P(X ≥ 1350):", prob_above_1350, "\n")
cat("P(X ≥ 1550):", prob_above_1550, "\n")

conditional_prob <- prob_above_1550 / prob_above_1350

cat("P(X ≥ 1550 | X ≥ 1350):", conditional_prob, "\n")
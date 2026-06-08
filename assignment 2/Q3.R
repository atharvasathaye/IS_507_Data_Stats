men_mean <- 4313
men_sd <- 583

women_mean <- 5261
women_sd <- 807

# (a) Cutoff time for fastest 10% of men
men_cutoff <- qnorm(0.10, mean = men_mean, sd = men_sd)
print(paste("Cutoff time for fastest 10% of men:", round(men_cutoff, 2), "seconds"))

# (b) Cutoff time for slowest 5% of women
women_cutoff <- qnorm(0.95, mean = women_mean, sd = women_sd)
print(paste("Cutoff time for slowest 5% of women:", round(women_cutoff, 2), "seconds"))


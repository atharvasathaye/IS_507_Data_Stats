n <- 6  # number of questions
p <- 1/4  # probability of getting a question right

prob_2 <- dbinom(2, size = n, prob = p)
prob_4 <- dbinom(4, size = n, prob = p)

total_prob <- prob_2 + prob_4

cat("P(X = 2):", prob_2, "\n")
cat("P(X = 4):", prob_4, "\n")
cat("P(X = 2 or X = 4):", total_prob, "\n")



n <- 6
p <- 1/4


prob_2 <- dbinom(2, size = n, prob = p)
prob_4 <- dbinom(4, size = n, prob = p)


total_prob <- prob_2 + prob_4

cat("P(X = 2):", prob_2, "\n")
cat("P(X = 4):", prob_4, "\n")
cat("P(X = 2 or X = 4):", total_prob, "\n")
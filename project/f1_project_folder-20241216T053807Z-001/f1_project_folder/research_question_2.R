##RQ # 2: Do race results influence DOTD vote?
##Data Analysis Type: Logistic Regression
##What is the probability of winning DOTD given numerous race day variables


#import the datasets
F1_2023_Results <- read.csv("Formula1_2023season_raceResults.csv")
driver_of_the_day <- read.csv("Formula1_2023season_driverOfTheDayVotes.csv")
video_game_results <- read.csv("F1_23_videogame_driver_ratings_initial.csv")

F1_2023_DOTD_Results <- read.csv("DOTD_Results.csv")

help(is.numeric)

##VARIABLES##

#Predictors
 #Points - Continuous
 #Finishing Position - Ordinal (being treated as continuous)
 #Starting Position - Ordinal (being treated as continuous)
 #Fastest Lap - Categorical/Binary (Yes or No)

#Dependent Variable
 #DOTD_Winner - Categorical/Binary (Yes or No)

#FastestLap is categorical/binary. Did the driver get the fastest lap in that race?
is.character(F1_2023_DOTD_Results$FastestLap)
F1_2023_DOTD_Results$FastestLap <- factor(F1_2023_DOTD_Results$FastestLap)
is.factor(F1_2023_DOTD_Results$FastestLap)
levels(F1_2023_DOTD_Results$FastestLap)
#F1_2023_DOTD_Results$DOTD_Winner2 <- relevel(F1_2023_DOTD_Results$DOTD_Winner, ref="Yes")

#DOTD_Winner variable is binary, either yes or no.
is.character(F1_2023_DOTD_Results$DOTD_Winnner)
F1_2023_DOTD_Results$DOTD_Winnner <- factor(F1_2023_DOTD_Results$DOTD_Winnner )
is.factor(F1_2023_DOTD_Results$DOTD_Winnner)

#FinishingPosition and StartingPosition are ordinal, but being treated as continous
is.numeric(F1_2023_DOTD_Results$FinishingPosition)
is.numeric(F1_2023_DOTD_Results$Starting_Position)
table(F1_2023_DOTD_Results$DOTD_Winnner)

##lOGISTIC REGRESSION MODEL##
library(stats)


#initial model
DOTD_model <- glm(DOTD_Winnner ~ Points + FinishingPosition 
                  + Starting_Position + FastestLap,
                  data = F1_2023_DOTD_Results,
                  family = binomial)

summary(DOTD_model)

#only FinishingPosition has a significant p-value

#model with points + fastest lap

DOTD_modelX <- glm(DOTD_Winnner ~ Points + FastestLap,
                  data = F1_2023_DOTD_Results,
                  family = binomial)

summary(DOTD_modelX)

#Points is significant, remove fastest lap

#model with finishing position, starting position, and fastest lap
DOTD_model2 <- glm(DOTD_Winnner ~ FinishingPosition 
                  + Starting_Position + FastestLap,
                  data = F1_2023_DOTD_Results,
                  family = binomial)

summary(DOTD_model2)

#Both position variables were significant. Remove fastestlap

##Remove fastest lap from modelX

DOTD_modelPoints <- glm(DOTD_Winnner ~ Points,
                   data = F1_2023_DOTD_Results,
                   family = binomial)

summary(DOTD_modelPoints)

##Remove fastest lap from model2

DOTD_modelPosition <- glm(DOTD_Winnner ~ FinishingPosition 
                   + Starting_Position,
                   data = F1_2023_DOTD_Results,
                   family = binomial)

summary(DOTD_modelPosition)

#the model with finishing position and starting position has a lower AIC score
#going with DOTD_modelPosition 
AIC(DOTD_modelPoints)
AIC(DOTD_modelPosition)

summary(DOTD_modelPosition)

##FINDING PROBABILITY##
#The probability of winning DOTD with a given starting and finishing position

#code attributed to: https://sebastiansauer.github.io/convert_logit2prob/
coef(DOTD_modelPosition)

intercept <- -.4711748
betaFinishing <- -.6449827
betaStarting <- .1363462
print(intercept)

#Probability of a driver winning DOTD if started 1st and finished first
logitDOTD <- -.4711748 - .6449827 + (.1363462)
print(logitDOTD)
numerator <- 1
denominator <- 1 + exp(-(-0.9798113))

print(denominator)

1 + exp(-(-0.9798113))

Pr1st <- numerator / denominator
print(Pr1st)

#Pr(start=1st & finish = 1st) = .2729292

1/3.663954

#Probability of a driver winning DOTD if started tenth but finished 1st
logitDOTD10 <- -.4711748 - .6449827 + (10* .1363462)
print(logitDOTD10)
numerator <- 1
denominator10 <- 1 + exp(-(0.2473045))
print(denominator10)

Pr10th <- numerator / denominator10
print(Pr10th)

#Pr(start = 10th & finish = 1st) = .5615129

#You are much more likely to win DOTD if you start from a lower position but finish higher


##MODEL ASSUMPTIONS##

#Independence of Observations - We assume that the races are independent

#Multicollinearity (passes)
install.packages("car")
library(car)
vif(DOTD_model)
vif(DOTD_model2)
vif(DOTD_modelX)
vif(DOTD_modelPosition)
#low VIF = no multicollinearity


"" Note: this code is just practice to see what the output would be like. They are not as good as SPSS output; so, the output generated from SPSS is better and uploaded ""

library(haven)
data <- read_sav("C:/......./saldataassignment1.sav")
head(data)

df <- data[4:43]
head(df)
summary(df)
round(cor(df), 2)

plot(data$sal1, data$sal2, col = 'lightblue')

#regression line
abline(lm(df, data = data))
text(paste("Correlation:", round(cor(df), 2)))

PCA <- PCA()
PCA.fit(df)

lm1 <- lm(df, formula = sal1 ~.)
summary(lm1)


library(leaps)
bestsubset <- regsubsets(sal1 ~., data = data, nbest = 1, nvmax = NULL, force.in = NULL,
                         force.out = NULL, method = "exhaustive")

summarybest <- summary(regsubsets.out)
as.data.frame(summarybest)

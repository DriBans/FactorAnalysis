library(haven)
data <- read_sav("C:/Bansal Data/Drishti Data/UDM/Winter 2022/DATA 5070/Asignacions/Asignacion1/saldataassignment1.sav")
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
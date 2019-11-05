install.packages("nycflights13")
install.packages("dplyr")
library(dplyr)
library(nycflights13)
data(flights)
?flights
str(flights)
View(flights)

flights
head(flights)
OTP <- flights %>% filter(carrier == "DL" | carrier == "AA" | carrier == "WN")
head(OTP)
# Write CSV in R
write.csv(OTP, file = "OTP.csv")
data(airlines)
str(airlines)
airlines
write.csv(airlines, file = "airlines.csv")

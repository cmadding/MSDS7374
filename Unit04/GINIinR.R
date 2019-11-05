#install.packages("reldist")
#Windows install
#install.packages("stringi",type="win.binary")
#Mac install
#install.packages("stringi",type="mac.binary")

library(reldist)

# generate vector (of ticket prices)
x <- c(150, 350, 600, 1300)
# compute Gini coefficient
gini(x)
# generate a vector of weights.
w <- runif(n=length(x))
gini(x,w)

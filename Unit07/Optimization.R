require(lpSolve)

aProfit <- 25 #product A is sold at
bProfit <- 20 #product B is sold at
aUnits <- 20 #A required units to build
bUnits <- 12 #B required units to build
aTime <- 4 #Time to build A
bTime <- 4 #Time to build B

#product A is sold at $25
#product B is sold at $20
objective.in  <- c(aProfit, bProfit)

#A requires 20 units to build
#B requires 12 units to build
#Both of these products require a production time of 4 minutes
const <- matrix(c(aUnits, bUnits, aTime, bTime), nrow=2, byrow=TRUE)

time_constraints <- (8*60)
resource_constraints <- 1800

#creating the equations that we have already defined by setting the rhs and the direction of the constraints
rhs <- c(resource_constraints, time_constraints)
direction  <- c("<=", "<=")

#The final step is to find the optimal solution. The syntax for the lpsolve package is -
#lp(direction , objective, const.mat, const.dir, const.rhs)
optimum <-  lp(direction="max",  objective.in, const, direction,  rhs)
summary(optimum)

#Now we get the optimum values for y1 and y2, i.e the number of product A and product B that should be manufactured
optimum$solution

aProduce <- optimum$solution[1]
bProduce <- optimum$solution[2]

#The maximum sales figure is -
MaxSales <- optimum$objval

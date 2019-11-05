#Information from:
#https://www.kdnuggets.com/2018/05/optimization-using-r.html

require(lpSolve)

# Set up problem: maximize
# 100x1 +60x2 subject to
#   2x1 +  x2 <= 59
#    x1 + 2x2 <= 40

tProfit <- 100 #Table is sold at
cProfit <- 60  #Chair is sold at
tUnits <- 2    #Wood unit to build a table
cUnits <- 1    #Wood unit to build a chair
tTime <- 1     #Time unit to build a table
cTime <- 2     #Time unit to build a chair
time_constraints <- 40 #Total available time units
resource_constraints <- 59 #Total units of wood units

#A table is sold at $100
#A chair is sold at $60
objective.in  <- c(tProfit, cProfit)

const <- matrix(c(tUnits, cUnits, tTime, cTime), nrow=2, byrow=TRUE)

#creating the equations that we have already defined by setting the rhs and the direction of the constraints
rhs <- c(resource_constraints, time_constraints)
#direction is used to set up the <, > or =. They can be combined as well.
direction  <- c("<=", "<=")

#The final step is to find the optimal solution. The syntax for the lpsolve package is:
#lp(direction , objective, const.mat, const.dir, const.rhs)
optimum <-  lp(direction="max", objective.in, const, direction,  rhs)
summary(optimum)

#Now we get the optimum values
#the number of Tables and Chairs that should be manufactured
optimum$solution

#Break down the solution by items
TableProduce <- optimum$solution[1]
ChairProduce <- optimum$solution[2]

#The maximum sales figure
MaxSales <- optimum$objval

cat("We should produce",TableProduce,"tables and",ChairProduce,"chairs. This will net us",MaxSales,"dollars.")
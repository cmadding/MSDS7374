#Information from:
#https://www.kdnuggets.com/2018/05/optimization-using-r.html
#https://www.purplemath.com/modules/linprog3.htm

#install.packages("lpSolve")
require(lpSolve)

#The question ask for the number of cabinets I need to buy, so my variables will stand for that:

#x: number of model X cabinets purchased
#y: number of model Y cabinets purchased
#z: number of model Z cabinets purchased

#Naturally, x > 0, y > 0 and z > 0.
#I have to consider costs and floor space (the "footprint" of each unit),
#while maximizing the storage volume, so costs and floor space will be my constraints,
#while volume will be my optimization equation.

# Set up problem: maximize
#volume: V = 8x + 12y + 15z subject to
#cost: 10x + 20y + 25z <= 140
#space: 6x + 8y + 9z <= 72

xCubic <- 8   #cubic feet of files for x
yCubic <- 12  #cubic feet of files for y
zCubic <- 15  #cubic feet of files for z
xCost <- 10   #Cabinet X costs $10
yCost <- 20   #Cabinet Y costs $20
zCost <- 25   #Cabinet Z costs $25 
xSpace <- 6   #square feet x
ySpace <- 8   #square feet y
zSpace <- 9   #square feet z

Price_constraints <- 140 #Total amount to spend
Space_constraints <- 72  #Total square feet of cabinets

objective.in  <- c(xCubic, yCubic, zCubic)

const <- matrix(c(xCost, yCost, zCost, xSpace, ySpace, zSpace), nrow=2, byrow=TRUE)
const
#creating the equations that we have already defined by setting the rhs and the direction of the constraints
rhs <- c(Price_constraints, Space_constraints)
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
xCabinet <- optimum$solution[1]
yCabinet <- optimum$solution[2]
zCabinet <- optimum$solution[3]

#The maximum sales figure
CubicFeet <- optimum$objval

cat("We should buy",xCabinet,"x cabinets",yCabinet,"y cabinets and",zCabinet,"z cabinets We will obtain a maximal volume of",CubicFeet,"cubic feet.")
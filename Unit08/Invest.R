# Example Linear programming Problem 2
# https://github.com/njpayne/riemann/blob/master/Financial%20Portfolio%20-%20Linear%20Programming%20R.R
# Created by: Chad Madding
# October 16, 2019

#The business problem:
#You have $12,000 to invest, and three different funds from which to choose.
#The municipal bond fund has a 7% return,
#the local bank's CDs have an 8% return,
#and the high-risk account has an expected (hoped-for) 12% return.
#To minimize risk, you decide not to invest any more than $2,000 in the high-risk account.
#For tax reasons, you need to invest at least three times as much in the municipal bonds as in the bank CDs.
#Assuming the year-end yields are as expected, what are the optimal investment amounts?

# The following are the business constraints for this problem:
# 1) Total amount that you have available to invest is equal to 12000
# 2) Not to invest any more than 2000 in the high-risk account
# 3) invest at least three times as much in the municipal bonds as in the bank CDs
# Note that the return on investment proposed for each investment is:
# 7%, 8%, 12%

# The mathematical problem:
# maximize  P = 0.07muni + 0.08cd + 0.12hr
# subject to (constraints noted above)
# Default lower bounds of zero on all variables are represented by: x >= 0, y >= 0

# We use the lpsolveAPI package here:
# install.packages("lpSolveAPI") # Install the lpSolveAPI package

library("lpSolveAPI") # Load the lpSolveAPI package

# Make a matrix to represent our problem
lprec <- make.lp(0, 3) # This allows us to create an empty model which has 3 variables
lp.control(lprec, sense="max") # This is a maximization problem
set.objfn(lprec, c(0.07, 0.08, 0.12)) # Set the coefficients on the objective function
add.constraint(lprec, c(1, 1, 1), "=", 12000) #sum of 12,000
add.constraint(lprec, c(1, 0, 0), ">=", 0) #muni >= 0
add.constraint(lprec, c(0, 1, 0), ">=", 0) #cd >= 0
add.constraint(lprec, c(0, 0, 1), ">=", 0) #high risk >= 0
#The original constraint on High Risk
add.constraint(lprec, c(0, 0, 1), "<=", 2000)# high risk <= 2000
#For the second part of the question
#add.constraint(lprec, c(0, 0, 1), "<=", 4000)# high risk 1/3 of total
add.constraint(lprec, c(1, -3, 0), ">=", 0)#3 times as muni

lprec # Display the final lpsolve matrix

solve(lprec) # solve

get.objective(lprec) # Get maximum profit

get.variables(lprec) # Get the solution

cat("We should invest",get.variables(lprec)[1],"dollars in the municipal bond fund,",get.variables(lprec)[2],'dollars in the local banks CDs and',get.variables(lprec)[3],"dollars in the high-risk account.")
cat("We should get an optimal return of",get.objective(lprec),"dollars.")
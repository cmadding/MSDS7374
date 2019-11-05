# Set up problem: maximize
# 100x1 +60x2 subject to
#   2x1 +  x2 <= 59
#    x1 + 2x2 <= 40
#
f.obj <- c(100, 60)
f.con <- matrix (c(2,1,1,2), nrow=2, byrow=TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(59, 40)
#
# Now run.
#
lp ("max", f.obj, f.con, f.dir, f.rhs)
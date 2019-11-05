library(ggplot2)
# intersection points
myint <- data.frame(x=c(0,0,2.25),y=c(8,5,5))


# plot constraint boundary lines
ggplot(data.frame(x=c(-5,10)),aes(x)) + 
  stat_function(fun=function(x) -4/3*x+8, geom="line", aes(col='y=-4/3x+8')) +
  stat_function(fun=function(x) -4*x + 20, geom="line", aes(col='y=-4x+20')) +
  stat_function(fun=function(x)5, geom="line", aes(col='y=5')) + 
  geom_vline(xintercept=0, aes(col= 'x=0')) + 
  geom_hline(yintercept= 0, aes(col='y=0')) + 
  theme_bw() + 
  labs(title = 'Graphical Analysis') + 
  geom_point(data=myint, aes(x,y)) + 
  annotate('text', x = 0, y = 9.2, label="(0, 8)", size=3 ) +
  annotate('text', x = 0, y = 3.8, label="(0, 5)", size=3 ) + 
  annotate('text', x = 2.25, y = 3.8, label="(9/4, 5)", size=3 )

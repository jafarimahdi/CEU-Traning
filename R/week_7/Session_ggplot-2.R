library(ggplot2)


View(mtcars) # data-set will be use 

ggplot(mtcars, aes(x= mpg, y=hp))+  # syntax 
  geom_point()                      # type of the chart


# giving color to different type of data
ggplot(mtcars, aes(x=mpg, y=hp, color=as.factor(am)))+  # as.factor() to make specific choice not average or middle point
  geom_point()
  

# ------  Add shape to the chart by type of data 
ggplot(mtcars, aes(x=mpg, y=hp, color=as.factor(am), shape = as.factor(gear)))+
  geom_point()+
  labs(x ="miles per gallon", y = "Hourse power", color="Automata", 
       title = "Mtcars", subtitle ="data")+                 # we can add more clear data in the chart as title & subtitle 
  theme_bw()                                                # change the background color for chart 









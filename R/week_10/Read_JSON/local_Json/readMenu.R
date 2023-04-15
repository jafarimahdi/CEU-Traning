library(jsonlite)


# 1- read the menu.json file 
t <- fromJSON('menu.json')
t$menu$popup$menuitem$value[3]
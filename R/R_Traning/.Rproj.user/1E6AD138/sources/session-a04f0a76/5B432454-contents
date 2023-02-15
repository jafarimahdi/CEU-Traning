# dplyr library help us for data Transformation 

library(dplyr)

# they way we filtered before for data 
mtcars[mtcars$hp>200,]

# --------- filter( ) in dplyr library 
mtcars %>%
  filter(hp>200)


# Task-1 filter the cars,where: hp less than 200 gsec bigger than 15 and gear is equal 3 
mtcars %>%
  filter(hp<200 & qsec>15 & gear == 3)


# --------arrange() or arrange(- , -) it help with ordering the filter and 
#show in order the data from biggest or smallest 

mtcars %>%
  filter(hp<200 & qsec>15 & gear == 3) %>%
  arrange(-hp, -qsec)


# -------- Mutate() for creating new column from variable into the data

# in simple way add new column named power
mtcars$power <- mtcars$hp * mtcars$cyl

# with help of "dpylr" library for making new column called power2
mtcars %>%
  mutate(power2 = hp*cyl)


# -----------------------------------
#.how to show the data in work space 
# 1- in terminal View(iris)
# 2- iris <- iris
# ----------------------------------

# task-2: first filter Sepal.length bigger than 5
# calculate a new column called sum_length 
# order the sum_length

iris%>%
  filter(Sepal.Length > 5) %>%
  mutate(sum_length = (Sepal.Length + Sepal.Width + Petal.Length + Petal.Width)/4) %>% 
  arrange(-sum_length)

  
  # star wars data-set 
df <- starwars  

# summaries() is a function for calculating the data from columns 
#--------- n() is spacial function in R to get the number of rows 
# "na.rm = T" is R method to make ability for showing the number in case we have one number in average() method

df %>%
  summarise(number_of_rows = n(),average_height = mean(height, na.rm = T)) 


#----unique()  get the unique data that's in column in data-set
# old way
unique(df$species)

# with help of "dplyr" library 
df %>%
  summarise(unique(species))

# -- task-3:  question missed ? :)

df%>%
  group_by(species)%>%
  summarise(number_of_rows = n()) %>%
  arrange(-number_of_rows)


# task-4 : calculating the average of height by species and order from the biggest 

df %>%
  group_by(species)%>%
  summarise(show_avrage = mean(height, na.rm = T))%>%
  arrange(-show_avrage) %>% 
  head(1) # it show the biggest one 


#task-5: calculate the max mass for every group where the height is grater 170 cm and return the list max value 

df %>% 
  filter(height > 170) %>% 
  group_by(species) %>% 
  summarise(max_value = max(mass)) %>% 
  arrange(-max_value)
  









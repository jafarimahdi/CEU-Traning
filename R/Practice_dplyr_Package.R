 # install package "dplyr", "flexplot"
require(tidyverse)
library(dplyr) # really important to run this line always, due not working well "shet IDE"

#require(flexplot) for being able to use 'avengers' data-set
library(flexplot)


#filtering in old way 
laptop<-854; books<-321; clothes<-228
expenses <-c(laptop, books, clothes)
items <-c("laptop","books","clothes")
expenses <- data.frame(item<-items, cost<-expenses)
laptop_row<-expenses$item == "laptop"
expenses[laptop_row,]

#------- filter() in the "dplyr" package
filter(expenses, item =="laptop")

# practice in avenger data-set
filter(avengers, iq>130, injuries > 3, damage.resistance > 1.9)
# define as new column/variable to data-set
normal_people <- filter(avengers, superpower == "yes")
head(normal_people)
# more complex filtering 
filter(avengers, shots.taken>400 | minutes.fighting>60) # | means OR

filter(avengers, shots.taken>100 & minutes.fighting>60) # & means AND

filter(avengers, shots.taken>=200 & superpower!="yes") # != 

# ----filter() + %in%  find every instance that meets multiple conditions 
# reUsing expenses data-set we created in line 9 to 15
filter(expenses, item %in% c('laptop',"clothes"))


# ---------------------------------

# Arranging and sorting the data-set: arrange( )

sorted_injuries <- arrange(avengers, injuries)
head(sorted_injuries)
#----- arrange() + desc(): sort from the big to smallest
sorted_injuries_desc <- arrange(avengers, desc(injuries))
head(sorted_injuries_desc)

# sort on multiple column 
sorted_injuries_multiColumn <- arrange(avengers, desc(injuries), north_south)
head(sorted_injuries_multiColumn, n=20)

# --------------------------------

# Selecting Data:  select()

# select "iq, agility, speed" from avengers "data-set"
new_avengers <- select(avengers, iq, agility, speed)
head(new_avengers)




# read a CSV file 
df <- read.csv('http://bit.ly/CEU-R-heights')

# check the structures
str(df)

# get the numbers of row 
nrow(df)

# get the amount of the rows
length(df)

# get the amount of row and column with dim()
dim(df)

# get the amount of the row with dim( )
dim(df)[1]

# get the amount of the column with dim()
dim(df)[2]

# get the row names
rownames(df)

# get the column names
colnames(df)

# get the column with index
colnames(df)[5]


# mtCars is a data-set, which continue a table of the cars name and details 
cars <- mtcars

# get the name of the rows in mtcars
rownames(cars)

# View methods can show the data 
View(cars) 


# ------- summery()
summary(cars)



# add new column name to the cars data
cars$name <-rownames(cars)


# add new row to data
number_of_row <- nrow(cars)

1:nrow(cars)

rownames(cars) <- 1:nrow(cars)
df$heightIn

# change the data in columns by new value and overwrite 
df$heightIn <- df$heightIn * 2.5

# change the data in one of the column: $weightLb 
df$weightLb <- round(df$weightLb * 0.45, 0)


# Rename one column by index:  hightLb to height_cm
colnames(df)[4] <- 'Height_cm'

# Rename all the column names to the new names
colnames(df) <- c("col-1","col-2","col-3","col-4","col-5")

# second way to give new name to all the columns
colnames(df) <- paste0('col_', 1:ncol(df))


#---------------------------
# check the min horse power in the mtcars data-set
min(mtcars$hp)

# check the max horse power in the mtcars data-set
max(mtcars$hp)

# check the average of the horse power of the mtcars data-set
mean(min(mtcars$hp))


# show all of the data in one line 
paste0("mtcars has ", ncol(mtcars)," column lines and ","the min in the list is: ",min(mtcars), " and the max in the list is: ",
       max(mtcars$hp)," and the avreage number in list is: ", round(mean(mtcars$hp),0))




# ---------------------- filtering the data with index in ROW & COLUMN 

# get the data in row that's equal to 8 
mtcars[mtcars$cyl == 8,]

# get the amount of the cars has hp more then 200
nrow(mtcars[mtcars$hp > 200,])
# second way to get amount of the cars has hp more then 200
sum(mtcars$hp > 200)

# get the average the sum of the all the cars has more than 200 hp
mean(mtcars[mtcars$hp > 200, "mpg"])


# find the minimum element in the "qsec" column, mtcars table, 
#  those have less then 200 "hp" in all the table
mtcars 
min(mtcars[mtcars$hp < 200, "qsec"])






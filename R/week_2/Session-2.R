
# if( ), else( ),  for loop 

a <- 10
if(a > 5){
  print("a is bigger than 5")
}else{
  print("a is less than 5")
}


typeof(a) # it return the type of the data 
if(typeof(a) == "double"){
  print("a it's double")
}else{
  print("a it's Integer ")
}


b <- 45
if(b < 20){
  print("it's small number")
}else if(b < 40){
  print("it's medium number")
}else if(b < 50){
  print("big number")
}else(
  print("it's a large number ")
)

# data-set in R
mtcars    # it's a data-set of the table that has list of the cars, name and details

df <- mtcars

str(df) # structure of the data 

nrow(df) # show the amount of the row in the df table 

if(nrow(df) > 40){
  print("df has more than 40 rows")
}else{
  print("the amount of the rows in df are less than 40")
}


# -------- for loop 

for (i in 1:10) {
  print(i)
}

for (letter in letters) {
  print(letter)
}


# Task: print out of the length of the letters by odd numbers
lengthOfTheLetters <- length(letters)
seq(1,lengthOfTheLetters, 2)


# Task: print out of the letters an index 
for(i in seq(1,length(letters),2)){
 print(i)
  print(letters[i])
}








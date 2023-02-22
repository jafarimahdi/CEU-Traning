
#.   else if( )  &  ifelse( )


# Task: write a function to show the number if it's odd or even 

a <- 10
checkNumber <-function(num){
  if((num %% 2) == 0){
    print("even")
  }else{
    print("odd")
  }
}
checkNumber(a)

# use the previews function to check the numbers in vector 1:20 is Odd or Even 
for (i in 1:20) {
  print(paste(i,"is a",checkNumber(i)))
}


# --------------------- if() - else()

# Task-2 : write a function to multiple two input numbers
multNumbers <-function(num1, num2){
  if(is.numeric(num1) && is.numeric(num2)) {
    return(num1*num2)
  }else{
    return("it's not a number")
  }
}
multNumbers(3, "hello")
multNumbers(3, 5)



# --------------- else if( )
# Task-3: Make a function that check the body BMI

checkBmi<-function(height,weight){
  height <- height
  weight <- weight

  height <- height / 100
  bmiBody <- (weight/(height^2))

  if(bmiBody<18.5){
    return(paste(bmiBody, "falls within the underweight range"))
  }else if(bmiBody < 25){
    return(paste(bmiBody,"falls within the healthy weight range"))
  }else if(bmiBody < 30){
    return(paste(bmiBody," falls within the overweight range"))
  }else{
   return(paste(bmiBody," falls within the obesity range"))
  }
}

checkBmi(130, 50)
checkBmi(110, 30)
checkBmi(180, 60)
checkBmi(190, 75)



# ---------- ifelse() 
# use ifelse( ) method to check the number between 1:100 is odd or even 

ifelse(1:100 %% 2 == 0, yes="even", no="odd")   #return odd or even












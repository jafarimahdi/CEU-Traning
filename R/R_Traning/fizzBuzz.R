# write a function named fizBuzz to check the number show divide to the numbers
# and show: 3=fizz, 5=buzz, 15=fizBuz

fizzBuzz <- function(number){
  
  if(number %% 15 == 0 ){
    return('fizzBuzz')
  }else if(number %% 5 == 0){
    return('buzz')
  }else if(number %% 3 == 0){
    return('fizz')
  }else{
    return(number)
  }
}

for(i in 0:100){
  print(fizzBuzz(i))
}
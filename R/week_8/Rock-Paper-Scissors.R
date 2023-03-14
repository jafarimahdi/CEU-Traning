 # Rock, Paper, Scissors game 



winner <-function(){
your_Score <- 0
machine_Score <- 0
  
  while (your_Score < 2 || machine_Score < 2) {
    
    userInput <-  as.integer(readline("choice a number \nrock= 1, \npaper=2, \nscissors=3 \nwhat is your shot?"))
    
    thirdUser <- sample(1:3, 1)          # sample() method return us the random element, the first element is vector and 
                                         # the second is how many element you want to get back
    result <- ""
    
    if(userInput == 1 && thirdUser == 1 ){result = "draw"}
    if(userInput == 1 && thirdUser == 2 ){result ="You lose"}
    if(userInput == 1 && thirdUser == 3){result ="You win"} 
    if(userInput == 2 && thirdUser == 1){ result ="You win"}
    if(userInput == 2 && thirdUser == 2){ result = "draw"}
    if(userInput == 2 && thirdUser == 3){ result ="You lose"}
    if(userInput == 3 && thirdUser == 1){ result ="You lose"}
    if(userInput == 3 && thirdUser == 2){ result ="You win"}
    if(userInput == 3 && thirdUser == 3){ result ="draw"}
  else{
      result ="plase Enter correct answer to the concil "
    }
    
    if(result == "You win") {your_Score = your_Score +1}
    if(result == "You lose"){ machine_Score = machine_Score +1}
  
    print(result)
    cat("your score:", your_Score, " machine Score:", machine_Score, " \n")
    
    if(your_Score == 3){
      print("you won the 3 games")
      break
    }else if(machine_Score == 3){
      print("you lost bro")
      break
    }}
}


winner()


#list <- c("rock","paper", "scissors")
#cat("your choice was: ", list[userInput] ,"\nmachine choice was: ", list[thirdUser],"\nand you: " , result)


 









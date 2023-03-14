
# Guess game: user have to find out in 6 time, the computer hold as random number from 1 - 100 and each time computer show the input need
# to be higher or lower 


guesst_me <-function(){
  thirdUser <- sample(1:100, 1)         
  your_Score <- 5
  
  while (your_Score >= 0) {
    
    userInput <-  as.integer(readline("Enter your Number? : "))
    result <- ""
    
    if(userInput == thirdUser ){result ="Yes, You found it "}
    else if(userInput > thirdUser){result ="Your Number is highr "}
    else if(userInput < thirdUser){result ="Your Number is lower "} 
    else{ result = "pleae Enter the correct input "}
    
    cat(result, "and you have ", your_Score, " Gueses left ")
    
    your_Score <- your_Score -1
  }
}


print(guesst_me())

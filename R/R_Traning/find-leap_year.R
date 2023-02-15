
# write the function that's show the Leaper year from 2000 to 2401

findLeapYear <- function(year){
  
  if(year %% 4 == 0){
    if(year %% 100 == 0){
      if(year %% 400 == 0){
        print(paste(year," is leap"))
      }else{
        print(paste(year," is not leap"))
      }
    }else{
      print(paste(year," is leap"))
    }
  }else{
    print(paste(year,"is not the leap year"))
  }
}

for(i in 2000:2401){
  print(i)
  findLeapirYear(i)
}


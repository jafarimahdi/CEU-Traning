2 + 3 
2 * 3 
2 ^ 5 

# getwd() : check the working directory
# setwd() : set the work directory 

print("Hello R")
print(pi * 5)


print(letters) # get out the letters alphabet 
str(letters) # convert to string

letters[3] # get by index

letters
letters[4] # return the 4 letter 

1:200.  # return all the number between 1 to 200 


first_Hundrad <- 1:100   # define the value to the vector contine number 1 - 100
print(first_Hundrad)

1:20 -> secound_Hundrad #
print(secound_Hundrad)
Mahdi -> "hello mahdi"
print(Mahdi)

"hello mohamad"<-mamad
print(mamad)



first_element<- 1:10
print(first_element)

# square rout for the numbers
seq(1, 100, 2)
seq(1,5,0.1)

# check the uniform  
numbers <- runif(1000)
print(numbers)


# hist: for showing the graph and visitation 
hist(runif(100))


# seq() is for more graph 
x <-1:20
sin(x) # sin() is a function


# --- plot 
plot(x,sin(x))
plot(x,sin(x), type = 'l') 
# 'l' is one the package for the graph in LINE


# graph with Vector
height<-c(72,64,57,23)
weightt<-c(180,165,172,45)
plot(height, weightt, 
     main="heights and weigths of students",
     xlab = "Height",
     ylab = "weightt")


# Task: Calculate the BMI
h<- 180
w<-75
he<-h/100
bmi<-w/(he^2)

# paste() & print()
paste('your body mass index is:',bmi)
print('your body mass index is:',bmi)



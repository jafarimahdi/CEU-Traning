# Create a  Vector

c("hearts", "spades", "diamonds", "diamonds", "spades")

Drwan_suits <- c("hears", "spades", "diamonds", "diamonds", "spades")
is.vector(Drwan_suits)

# Vector element with Key and Value 

# option-1 Combining 2 Vectors 
remain <- c(11,12, 11, 13)
suits <- c("spades","hearts","diamonds", "clubs")

names(remain) <- suits # use names() method
print(remain)

# option-2 defined with Key and Value
remain_2 <- c(spades = 11, hearts = 12, diamonds= 11, clubs = 13)  # string key with out ""
# or
remain_3 <- c("spades"= 11, "hearts" = 12, "diamonds" = 11, "clubs"= 13)


# single Vector 
my_apples <- 5
my_orange <- "six"

# check the type
is.vector(my_apples) 
is.vector(my_orange)

#check the length 
length(my_apples)
length(my_orange)

#Coercion for vectors
drawn_ranks <- c(7, 4, "A", 10, "k", 3, 2, "Q")  
print(drawn_ranks) # it will convert to char automatically



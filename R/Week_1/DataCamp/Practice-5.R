remain <- c(spades =11, hearts = 12, diamonds = 11, clubs =13)


# -----    take element at index 1
remain[1]  #  spades
           #.   11
remain[3]     #  diamonds 
              #    11

# -----   using name space 
remain["spades"] # spades 
                 #. 11
remain["diamonds"]    # diamonds
                      #.  11

# -----  subset multiple elements

remain_black <- remain[c(1,4)]
remain_black  # spades   clubs 
              #  11.      13
 # change the order in selecting the vector 
remain_black <- remain[c(4,1)]
remain_black  # clubs.  spades
              #  13      11

# using the name in selecting form vector
remain[c("clubs", "spades")]

remain  # clubs  spades
        #  13.     11

# -------- subset all but some

remain[-1]   # it will select all the elements except the index 1
#  heats  diamonds  clubs
#.  12.     11.      13

remain[-c(1,2)]
# diamonds   clubs
#. 11.        13


# remain[-" spades "]
# ERROR in -"spades" : invalid argument to unary operator 

# --------- subset using logical vector

remain[c(FALSE,TRUE, FALSE,TRUE)]
#  hearts   clubs 
#.  12.       13

selection_vector <- c(FALSE,TRUE,FALSE,TRUE)
remain[selection_vector]
#   hearts.    clubs
#.   12          13


remain[c(TRUE, FALSE)] 
# spades   diamonds     R recycles c (T, F) to c(T, F, T, F)
#  11.       11 

remain[c(TRUE,FALSE,TRUE,FALSE)]
#. spades    diamonds
#   11.        11

remain[c(TRUE, FALSE, TRUE)]
#  spades   diamonds.  clubs
#   11.      11.         13


remain[c(TRUE, FALSE, TRUE, TRUE)]
# spades  diamonds.  clubs
#  11.      11.       13

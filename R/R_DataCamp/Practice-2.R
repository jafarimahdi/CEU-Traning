# data type in R 

#Logic
TRUE

class(TRUE)

FALSE
class(FALSE)

# Numeric
2
2.5
2L

# get the type of file
class(2)
class(2.5)
class(2L)

# check the type 
is.numeric(2)
is.numeric(2L)
is.integer(2)
is.integer(2L)

# Character

"Just start to Learn Data Scince"
class("just start to learn Data Scince")

# Other type of data 
  
  # double: higher precision
  # complex: complex numbers
  # raw: store raw bytes 

# Converting the type of the data

as.numeric(TRUE)
as.numeric(FALSE)

as.character(4)
as.numeric("4.5")

as.integer("4.5")

as.numeric("hello").  # error in data type for converting the char to numeric




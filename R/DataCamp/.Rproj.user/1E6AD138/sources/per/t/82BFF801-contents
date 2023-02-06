# subsetting Matrices 

m <- matrix(sample(1:15, 12), nrow = 3)

m
#     [,1] [,2] [,3] [,4]
#[1,]    6   15   14    1
#[2,]   11   10    8   12
#[3,]    7    4    3   13


# ------- selection in matrix 
m[1,3]
#[1] 14

m[3,2]
#[1] 4


# ------- subset/ select column and row 

m[3,]         # select row 3
# [1]  7  4  3 13

m[,3]         # select column 3
# [1] 14  8  3

# with out comma it return one element and count from column to count by index
m[4]
# [1] 15

# -------- subset/select  multiple elements 
m[2, c(2,3)].       # row= 2 + column = 2 and 3
#[1] 10  8

m[c(1,2), c(2,3)].    # row= 1 and 2 + column = 2 and 3
#      [,1] [,2]
#[1,]   15   14
#[2,]   10    8

# ----------- subset/ select by name use methods:  rownames(), colnames()

rownames(m) <- c("r1","r2", "r3")
colnames(m) <- c("a", "b","c","d")

m
#     a  b  c  d
# r1  6 15 14  1
# r2 11 10  8 12
# r3  7  4  3 13

m["r2","c"]
# [1] 8

# we can use combination of the names and index to select elements 
m[2,"c"]
# [1] 8

m[3, c("c","d")]
#  c  d 
#  3 13 

# ----------------- subset/select with logical vector 
m[c(FALSE, FALSE, TRUE),
  c(FALSE, FALSE, TRUE, TRUE)]
#  c  d 
#  3 13

m[c(FALSE, FALSE, TRUE),
  c(FALSE, TRUE)]
#  b  d 
#  4 13 

m[c(FALSE, FALSE, TRUE), 
  c(FALSE, TRUE, FALSE, TRUE)]
# b  d 
# 4 13 







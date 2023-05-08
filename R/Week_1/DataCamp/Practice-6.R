#  -----  Matrix. -------

#  ------ Create a matrix 

matrix(1:6, nrow =2)
#       [,1] [,2]  [,3]
# [1,]   1    3     5
# [2,].  2    4     6

matrix(1:6,ncol=3)
#       [,1] [,2] [,3]
# [1,].  1.   3.    5
# [2,]   2.   4.    6

matrix(1:6, nrow = 2, byrow = TRUE)
#       [,1] [,2] [,3]
# [1,].  1    2     3
# [2,]   4    5     6

#  ------- Create a matrix: recycling

matrix(1:3, nrow = 2, ncol=3)
#       [,1] [,2] [,3]
# [1,].  1    3     2
# [2,]   2    1     3


matrix(1:4, nrow = 2, ncol = 3)
#       [,1] [,2] [,3]
# [1,].  1    3     2
# [2,]   2    1     3
# Warning message:
#  In matrix(1:4, nrow = 2, ncol = 3) :
#  data length [4] is not a sub-multiple or multiple of the number of columns [3]


#   --------  rbind(), cbind()
cbind(1:3, 1:3)
#       [,1] [,2] 
# [1,].  1    1     
# [2,]   2    2 
# [3,].  3.   3


rbind(1:3, 1:3)
#       [,1] [,2] [,3]
# [1,]   1    2     3
# [2,]   1    2     3


m <- matrix(1:6, byrow=TRUE, nrow =2)

rbind(m, 7:9)
#       [,1] [,2] [,3]
# [1,]   1    2     3
# [2,]   4    5     6
# [3,].  7.   8.    9

cbind(m, c(10, 11))
#       [,1] [,2] [,3] [,4]
# [1,]    1    2    3   10
# [2,]    4    5    6   11


#  ----------- Naming a matrix rownames(), colnames()
m <- matrix(1:6, byrow = TRUE, nrow=2)
rownames(m) <- c("row1", "row2")

m
#.     [,1] [,2] [,3]
#row1    1    2    3
#row2    4    5    6

colnames(m) <- c("col1", "col2", "col3")
m
#.     col1 col2 col3
#row1    1    2    3
#row2    4    5    6

s <- matrix(1:6, byrow = TRUE, nrow=2,
            dimnames = list(c ("row1","row2"),
                            c("col1","col2","col3")))
s
#     col1 col2 col3
#row1    1    2    3
#row2    4    5    6

# ----------- Coercion
num <- matrix(1:8,ncol =2)
char <- matrix(LETTERS[1:6],nrow=4,ncol=3)

cbind(num,char)
#     [,1] [,2] [,3] [,4] [,5]
#[1,] "1"  "5"  "A"  "E"  "C" 
#[2,] "2"  "6"  "B"  "F"  "D" 
#[3,] "3"  "7"  "C"  "A"  "E" 
#[4,] "4"  "8"  "D"  "B"  "F"


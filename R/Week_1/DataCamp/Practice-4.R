# Vector Calculus 

my_apples <- 5
my_oranges <- 6
my_apples + my_oranges

# Computations are performed element-wise
earning <- c(50, 100, 30)

earning * 3      # [1] 150 300  90
earning / 10     # [1]  5 10  3
earning - 20     # [1] 30 80 10
earning + 100    # [1] 150 200 130
earning ^2

# Element Wise 
expenses <- c(30, 40, 80)
earning - expenses      # [1]  20  60 -50

earning + c(10, 20, 30) # [1]  60 120  60
earning * c(1,2,3)      # [1]  50 200  90
earning / c(1,2,3)      # [1] 50 50 10

# ---   Sum() and > in Vectors 
earnings <- c(50, 100, 30)
expenses <- c(30, 40, 80)

bank <- earnings - expenses
print(bank)   # 20 60 -50

sum(bank)    # 30

earnings > expenses  # TRUE  TRUE FALSE

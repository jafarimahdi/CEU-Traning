from art import logo

def add(n1, n2):
  return n1 + n2

def substract(n1, n2):
  return n1 - n2

def divide(n1, n2):
  return n1 / n2

def multiple(n1, n2):
  return n1 * n2

dict_operater ={
  '+':add,
  '-':substract,
  '/':divide,
  '*':multiple
}

def calculate(): # make recursion 
  print(logo)
  
  num1 = float(input('add your first number: '))
  keep_go= True
  
  while keep_go:
    
    for operater in dict_operater:
      print(operater)
    type_of_operation = input('what would you like to do? ')
    num2 = float(input('add your next number: '))
  
    task_function = dict_operater[type_of_operation]
    result = task_function(num1,num2)
    print(f"{num1} {type_of_operation} {num2} = {result}")
  
    more_cal = input("would you like to continue? Y or N: ")
  
    if more_cal == 'y':
      num1 = result
    else:
      keep_go = False
      calculate() # call for recursion and next round of calculation from begining 
  
calculate()

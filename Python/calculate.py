
num2 = int(input('add your secound number: '))

# ----- call the function as value in dictionary by checking the symbol
task_function = dict_operater[type_of_operation]
result = task_function(num1,num2)
print(f"{num1} {type_of_operation} {num2} = {result}")



# -----

more_cal = input("would you like to continue? Y or N")

if more_cal == 'y':
  keep_going = True
  while keep_going:
    
    for operater in dict_operater:
      print(operater)
    type_of_operation = input('what would you like to do? ')
    new_num = int(input("please add a new number: "))
    result_2 = task_function(result,new_num)
    print(f"{result} {type_of_operation} {new_num} = {result_2}")
else:
  keep_going = False

  
print(f"{result} {type_of_operation} {new_num} = {result_2}")
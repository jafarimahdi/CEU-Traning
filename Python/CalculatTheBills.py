print("welcome to the Tip calculator");

amountOfBill = float(input("what was the total bills? "))
# print (userInput);

# get the amount of devision should be
splitOnPeople = int(input("How many people to split the bill? "))

# chek the percentage of the discount 
tip = int(input("what percentage tip would you like to give? 10, 12, 1 : "))

amount_to_pay= amountOfBill*(1+(tip/100))
print(amount_to_pay)

pay_per_person = (amount_to_pay/splitOnPeople)
print(f'each person should pay: {pay_per_person} $')

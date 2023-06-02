from menu import MENU

coffee_list = list(MENU.keys())  # convert the Dictionary to the list
print(coffee_list)

for item in coffee_list:
    print(f" {item} cost:  ${MENU[item]['cost']}")

user_input = input('what would you like to have? ')


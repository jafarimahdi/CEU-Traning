from data import MENU, resource

profit = 0.0

coffee_list = list(MENU.keys())  # convert the Dictionary to the list by keys
# print(coffee_list)
print('our Menu: ')
for item in coffee_list:
    print(f" {item} ${MENU[item]['cost']}")


def menu_list():
    user_input = int(input('please choice a number!\n Espresso: 1, Latte: 2, Cappuccino: 3 ?: '))

    if user_input == 1:
        # run the espresso function
        print('1')
    elif user_input == 2:
        # run the latte function
        print('2')
    elif user_input == 3:
        # run the cappuccino function
        print('3')
    else:
        print("please choice from our Menu only: 1, 2, 3 !! ")


def payment():
    print('please add your coin')
    quarters = int(input('How many quarters? '))
    dimes = int(input('How many dimes? '))
    nickles = int(input('How many nickles? '))
    pennies = int(input('How many pennies? '))

    total_coin = quarters * 0.25
    total_coin += dimes * 0.10
    total_coin += nickles * 0.05
    total_coin += pennies * 0.01
    print(total_coin)

    global profit
    profit += total_coin




def espresso():
    if profit >= MENU['espresso']['cost']:
        if MENU['espresso']["ingredients"]['water'] <= resource['water'] and MENU['espresso']["ingredients"]['coffee'] <= resource['coffee']:
            resource['water'] -= 50
            resource['coffee'] -= 18
            print('Enjoy your espresso :) ')
        else:
            print(f"coffee: {resource['coffee']}, water: {resource['water']} and it's not enough for your order!")
            # break
    else:
        print('please add more coin for this order')
        # add more coin

# ------------ Run invoirmant


menu_list()
payment()
espresso()
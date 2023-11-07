from data import MENU, resources

profit = 0.0

coffee_list = list(MENU.keys())  # convert the Dictionary to the list by keys
print('our Menu: ')
for item in coffee_list:
    print(f" {item} ${MENU[item]['cost']}")


def menu_list():
    user_input = int(input('please choice a number!\n Espresso: 1, Latte: 2, Cappuccino: 3 ?: '))

    if user_input == 1:
        coffee('Espresso')
        print('1')
    elif user_input == 2:
        coffee('Latte')
        print('2')
    elif user_input == 3:
        coffee('Cappuccino')
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


def coffee(coffee_type):

    if profit >= MENU[str(coffee_type)]['cost']:
        if MENU[coffee_type]["ingredients"]['water'] <= resources['water'] and MENU[coffee_type]["ingredients"]['coffee'] <= resources['coffee']:
            resources['water'] -= MENU[coffee_type]["ingredients"]['water']
            resources['coffee'] -= MENU[coffee_type]["ingredients"]['coffee']
            resources['milk'] -= MENU[coffee_type]['ingredients']['milk']
            print('Enjoy your coffee :) ')
        else:
            print(f"coffee: {resources['coffee']}, water: {resources['water']} and it's not enough for your order!")
            # break
    else:
        print('please add more coin for this order')

# ------------ Run inviremant

payment()
menu_list()

# coffee(input('please add your coffee type? '))
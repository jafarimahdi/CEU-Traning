
class CoffeeMachine:
    def __init__(self ):
        self.resources = {
            "water": 2000,
            "milk": 2000,
            "coffee": 1000,
        }
        self.profit = 0
        self.coffee_provide = 0

        self.COFFEE_WATER =50
        self.COFFEE_COFFEE = 50
        self.COFFEE_MILK = 50
        self.COFFEE_COST = 40

    def report(self):
        print(self.resources)


    def create_coffee(self):
        self.resources['water'] -= self.COFFEE_WATER
        self.resources['milk'] -= self.COFFEE_MILK
        self.resources['coffee'] -= self.COFFEE_COFFEE

    def add_profit(self, cost):
        self.profit += cost
        print(f'you provide a new coffee and now you have {self.profit}$ Profit!')

    def check_recourses(self):
        if self.COFFEE_COFFEE <= self.resources['coffee'] and self.COFFEE_MILK <= self.resources['milk'] and self.COFFEE_WATER <= self.resources['water']:
            print('you have enough resources')
            return True
        else:
            print('machine is out of the resources ')
            return False

    def count_coffee(self):
        self.coffee_provide += 1
        print(self.coffee_provide)

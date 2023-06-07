from Coffee_machine import CoffeeMachine


machine_1 = CoffeeMachine()

while machine_1.check_recourses():
    machine_1.create_coffee()
    machine_1.add_profit(100)
    machine_1.report()
    machine_1.count_coffee()
    print('------------------')


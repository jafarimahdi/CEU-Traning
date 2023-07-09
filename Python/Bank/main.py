from bankAccount import BankAccount

firstCustomer = BankAccount('Misi')

firstCustomer.deposit(100)
firstCustomer.getBalance()
print('------')

secoundCustomer = BankAccount('Mahdi')
secoundCustomer.deposit(500)
secoundCustomer.getBalance()
print('-----------')
# ---------------------------------

# misi send to mahdi 50$
# 1- widthraw 50$ from misi
# 2- add that to the mahdi

def transformation(sender, reciver, value):
    if (sender.balance - value) < (sender.limit_recive * -1):
        print(f"dear {sender.owner} unfortunately you don't have enough money ")
        sender.trnsaction_log.append(f"the {sender.owner} tried to send {value} to {reciver.owner}, but it it had only {sender.balance}")
    else:
        sender.withraw(value)
        sender.trnsaction_log.append(f"the {sender.owner} send {value} $ to {reciver.owner}, and the sender balance is:$ {sender.balance} ! ")
        reciver.deposit(value)
        reciver.trnsaction_log.append(f" you have recived from {sender.owner} about {value} and your balance is now: {reciver.balance}")

transformation(firstCustomer, secoundCustomer, 1000)

firstCustomer.getBalance()
secoundCustomer.getBalance()

# ----------------
firstCustomer.get_transaction_history()
secoundCustomer.get_transaction_history()
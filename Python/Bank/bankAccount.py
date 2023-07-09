class BankAccount:
    def __init__(self, owner):
        self.owner = owner
        self.balance = 0
        self.limit_recive = 1000
        self.trnsaction_log = []

    def deposit(self, amount):
        self.balance += amount
        self.trnsaction_log.append(f'{self.owner} deposit:$ {amount}  and you balance is:$ {self.balance}')


    def getBalance(self):
        print(f"dear {self.owner}, your balance is:$ {self.balance}")

    def withraw(self, amount):
        if amount > self.balance + self.limit_recive:
            print(f'dear{self.owner}, unfortunetly your are not able to make this transformation')
            self.trnsaction_log.append(f'{self.owner} failed Withdraw:$ {amount} and you balance is:$ {self.balance} '
                                       f'also your Limit is:$ {self.limit_recive}')
        else:
            self.balance -= amount
            self.trnsaction_log.append(f'{self.owner} Withdraw:$ {amount}  and you balance is:$ {self.balance}')

    def get_transaction_history(self):
        print(f'dear {self.owner} here you have all the transaction for your account! ')
        print("\n".join(self.trnsaction_log))

        # for item in self.trnsaction_log:
        #     print(item)
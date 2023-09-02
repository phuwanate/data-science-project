##OPP Project : ATM
## objective : ATM at least 5 methods
## att: bank_name, balance(account), location, color, size
## function: deposit, withdraw,  Transfer, bill payment, bank book update

import datetime
import copy

## ATM class
class ATM:
    #inittialize attributes
    def __init__(self, bank_name, balance, location, color, size, trans_update):
        self.bank_name = bank_name
        self.balance = balance
        self.location = location
        self.color = color
        self.size = size
        self.trans_update = trans_update
        self.trans_hist = []

    def deposit(self):
        print("Deposit Money")
        print("--------------")
        amount = input("Please fill in the deposit amount (only digit) : \n")
        currency = input("Pelase fill your currency type (THB, USD, etc.): \n").upper()
        print("\nTransaction Details: ")
        print("Deposit Type: Cash")
        print(f"Amount Deposited: {amount}")
        print(f"Currency: {currency}")
        self.balance += float(amount)
        print(f"Balance: {self.balance} {currency}\n")
        print(f"Thank you for choosing {self.bank_name}")
        trans = {
            "timestamp": datetime.datetime.now(),
            "type": "Deposit Money",
            "amount": amount,
            "currency": currency,
            "balance": self.balance
        }
        self.trans_hist.append(trans)

    def withdraw(self):
        print("Withdraw Money")
        print("--------------")
        amount = input("Please fill in the withdraw amount (only digit): ")
        currency = input("Pelase fill your currency type (THB, USD, etc.): ").upper()
        
        if float(amount) > self.balance:
            print("Warning: Insufficient balance. Cannot withdraw more than your account balance.")
        else:
            self.balance -= float(amount)
            print(f"Withdrawal of {amount} successful.")
            print("\nTransaction Details: ")
            print("Withdraw Type: Cash")
            print(f"Amount withdrawn: {amount}")
            print(f"Currency: {currency}")
            print(f"Balance: {self.balance} {currency}\n")
            print(f"Thank you for choosing {self.bank_name}\n")
            trans = {
                "timestamp": datetime.datetime.now(),
                "type": "Withdraw Money",
                "amount": amount,
                "currency": currency,
                "balance": self.balance
            }
            self.trans_hist.append(trans)


    def transfer(self):
        print("Transfer Money")
        print("--------------")
        from_acc = input("Enter your account number: ")
        to_acc = input("Enter the recipient's account number: ")
        amount = input("Enter the amount to transfer: ")
        currency = input("Enter the currency type: ").upper()
        print("Confirm Transfer Details: ")
        print("--------------")
        print("From Account: ", from_acc)
        print("To Account: ", to_acc)
        print(f"Amount: {amount} {currency}")

        confirm = input("Confrim the transfer (yes/no)")

        if(confirm.lower() == "yes"):
            print("Transfer successful!")
            self.balance -= float(amount)
            trans = {
                "timestamp": datetime.datetime.now(),
                "type": "Transfer Money",
                "amount": -1 * float(amount),
                "currency": currency,
                "balance": self.balance
            }
            self.trans_hist.append(trans)
        else:
            print("Transfer canceled.")

    def pay_bill(self):
        print("Bill Payment")
        print("--------------")
        
        biller_name = input("Enter the name of the biller: ")
        acc_number = input("Enter your account number with the biller: ")
        amount = input("Enter the bill amount: ")
        currency = input("Input the currency type: ").upper()
        print("Confirm Bill Payment Details: ")
        print("--------------")
        print("Biller Name: ", biller_name)
        print("Account Number: ", acc_number)
        print(f"amount: {amount} {currency}")
    
        confirm = input("Confirm the bill payment (yes/no)\n")
        if confirm.lower() == "yes":
            print("Bill payment successful!")
            self.balance -= float(amount)
            trans = {
            "timestamp": datetime.datetime.now(),
            "type": "Transfer Money",
            "amount": -1 * float(amount),
            "currency": currency,
            "balance": self.balance
            }
            self.trans_hist.append(trans)
        else:
            print("Bill payment cancelled.")

    def update_book(self):
        self.trans_update = copy.deepcopy(self.trans_hist)
        print("Transaction History: ")
        print("---------------------")
        for i in self.trans_update:
            print("-----------")
            for key, value in i.items():
                print(f"'{key}': {value}")
            print("-----------")


## Build an object
#atm1 = ATM("Pig_bank", 10000, "suburb", "pink", "medium", 0)

## Test all methods
#atm1.deposit()
#atm1.withdraw()
#atm1.pay_bill()
#atm1.transfer()
#atm1.update_book()
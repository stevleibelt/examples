from datetime import datetime

#ref: https://www.youtube.com/watch?v=rq8cL2XMM5M&list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc&index=3
class BaseEmployee:

    def __init__(self, firstname : str, lastname : str):
        self.__firstname = firstname
        self.__lastname = lastname

    def fullname(self):
        return '{} {}'.format(self.__firstname, self.__lastname)

class PaidEmployee(BaseEmployee):

    def __init__(self, firstname : str, lastname : str, initial_payment : int):
        super().__init__(firstname, lastname)
        self.__initial_payment = initial_payment
        self.__raise_amount = 1.04

    def apply_raise(self):
        self.__initial_payment = int(self.__initial_payment * self.__raise_amount)
    
    @classmethod
    def set_raise_payment_amount(cls, amount):
        cls.__raise_amount = amount
    
    @classmethod
    def from_string(cls, string : str):
        firstname, lastname, payment = string.split('-')
        return cls(firstname, lastname, payment)

    @staticmethod
    def is_workday(day : datetime):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return False

PaidEmployee.set_raise_payment_amount(1.05)

pe_1 = PaidEmployee('Max', 'Power', 3000)
pe_2 = PaidEmployee('Victoria', 'Major', 4000)

firstname, lastname, payment = 'John-Doe-6000'.split('-')

pe_3 = PaidEmployee(firstname, lastname, payment)
pe_4 = PaidEmployee.from_string('Jane-Doe-8000')

print(pe_1.fullname())
print(pe_2.fullname())
print(pe_3.fullname())
print(pe_4.fullname())

current_datetime = datetime.now()
print(PaidEmployee.is_workday(current_datetime))

#uncomment if needed
#print(help(BaseEmployee))
#uncomment if needed
#print(help(PaidEmployee))


from datetime import datetime

#ref: https://www.youtube.com/watch?v=rq8cL2XMM5M&list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc&index=3
class BaseEmployee:

    def __init__(self, firstname : str, lastname : str):
        self._firstname = firstname
        self._lastname = lastname

    @property
    def fullname(self):
        return f"{self._firstname} {self._lastname}"

    @fullname.setter
    def fullname(self, fullname: str):
        self._firstname, self._lastname = fullname.split(" ")

    @fullname.deleter
    def fullname(self):
        self._firstname = None
        self._lastname = None

class PaidEmployee(BaseEmployee):

    def __init__(self, firstname : str, lastname : str, initial_payment : int):
        super().__init__(firstname, lastname)
        self._initial_payment = initial_payment
        self._raise_amount = 1.04

    #__repr__ is for debugging
    def __repr__(self):
        return f"PaidEmployee('{self._firstname}','{self._lastname}',{self._initial_payment})"

    def __str__(self):
        return f"'{self._firstname}' '{self._lastname}',{self._initial_payment}"

    def __add__(self, other):
        if isinstance(other, PaidEmployee):
            return self._initial_payment + other._initial_payment

        return NotImplemented

    def __len__(self):
        return len(self.fullname())

    def apply_raise(self):
        self._initial_payment = int(self._initial_payment * self._raise_amount)
    
    #classmethods are used to creae an instance of this class
    @classmethod
    def set_raise_payment_amount(cls, amount):
        cls._raise_amount = amount
    
    @classmethod
    def from_string(cls, string : str):
        firstname, lastname, payment = string.split("-")
        return cls(firstname, lastname, payment)

    @staticmethod
    def is_workday(day : datetime):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return False

def main() -> None:
    PaidEmployee.set_raise_payment_amount(1.05)

    pe_1 = PaidEmployee("Max", "Power", 3000)
    pe_1.fullname = "Hard Cora"
    pe_2 = PaidEmployee("Victoria", "Major", 4000)

    #this is working because of the @fullname.setter
    firstname, lastname, payment = "John-Doe-6000".split("-")

    pe_3 = PaidEmployee(firstname, lastname, payment)
    #this is working because of the @fullname.deleter
    del pe_3.fullname
    pe_4 = PaidEmployee.from_string("Jane-Doe-8000")

    print(":: Dump fullnames")
    #this works because of the @property
    print(pe_1.fullname)
    print(pe_2.fullname)
    print(pe_3.fullname)
    print(pe_4.fullname)
    print("")

    print(":: Is workday")
    current_datetime = datetime.now()
    print(PaidEmployee.is_workday(current_datetime))
    print("")

    print(":: Add")
    print(pe_1 + pe_2)
    print("")

    print(":: Check if this is an instance of")
    print(f"{isinstance(pe_1, PaidEmployee)=}")
    print("")

    print(":: Check if this is the same class name")
    if (type(pe_1).__name__ == PaidEmployee.__name__):
        print(f"{type(pe_1).__name__=} is equal to {PaidEmployee.__name__=}")
    else:
        print(f"{type(pe_1).__name__=} is not equal to {PaidEmployee.__name__=}")
    print("")

    print(":: Is subclass")
    print(issubclass(PaidEmployee, BaseEmployee))
    print("")

    print(":: rpr")
    print(repr(pe_1))
    print("")

    print(":: str")
    print(pe_1)
    print("")

    #uncomment if needed
    #print(help(BaseEmployee))
    #uncomment if needed
    #print(help(PaidEmployee))

if __name__ == "__main__":
    main()

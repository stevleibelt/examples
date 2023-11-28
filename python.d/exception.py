# ref: https://note.nkmk.me/en/python-try-except-else-finally/

class ExampleException(Exception):
    def __init__(self, message):
        self.message = message
        super().__init__(self.message)

class SecondException(ExampleException):
    pass

class ThirdException(ExampleException):
    pass

try:
    print('This is a message')
    raise ExampleException('This is an example exception message')
except (ExampleException, SecondException) as exception:
    print(f'An exception of class ExampleException occurred: {exception}')
except ThirdException:
    # We know this exception could be raised but we don't care
    pass
else:
    print('No exception where raised')
finally:
    print('This is the last line of output')


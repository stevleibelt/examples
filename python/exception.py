class ExampleException(Exception):
    def __init__(self, message):
        self.message = message
        super().__init__(self.message)

try:
    print('This is a message')
    raise ExampleException('This is an example exception message')
except ExampleException as exception:
    print(f'An exception of class ExampleException occurred: {exception}')


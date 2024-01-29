# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
####

def my_decorator(func):

#   wrapper function
#   we are using the nested function ability of python in here
#   nested/inner functions are scoped to the outer functions
#       they have access to the variables of the outer functions
#   inner functions are called automatically when the outer functions
#       are called
#   inner functions are not directly callable.
    def wrapper():
        print("Before the function call") # Extra processing before the function
        func() # Call the actual function being decorated
        print("After the function call") # Extra processing after the function
    return wrapper # Return the nested wrapper function

def my_function():
    print("Inside my function")

print(":: Calling not decorated function")
my_function()
print("")

# decorated function/function with applied decorator function
@my_decorator
def my_function():
    print("Inside my function")

print(":: Calling decorated function")
my_function()


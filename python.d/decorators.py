# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
####
####

# Decorator function
def my_decorator(func):

# Wrapper function
    def wrapper():
        print("Before the function call") # Extra processing before the function
        func() # Call the actual function being decorated
        print("After the function call") # Extra processing after the function
    return wrapper # Return the nested wrapper function

# Function to decorate
def my_function():
    print("Inside my function")

# Apply decorator on the function
@my_decorator
def my_function():
    print("Inside my function")

# Call the decorated function
my_function()

